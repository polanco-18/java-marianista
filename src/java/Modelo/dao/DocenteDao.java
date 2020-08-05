package Modelo.dao;

import Modelo.Bean.DatoBean;
import Util.ConexionBD;
import java.util.ArrayList;
import java.sql.*;

public class DocenteDao {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<DatoBean> lista = null;

    public ArrayList<DatoBean> ListarDocente() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select D.IDDOCENTE,P.IDPERSONA,P.FOTO, P.NOMBRE,P.APELLIDO,P.APELLIDOM,P.CORREO,P.TELEFONO from docente D inner join persona P on D.IDPERSONA=P.IDPERSONA");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objDocente = new DatoBean();
                objDocente.setBDDATODocente(rs.getInt(1));
                objDocente.setBDDATOPersona(rs.getInt(2));
                objDocente.setBDDATO1(rs.getString(3));
                objDocente.setBDDATO2(rs.getString(4));
                objDocente.setBDDATO3(rs.getString(5));
                objDocente.setBDDATO4(rs.getString(6));
                objDocente.setBDDATO5(rs.getString(7));
                objDocente.setBDDATO6(rs.getString(8));
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
            pt = cn.prepareStatement("select D.IDDOCENTE,P.FOTO, P.NOMBRE,P.APELLIDO,P.APELLIDOM,P.CORREO,P.TELEFONO from docente D inner join persona P on D.IDPERSONA=P.IDPERSONA where P.NOMBRE like ? or P.APELLIDO like ? or P.APELLIDOM like ?");
            cod += "%";
            pt.setString(1, cod);
            pt.setString(2, cod);
            pt.setString(3, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objDocente = new DatoBean();
                objDocente.setBDDATODocente(rs.getInt(1));
                objDocente.setBDDATO1(rs.getString(2));
                objDocente.setBDDATO2(rs.getString(3));
                objDocente.setBDDATO3(rs.getString(4));
                objDocente.setBDDATO4(rs.getString(5));
                objDocente.setBDDATO5(rs.getString(6));
                objDocente.setBDDATO6(rs.getString(7));
                lista.add(objDocente);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public int Insertar(DatoBean objDocente) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO `docente`(`IDPERSONA`) VALUES (?)");
            pt.setInt(1, objDocente.getBDDATOPersona());
            estado = pt.executeUpdate();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int GenerarCodigoDocente() {
        int i = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT MAX(IDDOCENTE) FROM docente;");
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
