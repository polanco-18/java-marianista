package Util;

import java.io.File;
import java.net.URL;
import java.sql.*;

public class ConexionBD {

    public static Connection getConexionBD() {
        Connection cn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdmarianista", "root", "");
            //   cn=DriverManager.getConnection("jdbc:mysql://node66271-fernando.whelastic.net/bdcolegio","root","CQKgef35504");
            URL rutaca = ConexionBD.class.getProtectionDomain().getCodeSource().getLocation();
            System.out.println(rutaca);
            String rutama = rutaca.toString();
            System.out.println("Se Conecto !!!!");
        } catch (Exception e) {
            System.out.println("No Se Conecto !!!!");
        }
        return cn;
    }

    public static void main(String args[]) {
        getConexionBD();
    }
}
