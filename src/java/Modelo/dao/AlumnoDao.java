package Modelo.dao;

import Modelo.Bean.DatoBean;
import Util.ConexionBD;
import java.util.ArrayList;
import java.sql.*;

public class AlumnoDao {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<DatoBean> lista = null;

    public ArrayList<DatoBean> Listar() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select A.IDALUMNO,P.IDPERSONA,P.NOMBRE,P.APELLIDO,P.APELLIDOM,TIMESTAMPDIFF(year,P.fecha,CURDATE())as edad,P.TELEFONO, P.FOTO, P.CORREO from alumno A JOIN persona P on P.IDPERSONA=A.IDPERSONA");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objAlumno = new DatoBean();
                objAlumno.setBDDATOAlumno(rs.getInt(1));
                objAlumno.setBDDATOPersona(rs.getInt(2));
                objAlumno.setBDDATO1(rs.getString(3));
                objAlumno.setBDDATO2(rs.getString(4));
                objAlumno.setBDDATO3(rs.getString(5));
                objAlumno.setBDDATO4(rs.getString(6));
                objAlumno.setBDDATO5(rs.getString(7));
                objAlumno.setBDDATO6(rs.getString(8));
                objAlumno.setBDDATO7(rs.getString(9));
                lista.add(objAlumno);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public ArrayList<DatoBean> Buscar(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select A.IDALUMNO,P.NOMBRE,P.APELLIDO,P.APELLIDOM,TIMESTAMPDIFF(year,P.fecha,CURDATE())as edad,P.TELEFONO, P.FOTO, P.CORREO from alumno A JOIN persona P on P.IDPERSONA=A.IDPERSONA where P.NOMBRE like ? or P.APELLIDO like ? or P.APELLIDOM like ?;");
            cod += "%";
            pt.setString(1, cod);
            pt.setString(2, cod);
            pt.setString(3, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objAlumno = new DatoBean();
                objAlumno.setBDDATOAlumno(rs.getInt(1));
                objAlumno.setBDDATO1(rs.getString(2));
                objAlumno.setBDDATO2(rs.getString(3));
                objAlumno.setBDDATO3(rs.getString(4));
                objAlumno.setBDDATO4(rs.getString(5));
                objAlumno.setBDDATO5(rs.getString(6));
                objAlumno.setBDDATO6(rs.getString(7));
                objAlumno.setBDDATO7(rs.getString(8));
                lista.add(objAlumno);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
     public ArrayList<DatoBean> BuscarAlumnoM(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select A.IDALUMNO,P.NOMBRE,P.APELLIDO,P.APELLIDOM,TIMESTAMPDIFF(year,P.fecha,CURDATE())as edad,P.TELEFONO, P.FOTO, P.CORREO from alumno A JOIN persona P on P.IDPERSONA=A.IDPERSONA where P.IDPERSONA=?");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objAlumno = new DatoBean();
                objAlumno.setBDDATOAlumno(rs.getInt(1));
                objAlumno.setBDDATO1(rs.getString(2));
                objAlumno.setBDDATO2(rs.getString(3));
                objAlumno.setBDDATO3(rs.getString(4));
                objAlumno.setBDDATO4(rs.getString(5));
                objAlumno.setBDDATO5(rs.getString(6));
                objAlumno.setBDDATO6(rs.getString(7));
                objAlumno.setBDDATO7(rs.getString(8));
                lista.add(objAlumno);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public int Insertar(DatoBean objAlumno) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO `alumno`(`IDALUMNO`, `IDPERSONA`) VALUES (?,?);");
            pt.setInt(1, objAlumno.getBDDATOAlumno());
            pt.setInt(2, objAlumno.getBDDATOPersona());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int GenerarCodigoAlumno() {
        int i = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT MAX(IDALUMNO) FROM alumno;");
            rs = pt.executeQuery();
            if (rs.next()) {
                i = rs.getInt(1) + 1;
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return i;
    }
}
