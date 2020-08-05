package Modelo.dao;

import Modelo.Bean.DatoBean;
import Util.ConexionBD;
import java.util.ArrayList;
import java.sql.*;

public class SeccionDao {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    DatoBean objDatoBean = null;
    ArrayList<DatoBean> lista = null;

    public ArrayList<DatoBean> Listar() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select S.IDSECCION,S.GRADO,S.PAIS,S.FOROA,S.IDSALON,SA.NUMERO,SA.EDIFICIO,SA.FORO,ifnull(S.IDDOCENTE,'Sin docente') from seccion S inner join salon SA on S.IDSALON=SA.ID");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean obj = new DatoBean();
                obj.setBDDATOSeccion(rs.getInt(1));
                obj.setBDDATO1(rs.getString(2));
                obj.setBDDATO2(rs.getString(3));
                obj.setBDDATO3(rs.getString(4));
                obj.setBDDATOSalon(rs.getInt(5));
                obj.setBDDATO4(rs.getString(6));
                obj.setBDDATO5(rs.getString(7));
                obj.setBDDATO6(rs.getString(8));
                obj.setBDDATO7(rs.getString(9));
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
    public ArrayList<DatoBean> ListarSeccionLi() {
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
            if (cod.equals("2")) {
                pt = cn.prepareStatement("select S.IDSECCION,S.GRADO,S.PAIS,S.FOROA,S.IDSALON,SA.NUMERO,SA.EDIFICIO,SA.FORO,ifnull(S.IDDOCENTE,'Sin docente') from seccion S inner join salon SA on S.IDSALON=SA.ID WHERE  RTRIM(S.GRADO) like '%Primaria'");
            } else if (cod.equals("3")) {
                pt = cn.prepareStatement("select S.IDSECCION,S.GRADO,S.PAIS,S.FOROA,S.IDSALON,SA.NUMERO,SA.EDIFICIO,SA.FORO,ifnull(S.IDDOCENTE,'Sin docente') from seccion S inner join salon SA on S.IDSALON=SA.ID WHERE  RTRIM(S.GRADO) like '%Secundaria'");
            } else if (cod.equals("1")) {
                pt = cn.prepareStatement("select S.IDSECCION,S.GRADO,S.PAIS,S.FOROA,S.IDSALON,SA.NUMERO,SA.EDIFICIO,SA.FORO,ifnull(S.IDDOCENTE,'Sin docente') from seccion S inner join salon SA on S.IDSALON=SA.ID WHERE  RTRIM(S.GRADO) like '%Inicial'");
            } else {
                pt = cn.prepareStatement("select S.IDSECCION,S.GRADO,S.PAIS,S.FOROA,S.IDSALON,SA.NUMERO,SA.EDIFICIO,SA.FORO,ifnull(S.IDDOCENTE,'Sin docente') from seccion S inner join salon SA on S.IDSALON=SA.ID");
            }
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean obj = new DatoBean();
                obj.setBDDATOSeccion(rs.getInt(1));
                obj.setBDDATO1(rs.getString(2));
                obj.setBDDATO2(rs.getString(3));
                obj.setBDDATO3(rs.getString(4));
                obj.setBDDATOSalon(rs.getInt(5));
                obj.setBDDATO4(rs.getString(6));
                obj.setBDDATO5(rs.getString(7));
                obj.setBDDATO6(rs.getString(8));
                obj.setBDDATO7(rs.getString(9));
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

    public int Modificar(DatoBean objHorario) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("UPDATE `seccion` SET `GRADO`=?,`PAIS`=?,`IDSALON`=?,`IDDOCENTE`=? WHERE `IDSECCION`=?");
            pt.setString(1, objHorario.getBDDATO1());
            pt.setString(2, objHorario.getBDDATO2());
            pt.setInt(3, objHorario.getBDDATOSalon());
            pt.setString(4, objHorario.getBDDATO3());
            pt.setInt(5, objHorario.getBDDATOSeccion());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int Eliminar(DatoBean objHorario) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement(" DELETE FROM horario WHERE IDHORARIO=? ");
            pt.setInt(1, objHorario.getBDDATOHorario());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int Insertar(DatoBean objHorario) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO `seccion`( `GRADO`, `PAIS`,`IDSALON`, `IDDOCENTE`) VALUES (?,?,?,?)");
            pt.setString(1, objHorario.getBDDATO1());
            pt.setString(2, objHorario.getBDDATO2());
            pt.setString(3, objHorario.getBDDATO3());
            pt.setString(4, objHorario.getBDDATO4());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public DatoBean SeccionCodigo(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement(" SELECT seccion.IDSECCION from seccion INNER JOIN matricula ON seccion.IDSECCION=matricula.IDSECCION_MATRICULA INNER JOIN alumno ON matricula.IDALUMNO_MATRICULA=alumno.IDALUMNO INNER JOIN persona ON alumno.IDPERSONA=persona.IDPERSONA WHERE persona.IDPERSONA=? ");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            if (rs.next()) {
                objDatoBean = new DatoBean();
                objDatoBean.setBDDATOSeccion(rs.getInt(1));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return objDatoBean;
    }

    public ArrayList<DatoBean> MostrarHorarioA(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT docente.IDDOCENTE,persona.NOMBRE,persona.APELLIDO,persona.APELLIDOM,persona.FOTO,docente.CURSO,seccion.IDSECCION,seccion.SECCION,seccion.NIVEL,seccion.SALON,seccion.TURNO,horario.DIA,horario.HORA FROM seccion INNER JOIN horario ON seccion.IDSECCION=horario.IDSECCION INNER JOIN docente ON horario.IDDOCENTE=docente.IDDOCENTE INNER JOIN persona ON docente.IDPERSONA=persona.IDPERSONA WHERE seccion.IDSECCION=? order by horario.DIA");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                objDatoBean = new DatoBean();
                objDatoBean.setBDDATODocente(rs.getInt(1));
                objDatoBean.setBDDATO1(rs.getString(2));
                objDatoBean.setBDDATO2(rs.getString(3));
                objDatoBean.setBDDATO3(rs.getString(4));
                objDatoBean.setBDDATO4(rs.getString(5));
                objDatoBean.setBDDATO5(rs.getString(6));
                objDatoBean.setBDDATO6(rs.getString(7));
                objDatoBean.setBDDATO7(rs.getString(8));
                objDatoBean.setBDDATO8(rs.getString(9));
                objDatoBean.setBDDATO9(rs.getString(10));
                objDatoBean.setBDDATO10(rs.getString(11));
                objDatoBean.setBDDATO11(rs.getString(12));
                objDatoBean.setBDDATO12(rs.getString(13));
                lista.add(objDatoBean);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public ArrayList<DatoBean> MostrarHorarioD(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT docente.IDDOCENTE,persona.FOTO,persona.NOMBRE,persona.APELLIDO,persona.APELLIDOM,docente.CURSO,seccion.IDSECCION,seccion.SECCION,seccion.NIVEL,seccion.SALON,seccion.TURNO,horario.DIA,horario.HORA FROM seccion INNER JOIN horario ON seccion.IDSECCION=horario.IDSECCION INNER JOIN docente ON horario.IDDOCENTE=docente.IDDOCENTE INNER JOIN persona ON docente.IDPERSONA=persona.IDPERSONA WHERE persona.IDPERSONA=? order by horario.DIA");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                objDatoBean = new DatoBean();
                objDatoBean.setBDDATODocente(rs.getInt(1));
                objDatoBean.setBDDATO1(rs.getString(2));
                objDatoBean.setBDDATO2(rs.getString(3));
                objDatoBean.setBDDATO3(rs.getString(4));
                objDatoBean.setBDDATO4(rs.getString(5));
                objDatoBean.setBDDATO5(rs.getString(6));
                objDatoBean.setBDDATO6(rs.getString(7));
                objDatoBean.setBDDATO7(rs.getString(8));
                objDatoBean.setBDDATO8(rs.getString(9));
                objDatoBean.setBDDATO9(rs.getString(10));
                objDatoBean.setBDDATO10(rs.getString(11));
                objDatoBean.setBDDATO11(rs.getString(12));
                objDatoBean.setBDDATO12(rs.getString(13));
                lista.add(objDatoBean);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public int GenerarCodigoSeccion() {
        int i = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT MAX(IDHORARIO) FROM horario");
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
