package Modelo.dao;

import Modelo.Bean.DatoBean;
import Util.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CursoDao {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<DatoBean> lista = null;

    public ArrayList<DatoBean> Listar() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT `IDCURSO`,ifnull(IDDOCENTE,'Sin Docente'),`CURSO`,`DETALLE`from curso");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objDocente = new DatoBean();
                objDocente.setBDDATOCurso(rs.getInt(1));
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
    public ArrayList<DatoBean> ListarCursoD() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT C.IDCURSO,P.NOMBRE,P.APELLIDO,P.APELLIDOM,C.CURSO  from curso C INNER join docente D on D.IDDOCENTE=C.IDDOCENTE inner join persona P on P.IDPERSONA=D.IDPERSONA");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objDocente = new DatoBean();
                objDocente.setBDDATOCurso(rs.getInt(1));
                objDocente.setBDDATO1(rs.getString(2));
                objDocente.setBDDATO2(rs.getString(3));
                objDocente.setBDDATO3(rs.getString(4));
                objDocente.setBDDATO4(rs.getString(5));
                lista.add(objDocente);
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
            pt = cn.prepareStatement("SELECT `IDCURSO`,ifnull(IDDOCENTE,'Sin Docente'),`CURSO`,`DETALLE`from curso where CURSO like ? or IDDOCENTE like ?");
            cod += "%";
            pt.setString(1, cod);
            pt.setString(2, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objDocente = new DatoBean();
                objDocente.setBDDATOCurso(rs.getInt(1));
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

    public ArrayList<DatoBean> DocentesD(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select D.IDDOCENTE,P.NOMBRE,p.APELLIDO from docente D inner join persona P on P.IDPERSONA=D.IDPERSONA order by D.IDDOCENTE=? DESC");
            pt.setString(1, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objDocente = new DatoBean();
                objDocente.setBDDATODocente(rs.getInt(1));
                objDocente.setBDDATO1(rs.getString(2));
                objDocente.setBDDATO2(rs.getString(3));
                lista.add(objDocente);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public int Modificar(DatoBean objDocente) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("UPDATE `curso` SET `IDDOCENTE`=?,`CURSO`=?,`DETALLE`=? WHERE `IDCURSO`=?");
            pt.setInt(1, objDocente.getBDDATODocente());
            pt.setString(2, objDocente.getBDDATO1());
            pt.setString(3, objDocente.getBDDATO2());
            pt.setInt(4, objDocente.getBDDATOCurso());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int Insertar(DatoBean objDocente) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO `curso`( `CURSO`, `DETALLE`,IDDOCENTE) VALUES (?,?,?)");
            pt.setString(1, objDocente.getBDDATO1());
            pt.setString(2, objDocente.getBDDATO2());
            pt.setString(3, objDocente.getBDDATO3());
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
            pt = cn.prepareStatement(" Delete from  curso  where IDCURSO=?  ;  ");
            pt.setInt(1, objDocente.getBDDATOCurso());
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
