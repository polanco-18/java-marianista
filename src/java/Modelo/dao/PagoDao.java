package Modelo.dao;

import Modelo.Bean.DatoBean;
import Util.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

public class PagoDao {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<DatoBean> lista = null;

    public ArrayList<DatoBean> Listar() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT P.ID, P.IDALUMNO,PE.FOTO,PE.NOMBRE,PE.APELLIDO,PE.APELLIDOM,S.GRADO, P.DETALLE, P.MONTO, P.MORA, P.FECHAV, P.FECHACREADA, P.ESTADO FROM programacion_pagos P inner join alumno A on A.IDALUMNO=P.IDALUMNO inner JOIN persona PE on PE.IDPERSONA=A.IDPERSONA inner join matricula M on A.IDALUMNO=M.IDALUMNO inner join seccion S on M.IDSECCION=S.IDSECCION ORDER BY `P`.`FECHAV` ASC");
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                DatoBean objDocente = new DatoBean();
                objDocente.setBDDATOPago(rs.getInt(1));
                objDocente.setBDDATOAlumno(rs.getInt(2));
                objDocente.setBDDATO1(rs.getString(3));
                objDocente.setBDDATO2(rs.getString(4));
                objDocente.setBDDATO3(rs.getString(5));
                objDocente.setBDDATO4(rs.getString(6));
                objDocente.setBDDATO5(rs.getString(7));
                objDocente.setBDDATO6(rs.getString(8));
                objDocente.setBDDATO7(rs.getString(9));
                objDocente.setBDDATO8(rs.getString(10));
                objDocente.setBDDATO9(rs.getString(11));
                objDocente.setBDDATO10(rs.getString(12));
                objDocente.setBDDATO11(rs.getString(13));
                lista.add(objDocente);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public int InsertarCronograma(DatoBean objMatricula) {
        int estado = 0;
        try {
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO `programacion_pagos`( `IDALUMNO`, `DETALLE`, `MONTO`, `FECHAV`) VALUES (?,?,?,?)");
            pt.setInt(1, objMatricula.getBDDATOAlumno());
            pt.setString(2, "Matricula");
            pt.setString(3, "280");
            pt.setString(4, year + "-03-15");
            estado = pt.executeUpdate();
            if (estado != 0) {
                cn = ConexionBD.getConexionBD();
                pt = cn.prepareStatement("INSERT INTO `pago`( `TOTALT`) VALUES (?);");
                pt.setString(1, "280");
                estado = pt.executeUpdate();
                if (estado != 0) {
                    pt = cn.prepareStatement("INSERT INTO `pago_detalle`(`IDPAGO`, `IDPROGRAMACION_PAGO`, `NOMBRE`, `MONTO`) VALUES ((SELECT MAX(P.ID) from pago P),(SELECT MAX(PA.ID) from programacion_pagos PA),?,?);");
                    pt.setString(1, "Matricula");
                    pt.setString(2, "280");
                    estado = pt.executeUpdate();
                    if (estado != 0) {
                        for (int i = 1; i < 11; i++) {
                            pt = cn.prepareStatement("INSERT INTO `programacion_pagos`( `IDALUMNO`, `DETALLE`, `MONTO`, `FECHAV`) VALUES (?,?,?,?)");
                            pt.setInt(1, objMatricula.getBDDATOAlumno());
                            pt.setString(2, "Mensualidad " + i);
                            pt.setString(3, "280");
                            pt.setString(4, year + "-" + (i + 2) + "-30");
                            estado = pt.executeUpdate();
                        }
                    }
                }
            }
            pt.close();
            cn.close();
        } catch (Exception e) {
            estado = 0;
            System.out.println(e.getMessage());
        }
        return estado;
    }
    public ArrayList<DatoBean> MostrarBuscar(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT P.ID, P.IDALUMNO,PE.FOTO,PE.NOMBRE,PE.APELLIDO,PE.APELLIDOM,S.GRADO, P.DETALLE, P.MONTO, P.MORA, P.FECHAV, P.FECHACREADA, P.ESTADO FROM programacion_pagos P inner join alumno A on A.IDALUMNO=P.IDALUMNO inner JOIN persona PE on PE.IDPERSONA=A.IDPERSONA inner join matricula M on A.IDALUMNO=M.IDALUMNO inner join seccion S on M.IDSECCION=S.IDSECCION where PE.NOMBRE like ? or PE.APELLIDO  like ? or PE.APELLIDOM  like ?");
            cod += "%";
            pt.setString(1, cod);
            pt.setString(2, cod);
            pt.setString(3, cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                 DatoBean objDocente = new DatoBean();
                objDocente.setBDDATOPago(rs.getInt(1));
                objDocente.setBDDATOAlumno(rs.getInt(2));
                objDocente.setBDDATO1(rs.getString(3));
                objDocente.setBDDATO2(rs.getString(4));
                objDocente.setBDDATO3(rs.getString(5));
                objDocente.setBDDATO4(rs.getString(6));
                objDocente.setBDDATO5(rs.getString(7));
                objDocente.setBDDATO6(rs.getString(8));
                objDocente.setBDDATO7(rs.getString(9));
                objDocente.setBDDATO8(rs.getString(10));
                objDocente.setBDDATO9(rs.getString(11));
                objDocente.setBDDATO10(rs.getString(12));
                objDocente.setBDDATO11(rs.getString(13));
                lista.add(objDocente);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    public ArrayList<DatoBean> CronogramaAlumno(String cod) {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT P.ID, P.IDALUMNO,PE.FOTO,PE.NOMBRE,PE.APELLIDO,PE.APELLIDOM,S.GRADO, P.DETALLE, P.MONTO, P.MORA, P.FECHAV, P.FECHACREADA, P.ESTADO FROM programacion_pagos P inner join alumno A on A.IDALUMNO=P.IDALUMNO inner JOIN persona PE on PE.IDPERSONA=A.IDPERSONA inner join matricula M on A.IDALUMNO=M.IDALUMNO inner join seccion S on M.IDSECCION=S.IDSECCION where PE.IDPERSONA=?");
            pt.setString(1, cod);
            System.out.println(cod);
            rs = pt.executeQuery();
            lista = new ArrayList<DatoBean>();
            while (rs.next()) {
                 DatoBean objDocente = new DatoBean();
                objDocente.setBDDATOPago(rs.getInt(1));
                objDocente.setBDDATOAlumno(rs.getInt(2));
                objDocente.setBDDATO1(rs.getString(3));
                objDocente.setBDDATO2(rs.getString(4));
                objDocente.setBDDATO3(rs.getString(5));
                objDocente.setBDDATO4(rs.getString(6));
                objDocente.setBDDATO5(rs.getString(7));
                objDocente.setBDDATO6(rs.getString(8));
                objDocente.setBDDATO7(rs.getString(9));
                objDocente.setBDDATO8(rs.getString(10));
                objDocente.setBDDATO9(rs.getString(11));
                objDocente.setBDDATO10(rs.getString(12));
                objDocente.setBDDATO11(rs.getString(13));
                lista.add(objDocente);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

}
