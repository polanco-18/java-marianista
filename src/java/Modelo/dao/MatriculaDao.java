package Modelo.dao;

import Modelo.Bean.DatoBean;
import Util.ConexionBD;
import java.util.ArrayList;
import java.sql.*;

public class MatriculaDao {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<DatoBean> lista = null;

    public ArrayList<DatoBean> ListarMatricula() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select M.IDMATRICULA, A.IDALUMNO,P.NOMBRE,P.APELLIDO,P.APELLIDOM,P.FOTO,TIMESTAMPDIFF(year,P.FECHA,CURDATE())as edad,P.TELEFONO, S.GRADO,M.NOMBRE,M.APELLIDO,M.TELEFONO,M.FECHA from matricula M join alumno A on M.IDALUMNO=A.IDALUMNO JOIN persona P on P.IDPERSONA=A.IDPERSONA join seccion S on S.IDSECCION=M.IDSECCION");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objAlumno = new DatoBean();
                objAlumno.setBDDATOMatricula(rs.getInt(1));
                objAlumno.setBDDATOAlumno(rs.getInt(2));
                objAlumno.setBDDATO1(rs.getString(3));
                objAlumno.setBDDATO2(rs.getString(4));
                objAlumno.setBDDATO3(rs.getString(5));
                objAlumno.setBDDATO4(rs.getString(6));
                objAlumno.setBDDATO5(rs.getString(7));
                objAlumno.setBDDATO6(rs.getString(8));
                objAlumno.setBDDATO7(rs.getString(9));
                objAlumno.setBDDATO8(rs.getString(10));
                objAlumno.setBDDATO9(rs.getString(11));
                objAlumno.setBDDATO10(rs.getString(12));
                objAlumno.setBDDATO11(rs.getString(13));
                lista.add(objAlumno);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public ArrayList<DatoBean> ListarSeccion() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT S.IDSECCION, S.GRADO, S.PAIS, (SA.FORO-S.FOROA) as ForoLibre FROM seccion S inner join salon SA on SA.ID=S.IDSALON WHERE S.FOROA <= SA.FORO order by S.GRADO");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean obj = new DatoBean();
                obj.setBDDATOSeccion(rs.getInt(1));
                obj.setBDDATO1(rs.getString(2));
                obj.setBDDATO2(rs.getString(3));
                obj.setBDDATO3(rs.getString(4));
                lista.add(obj);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return lista;
    }

    public ArrayList<DatoBean> MostrarBuscar(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select M.IDMATRICULA, A.IDALUMNO,P.NOMBRE,P.APELLIDO,P.APELLIDOM,P.FOTO,TIMESTAMPDIFF(year,P.FECHA,CURDATE())as edad,P.TELEFONO, S.GRADO,M.NOMBRE,M.APELLIDO,M.TELEFONO,M.FECHA from matricula M join alumno A on M.IDALUMNO=A.IDALUMNO JOIN persona P on P.IDPERSONA=A.IDPERSONA join seccion S on S.IDSECCION=M.IDSECCION where P.NOMBRE like ? or P.APELLIDO  like ? or P.APELLIDOM  like ?");
            cod += "%";
            pt.setString(1, cod);
            pt.setString(2, cod);
            pt.setString(3, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objAlumno = new DatoBean();
                objAlumno.setBDDATOMatricula(rs.getInt(1));
                objAlumno.setBDDATOAlumno(rs.getInt(2));
                objAlumno.setBDDATO1(rs.getString(3));
                objAlumno.setBDDATO2(rs.getString(4));
                objAlumno.setBDDATO3(rs.getString(5));
                objAlumno.setBDDATO4(rs.getString(6));
                objAlumno.setBDDATO5(rs.getString(7));
                objAlumno.setBDDATO6(rs.getString(8));
                objAlumno.setBDDATO7(rs.getString(9));
                objAlumno.setBDDATO8(rs.getString(10));
                objAlumno.setBDDATO9(rs.getString(11));
                objAlumno.setBDDATO10(rs.getString(12));
                objAlumno.setBDDATO11(rs.getString(13));
                lista.add(objAlumno);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public int Insertar(DatoBean objMatricula) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO `matricula`( `IDALUMNO`, `IDSECCION`, `IDCATEGORIA`, `FECHA`, `NOMBRE`, `APELLIDO`, `TELEFONO`, `DNI`)  VALUES (?,?,?,?,?,?,?,?)");
            pt.setInt(1, objMatricula.getBDDATOAlumno());
            pt.setInt(2, objMatricula.getBDDATOSeccion());
            pt.setInt(3, objMatricula.getBDDATOCategoria());
            pt.setString(4, objMatricula.getBDDATO14());
            pt.setString(5, objMatricula.getBDDATO15());
            pt.setString(6, objMatricula.getBDDATO16());
            pt.setString(7, objMatricula.getBDDATO17());
            pt.setString(8, objMatricula.getBDDATO18());
            estado = pt.executeUpdate();
            if (estado != 0) {
                cn = ConexionBD.getConexionBD();
                pt = cn.prepareStatement("UPDATE `seccion` SET `FOROA`=(FOROA+1) WHERE `IDSECCION`=?");
                pt.setInt(1, objMatricula.getBDDATOSeccion());
                estado = pt.executeUpdate();
            }
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

}
