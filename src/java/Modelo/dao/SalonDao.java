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
public class SalonDao {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<DatoBean> lista = null;

    public ArrayList<DatoBean> Listar() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT `ID`, `NUMERO`, `EDIFICIO`, `FORO` FROM `salon`");
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


    public ArrayList<DatoBean> Buscar(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT `ID`, `NUMERO`, `EDIFICIO`, `FORO` FROM `salon` where NUMERO like ? or ID like ? or EDIFICIO like ? or `FORO` like ?");
            cod += "%";
            pt.setString(1, cod);
            pt.setString(2, cod);
            pt.setString(3, cod);
            pt.setString(4, cod);
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

    public int Modificar(DatoBean obj) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("UPDATE `salon` SET `NUMERO`=?,`EDIFICIO`=?,`FORO`=? WHERE `ID`=?");
            pt.setString(1, obj.getBDDATO1());
            pt.setString(2, obj.getBDDATO2());
            pt.setString(3, obj.getBDDATO3());
            pt.setInt(4, obj.getBDDATOSalon());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int Insertar(DatoBean obj) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO `salon`(`NUMERO`, `EDIFICIO`, `FORO`) VALUES (?,?,?)");
            pt.setString(1, obj.getBDDATO1());
            pt.setString(2, obj.getBDDATO2());
            pt.setString(3, obj.getBDDATO3());
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
            pt = cn.prepareStatement(" Delete from  salon where ID=?  ;  ");
            pt.setInt(1, objDocente.getBDDATOSalon());
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
