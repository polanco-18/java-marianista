/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.dao;

import Modelo.Bean.DatoBean;
import Util.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Fernando
 */
public class HorarioDao {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<DatoBean> lista = null;

    public ArrayList<DatoBean> Listar() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT H.IDHORARIO,S.IDSECCION,S.GRADO,S.PAIS,(SA.FORO-S.FOROA) ,SA.ID,SA.NUMERO,SA.EDIFICIO,SA.FORO,C.IDDOCENTE,P.FOTO,P.NOMBRE,P.APELLIDO,P.APELLIDOM,P.CORREO,C.IDCURSO,C.CURSO,H.DIA,H.HORA,H.HORAFIN FROM horario H inner join seccion S on S.IDSECCION=H.IDSECCION inner join salon SA on SA.ID=S.IDSALON inner join curso C on C.IDCURSO=H.IDCURSO inner JOIN docente D on D.IDDOCENTE=C.IDDOCENTE inner join persona P on P.IDPERSONA=D.IDPERSONA");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean obj = new DatoBean();
                obj.setBDDATOHorario(rs.getInt(1));
                obj.setBDDATOSeccion(rs.getInt(2));
                obj.setBDDATO1(rs.getString(3));
                obj.setBDDATO2(rs.getString(4));
                obj.setBDDATO3(rs.getString(5));
                obj.setBDDATOSalon(rs.getInt(6));
                obj.setBDDATO4(rs.getString(7));
                obj.setBDDATO5(rs.getString(8));
                obj.setBDDATO6(rs.getString(9));
                obj.setBDDATODocente(rs.getInt(10));
                obj.setBDDATO7(rs.getString(11));
                obj.setBDDATO8(rs.getString(12));
                obj.setBDDATO9(rs.getString(13));
                obj.setBDDATO10(rs.getString(14));
                obj.setBDDATO11(rs.getString(15));
                obj.setBDDATOCurso(rs.getInt(16));
                obj.setBDDATO12(rs.getString(17));
                obj.setBDDATO13(rs.getString(18));
                obj.setBDDATO14(rs.getString(19));
                obj.setBDDATO15(rs.getString(20));
                lista.add(obj);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public ArrayList<DatoBean> ListarHorarioN(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT H.IDHORARIO,P.FOTO,P.NOMBRE,P.APELLIDO,P.APELLIDOM,C.CURSO,H.DIA,H.HORA,H.HORAFIN,S.IDSECCION FROM horario H inner join seccion S on S.IDSECCION=H.IDSECCION inner join salon SA on SA.ID=S.IDSALON inner join curso C on C.IDCURSO=H.IDCURSO inner JOIN docente D on D.IDDOCENTE=C.IDDOCENTE inner join persona P on P.IDPERSONA=D.IDPERSONA where S.IDSECCION=? order by H.DIA");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean obj = new DatoBean();
                obj.setBDDATOHorario(rs.getInt(1));
                obj.setBDDATO1(rs.getString(2));
                obj.setBDDATO2(rs.getString(3));
                obj.setBDDATO3(rs.getString(4));
                obj.setBDDATO4(rs.getString(5));
                obj.setBDDATO5(rs.getString(6));
                obj.setBDDATO6(rs.getString(7));
                obj.setBDDATO7(rs.getString(8));
                obj.setBDDATO8(rs.getString(9));
                obj.setBDDATO9(rs.getString(10));
                lista.add(obj);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public ArrayList<DatoBean> ListarSalonD() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT S.ID,S.NUMERO ,S.EDIFICIO ,S.FORO FROM salon S left join seccion SE on SE.IDSALON=S.ID where SE.IDSALON is null");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objDocente = new DatoBean();
                objDocente.setBDDATOSalon(rs.getInt(1));
                objDocente.setBDDATO1(rs.getString(2));
                objDocente.setBDDATO2(rs.getString(3));
                objDocente.setBDDATO3(rs.getString(4));
                lista.add(objDocente);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public ArrayList<DatoBean> ListarModificar(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT `ID`, `NUMERO`, `EDIFICIO`, `FORO` FROM `salon` order by ID=? DESC");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objDocente = new DatoBean();
                objDocente.setBDDATOSalon(rs.getInt(1));
                objDocente.setBDDATO1(rs.getString(2));
                objDocente.setBDDATO2(rs.getString(3));
                objDocente.setBDDATO3(rs.getString(4));
                lista.add(objDocente);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public String CodAlumno(String cod) {
        String Resultado="1";
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select IDALUMNO from alumno where IDPERSONA=?");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            if (rs.next()) {
                Resultado = rs.getString(1);
                System.out.println("resultado " + Resultado);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return Resultado;
    }
    public ArrayList<DatoBean> HorarioAlumno(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select H.IDHORARIO,S.GRADO,S.PAIS,PE.FOTO,PE.NOMBRE,PE.APELLIDO,SA.NUMERO,SA.EDIFICIO,C.CURSO,H.DIA,H.HORA,H.HORAFIN from horario H inner join curso C on C.IDCURSO=H.IDCURSO inner join docente D on D.IDDOCENTE=C.IDDOCENTE INNER join persona PE on PE.IDPERSONA=D.IDPERSONA inner join seccion S on H.IDSECCION=S.IDSECCION  inner join salon SA on SA.ID=S.IDSALON inner join matricula M on M.IDSECCION=S.IDSECCION inner join alumno A on A.IDALUMNO=M.IDALUMNO where A.IDALUMNO=?");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean obj = new DatoBean();
                obj.setBDDATOHorario(rs.getInt(1));
                obj.setBDDATO1(rs.getString(2));
                obj.setBDDATO2(rs.getString(3));
                obj.setBDDATO3(rs.getString(4));
                obj.setBDDATO4(rs.getString(5));
                obj.setBDDATO5(rs.getString(6));
                obj.setBDDATO6(rs.getString(7));
                obj.setBDDATO7(rs.getString(8));
                obj.setBDDATO8(rs.getString(9));
                obj.setBDDATO9(rs.getString(10));
                obj.setBDDATO10(rs.getString(11));
                obj.setBDDATO11(rs.getString(12));
                lista.add(obj);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    public ArrayList<DatoBean> HorarioDocente(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select H.IDHORARIO,S.GRADO,S.PAIS,SA.NUMERO,SA.EDIFICIO,C.CURSO,H.DIA,H.HORA,H.HORAFIN from horario H inner join curso C on C.IDCURSO=H.IDCURSO inner join docente D on D.IDDOCENTE=C.IDDOCENTE INNER join persona PE on PE.IDPERSONA=D.IDPERSONA inner join seccion S on H.IDSECCION=S.IDSECCION inner join salon SA on SA.ID=S.IDSALON where PE.IDPERSONA=?");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean obj = new DatoBean();
                obj.setBDDATOHorario(rs.getInt(1));
                obj.setBDDATO1(rs.getString(2));
                obj.setBDDATO2(rs.getString(3));
                obj.setBDDATO3(rs.getString(4));
                obj.setBDDATO4(rs.getString(5));
                obj.setBDDATO5(rs.getString(6));
                obj.setBDDATO6(rs.getString(7));
                obj.setBDDATO7(rs.getString(8));
                obj.setBDDATO8(rs.getString(9));
                lista.add(obj);
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
            pt = cn.prepareStatement("SELECT H.IDHORARIO,S.IDSECCION,S.GRADO,S.PAIS,S.FOROA,SA.ID,SA.NUMERO,SA.EDIFICIO,SA.FORO,C.IDDOCENTE,P.FOTO,P.NOMBRE,P.APELLIDO,P.APELLIDOM,P.CORREO,C.IDCURSO,C.CURSO,H.DIA,H.HORA,H.HORAFIN FROM horario H inner join seccion S on S.IDSECCION=H.IDSECCION inner join salon SA on SA.ID=S.IDSALON inner join curso C on C.IDCURSO=H.IDCURSO inner JOIN docente D on D.IDDOCENTE=C.IDDOCENTE inner join persona P on P.IDPERSONA=D.IDPERSONA where S.IDSECCION=?");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean obj = new DatoBean();
                obj.setBDDATOHorario(rs.getInt(1));
                obj.setBDDATOSeccion(rs.getInt(2));
                obj.setBDDATO1(rs.getString(3));
                obj.setBDDATO2(rs.getString(4));
                obj.setBDDATO3(rs.getString(5));
                obj.setBDDATOSalon(rs.getInt(6));
                obj.setBDDATO4(rs.getString(7));
                obj.setBDDATO5(rs.getString(8));
                obj.setBDDATO6(rs.getString(9));
                obj.setBDDATODocente(rs.getInt(10));
                obj.setBDDATO7(rs.getString(11));
                obj.setBDDATO8(rs.getString(12));
                obj.setBDDATO9(rs.getString(13));
                obj.setBDDATO10(rs.getString(14));
                obj.setBDDATO11(rs.getString(15));
                obj.setBDDATOCurso(rs.getInt(16));
                obj.setBDDATO12(rs.getString(17));
                obj.setBDDATO13(rs.getString(18));
                obj.setBDDATO14(rs.getString(19));
                obj.setBDDATO15(rs.getString(20));
                lista.add(obj);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public int Insertar(DatoBean obj) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO `horario`( `IDSECCION`, `IDCURSO`, `DIA`, `HORA`, `HORAFIN`)  VALUES (?,?,?,?,?)");
            pt.setString(1, obj.getBDDATO1());
            pt.setString(2, obj.getBDDATO2());
            pt.setString(3, obj.getBDDATO3());
            pt.setString(4, obj.getBDDATO4());
            pt.setString(5, obj.getBDDATO5());
            estado = pt.executeUpdate();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int Eliminar(DatoBean objDocente) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement(" Delete from horario where IDHORARIO=?  ;  ");
            pt.setInt(1, objDocente.getBDDATOHorario());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }
}
