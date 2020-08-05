package Modelo.dao;

import Modelo.Bean.DatoBean;
import Util.ConexionBD;
import java.util.ArrayList;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PersonaDao {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<DatoBean> lista = null;

    public ArrayList<DatoBean> ListarPersona() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT `IDPERSONA`, `NOMBRE`, `APELLIDO`, `APELLIDOM`, `FOTO`, TIMESTAMPDIFF(year,`FECHA`,CURDATE())as edad, `FECHA`, `DNI`, `SEXO`,`CORREO`,`TELEFONO`, `ESTADO_CIVIL`,`DIRECCION`,`DISTRITO`, `PROVINCIA`, `DEPARTAMENTO` FROM `persona`");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objPersona = new DatoBean();
                objPersona.setBDDATOPersona(rs.getInt(1));
                objPersona.setBDDATO1(rs.getString(2));
                objPersona.setBDDATO2(rs.getString(3));
                objPersona.setBDDATO3(rs.getString(4));
                objPersona.setBDDATO4(rs.getString(5));
                objPersona.setBDDATO5(rs.getString(6));
                objPersona.setBDDATO6(rs.getString(7));
                objPersona.setBDDATO7(rs.getString(8));
                objPersona.setBDDATO8(rs.getString(9));
                objPersona.setBDDATO9(rs.getString(10));
                objPersona.setBDDATO10(rs.getString(11));
                objPersona.setBDDATO11(rs.getString(12));
                objPersona.setBDDATO12(rs.getString(13));
                objPersona.setBDDATO13(rs.getString(14));
                objPersona.setBDDATO14(rs.getString(15));
                objPersona.setBDDATO15(rs.getString(16));
                lista.add(objPersona);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public DatoBean DatosModificar(DatoBean objDatoBean) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT P.IDPERSONA,P.FOTO, P.NOMBRE, P.APELLIDO, P.APELLIDOM, TIMESTAMPDIFF(year,P.FECHA,CURDATE()), P.FECHA, P.DNI, P.SEXO, P.CORREO,P.TELEFONO,P.ESTADO_CIVIL,P.DIRECCION,P.DISTRITO,P.PROVINCIA,P.DEPARTAMENTO,P.FECHA_CREADA,P.ESTADO,U.IDUSUARIO,U.IDTIPO,U.USUARIO,U.CLAVE FROM persona P INNER JOIN usuario U ON U.IDPERSONA=P.IDPERSONA where P.IDPERSONA=?");
            pt.setInt(1, objDatoBean.getBDDATOPersona());
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
                objDatoBean.setBDDATO16(rs.getString(17));
                objDatoBean.setBDDATO17(rs.getString(18));
                objDatoBean.setBDDATOUsuario(rs.getInt(19));
                objDatoBean.setBDDATO18(rs.getString(20));
                objDatoBean.setBDDATO19(rs.getString(21));
                objDatoBean.setBDDATO20(rs.getString(22));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return objDatoBean;
    }

    public int ModificarFoto(DatoBean objDatoBean) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("update  persona set  Foto=? where IDPERSONA=? ;");
            pt.setString(1, objDatoBean.getBDDATO2());
            pt.setString(2, objDatoBean.getBDDATO1());
            System.out.println(" id : "+objDatoBean.getBDDATO1());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        System.out.println("Entro a Modificar Fot");
        return estado;
    }

    public ArrayList<DatoBean> MostrarBuscar(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT `IDPERSONA`, `NOMBRE`, `APELLIDO`, `APELLIDOM`, `FOTO`, TIMESTAMPDIFF(year,`FECHA`,CURDATE())as edad, `FECHA`, `DNI`, `SEXO`,`CORREO`,`TELEFONO`, `ESTADO_CIVIL`,`DIRECCION`,`DISTRITO`, `PROVINCIA`, `DEPARTAMENTO` FROM `persona` WHERE NOMBRE like ? or APELLIDO like ? or APELLIDOM like ?");
            cod += "%";
            pt.setString(1, cod);
            pt.setString(2, cod);
            pt.setString(3, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objPersona = new DatoBean();
                objPersona.setBDDATOPersona(rs.getInt(1));
                objPersona.setBDDATO1(rs.getString(2));
                objPersona.setBDDATO2(rs.getString(3));
                objPersona.setBDDATO3(rs.getString(4));
                objPersona.setBDDATO4(rs.getString(5));
                objPersona.setBDDATO5(rs.getString(6));
                objPersona.setBDDATO6(rs.getString(7));
                objPersona.setBDDATO7(rs.getString(8));
                objPersona.setBDDATO8(rs.getString(9));
                objPersona.setBDDATO9(rs.getString(10));
                objPersona.setBDDATO10(rs.getString(11));
                objPersona.setBDDATO11(rs.getString(12));
                objPersona.setBDDATO12(rs.getString(13));
                objPersona.setBDDATO13(rs.getString(14));
                objPersona.setBDDATO14(rs.getString(15));
                objPersona.setBDDATO15(rs.getString(16));
                lista.add(objPersona);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public int Modificar(DatoBean objPersona) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("update  persona set  NOMBRE=?, APELLIDO=?, APELLIDOM=?, CORREO=?, TELEFONO=?,`ESTADO_CIVIL`=?,DIRECCION=?, `DISTRITO`=?,`PROVINCIA`=?,`DEPARTAMENTO`=?,ESTADO=? where IDPERSONA=? ;");
            pt.setString(1, objPersona.getBDDATO1());
            pt.setString(2, objPersona.getBDDATO2());
            pt.setString(3, objPersona.getBDDATO3());
            pt.setString(4, objPersona.getBDDATO4());
            pt.setString(5, objPersona.getBDDATO5());
            pt.setString(6, objPersona.getBDDATO6());
            pt.setString(7, objPersona.getBDDATO7());
            pt.setString(8, objPersona.getBDDATO8());
            pt.setString(9, objPersona.getBDDATO9());
            pt.setString(10, objPersona.getBDDATO10());
            pt.setString(11, objPersona.getBDDATO11());
            pt.setInt(12, objPersona.getBDDATOPersona());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int ModificarUsuario(DatoBean objPersona) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("UPDATE `usuario` SET `IDTIPO`=?,`USUARIO`=? ,`CLAVE`=? WHERE `IDUSUARIO`=?");
            pt.setString(1, objPersona.getBDDATO12());
            pt.setString(2, objPersona.getBDDATO13());
            pt.setString(3, objPersona.getBDDATO14());
            pt.setInt(4, objPersona.getBDDATOUsuario());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int Eliminar(DatoBean objPersona) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement(" Delete from  persona  where IDPERSONA=?");
            pt.setInt(1, objPersona.getBDDATOPersona());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    public int InsertarPersona(DatoBean objPersona) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("update  persona set  NOMBRE=?, APELLIDO=?, APELLIDOM=?, CORREO=?, FECHA=?, DNI=?, SEXO=?, TELEFONO=?, ESTADO_CIVIL=?, DIRECCION=?, DISTRITO=?, PROVINCIA=?, DEPARTAMENTO=? where IDPERSONA=?");
            pt.setString(1, objPersona.getBDDATO1());
            pt.setString(2, objPersona.getBDDATO2());
            pt.setString(3, objPersona.getBDDATO3());
            pt.setString(4, objPersona.getBDDATO4());
            pt.setString(5, objPersona.getBDDATO5());
            pt.setString(6, objPersona.getBDDATO6());
            pt.setString(7, objPersona.getBDDATO7());
            pt.setString(8, objPersona.getBDDATO8());
            pt.setString(9, objPersona.getBDDATO9());
            pt.setString(10, objPersona.getBDDATO10());
            pt.setString(11, objPersona.getBDDATO11());
            pt.setString(12, objPersona.getBDDATO12());
            pt.setString(13, objPersona.getBDDATO13());
            pt.setInt(14, objPersona.getBDDATOPersona());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println("Error " + e.getMessage());
        }
        return estado;
    }

    public int InsertarFoto(DatoBean objPersona) {
        int estado = 1;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("insert into `persona` (`foto`,IDPERSONA) values(?,?)");
            pt.setString(1, objPersona.getBDDATO1());
            pt.setInt(2, objPersona.getBDDATOPersona());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println("Error de Insertar Foto " + e.getMessage());
        }
        return estado;
    }

    public DatoBean cargarDatos(DatoBean objeto) {
        DatoBean objCarrera = null;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select * from  persona  where  IDPERSONA =? ; ");
            pt.setInt(1, objeto.getBDDATOPersona());
            rs = pt.executeQuery();
            if (rs.next()) {
                objCarrera = new DatoBean();
                objCarrera.setBDDATOPersona(rs.getInt(1));
                objCarrera.setBDDATO1(rs.getString(2));
                objCarrera.setBDDATO2(rs.getString(3));
                objCarrera.setBDDATO3(rs.getString(4));
                objCarrera.setBDDATO4(rs.getString(5));
                objCarrera.setBDDATO5(rs.getString(6));
                objCarrera.setBDDATO6(rs.getString(7));
                objCarrera.setBDDATO7(rs.getString(8));
                objCarrera.setBDDATO8(rs.getString(9));
                objCarrera.setBDDATO9(rs.getString(10));
                objCarrera.setBDDATO10(rs.getString(11));
                objCarrera.setBDDATO11(rs.getString(12));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return objCarrera;
    }

    public int GenerarCodigoPersona() {
        int i = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT MAX(IDPERSONA) FROM persona;");
            rs = pt.executeQuery();
            if (rs.next()) {
                i = rs.getInt(1);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return i;
    }
}
