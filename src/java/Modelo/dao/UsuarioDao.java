package Modelo.dao;

import Modelo.Bean.DatoBean;
import Util.ConexionBD;
import java.util.ArrayList;
import java.sql.*;

public class UsuarioDao {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<DatoBean> listadoUsuario = null;
    DatoBean objDatoBean = null;
    ArrayList<DatoBean> lista = null;

    public int Sesion(DatoBean objUsuarioB) {
        int flag = 0;
        try {
            String sentencia = "";
            sentencia = "SELECT IDTIPO FROM usuario WHERE USUARIO=? AND CLAVE=?";
            ConexionBD objUsuario = new ConexionBD();
            cn = objUsuario.getConexionBD();
            pt = cn.prepareStatement(sentencia);
            pt.setString(1, objUsuarioB.getBDDATOUsuario1());
            pt.setString(2, objUsuarioB.getBDDATOContraseña());
            rs = pt.executeQuery();
            while (rs.next()) {
                flag = rs.getInt(1);
            }
            pt.close();
            rs.close();
            cn.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return flag;
    }

    public int Sesion1(DatoBean objUsuarioB) {
        int flag = 0;
        try {
            String sentencia = "";
            sentencia = "SELECT IDTIPO FROM usuario WHERE IDPERSONA=?";
            ConexionBD objUsuario = new ConexionBD();
            cn = objUsuario.getConexionBD();
            pt = cn.prepareStatement(sentencia);
            pt.setString(1, objUsuarioB.getBDDATOUsuario1());
            rs = pt.executeQuery();
            while (rs.next()) {
                flag = rs.getInt(1);
            }
            pt.close();
            rs.close();
            cn.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return flag;
    }

    public String VContraseña(DatoBean objUsuarioB) {
        String flag = "";
        try {
            String sentencia = "";
            sentencia = "SELECT CLAVE FROM usuario WHERE IDPERSONA=?";
            ConexionBD objUsuario = new ConexionBD();
            cn = objUsuario.getConexionBD();
            pt = cn.prepareStatement(sentencia);
            pt.setString(1, objUsuarioB.getBDDATOUsuario1());
            rs = pt.executeQuery();
            while (rs.next()) {
                flag = rs.getString(1);
            }
            pt.close();
            rs.close();
            cn.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return flag;
    }

    public DatoBean cargarDatos(DatoBean objDatoBean) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT P.IDPERSONA, P.NOMBRE, P.APELLIDO, P.APELLIDOM,P.FOTO, P.FECHA, P.DNI, P.SEXO, P.DIRECCION,P.CORREO,P.TELEFONO FROM usuario U INNER JOIN persona P ON U.IDPERSONA=P.IDPERSONA WHERE U.USUARIO= ?");
            pt.setString(1, objDatoBean.getBDDATOUsuario1());
            rs = pt.executeQuery();
            if (rs.next()) {
                objDatoBean = new DatoBean();
                objDatoBean.setBDDATOPersona(rs.getInt(1));
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
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return objDatoBean;
    }

    public DatoBean cargarDatos2(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT IDPERSONA, NOMBRE, APELLIDO, APELLIDOM, FOTO, TIMESTAMPDIFF(year,`fecha`,CURDATE())as edad, FECHA, DNI, SEXO, DIRECCION, CORREO, TELEFONO,`DISTRITO` ,`ESTADO_CIVIL`, `PROVINCIA`, `DEPARTAMENTO` FROM persona WHERE IDPERSONA=?");
            pt.setString(1, cod);
            rs = pt.executeQuery();

            if (rs.next()) {
                objDatoBean = new DatoBean();
                objDatoBean.setBDDATOPersona(rs.getInt(1));
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
                objDatoBean.setBDDATO13(rs.getString(14));
                objDatoBean.setBDDATO14(rs.getString(15));
                objDatoBean.setBDDATO15(rs.getString(16));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return objDatoBean;
    }

    public ArrayList<DatoBean> ListarUsuario() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT usuario.IDUSUARIO,usuario.USUARIO,usuario.CLAVE,usuario.IDTIPO,persona.IDPERSONA,persona.NOMBRE,persona.APELLIDO,persona.APELLIDOM,persona.FOTO from usuario INNER JOIN persona on usuario.IDPERSONA=persona.IDPERSONA");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objUsuario = new DatoBean();
                objUsuario.setBDDATOUsuario(rs.getInt(1));
                objUsuario.setBDDATO1(rs.getString(2));
                objUsuario.setBDDATO2(rs.getString(3));
                objUsuario.setBDDATO3(rs.getString(4));
                objUsuario.setBDDATOPersona(rs.getInt(5));
                objUsuario.setBDDATO5(rs.getString(6));
                objUsuario.setBDDATO6(rs.getString(7));
                objUsuario.setBDDATO7(rs.getString(8));
                objUsuario.setBDDATO8(rs.getString(9));
                lista.add(objUsuario);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public ArrayList<DatoBean> MostrarBuscar(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT u.IDUSUARIO,u.USUARIO,u.CLAVE,u.IDTIPO,u.IDPERSONA,p.NOMBRE,p.APELLIDO,p.APELLIDOM,p.FOTO from usuario u INNER JOIN persona p on u.IDPERSONA=p.IDPERSONA where p.NOMBRE like ? or p.APELLIDO like ? or p.APELLIDOM like ?");
            cod += "%";
            pt.setString(1, cod);
            pt.setString(2, cod);
            pt.setString(3, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objUsuario = new DatoBean();
                objUsuario.setBDDATOUsuario(rs.getInt(1));
                objUsuario.setBDDATO1(rs.getString(2));
                objUsuario.setBDDATO2(rs.getString(3));
                objUsuario.setBDDATO3(rs.getString(4));
                objUsuario.setBDDATOPersona(rs.getInt(5));
                objUsuario.setBDDATO5(rs.getString(6));
                objUsuario.setBDDATO6(rs.getString(7));
                objUsuario.setBDDATO7(rs.getString(8));
                objUsuario.setBDDATO8(rs.getString(9));
                lista.add(objUsuario);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public int Eliminar(DatoBean objUsuario) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement(" DELETE FROM usuario WHERE IDUSUARIO=?");
            pt.setInt(1, objUsuario.getBDDATOUsuario());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int Modificar(DatoBean objUsuario) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("UPDATE `usuario` SET `USUARIO`=? , `CLAVE`=?  WHERE `IDUSUARIO`=?");

            pt.setString(1, objUsuario.getBDDATO1());
            pt.setString(2, objUsuario.getBDDATO2());
            pt.setInt(3, objUsuario.getBDDATOUsuario());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int ModificarContraseña(DatoBean objUsuario) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("UPDATE usuario SET CLAVE = ? WHERE IDPERSONA = ?");
            pt.setString(1, objUsuario.getBDDATO1());
            pt.setInt(2, objUsuario.getBDDATOUsuario());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int Insertar(DatoBean objUsuario) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO `usuario`(`IDUSUARIO`,`IDTIPO`, `CLAVE`, `USUARIO`,`IDPERSONA`) VALUES (?,?,?,?,?); ");
            pt.setInt(1, objUsuario.getBDDATOUsuario());
            pt.setInt(2, objUsuario.getBDDATOTPersona());
            pt.setString(3, ("1234567"));
            pt.setString(4, objUsuario.getBDDATO1());
            pt.setInt(5, objUsuario.getBDDATOPersona());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int GenerarCodigoUsuario() {
        int i = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT MAX(IDUSUARIO) FROM usuario");
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
