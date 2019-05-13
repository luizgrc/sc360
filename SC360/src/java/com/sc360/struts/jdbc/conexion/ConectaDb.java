/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.jdbc.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.Locale;
import com.sc360.struts.jdbc.conexion.Utils;

/**
 *
 * @author epuma
 */
public class ConectaDb {
    
     
    
    private String url = "";
    //private final String driver = "com.mysql.jdbc.Driver";
    //private final String user = "root";
    //private final String password = "mysql";
    //private final String password = "root";
    
    
    public Connection getConnection() throws SQLException {
        Connection cn = null;
        
        String archivo_configuracion = "com.sc360.struts.jdbc.conexion.sc360";
            
        ResourceBundle rb = ResourceBundle.getBundle(archivo_configuracion);
        
        
        /*Locale locale = new Locale("es", "PE");
        ResourceBundle recursos = ResourceBundle.getBundle("sc360properties",locale);
        String user = recursos.getString("US");
        String password = recursos.getString("PW");
        String url = recursos.getString("URL");
        String driver = recursos.getString("DRIVER");*/
        

        try {
            
            String user = rb.getString("US");
            String password = rb.getString("PW");
            String url = rb.getString("URL");
            String driver = rb.getString("DRIVER");
            
            Class.forName(driver).newInstance();
            cn = DriverManager.getConnection(url, user, password);

        } catch ( Exception ex) {
            
            throw new SQLException(ex.getMessage());
        }

        return cn;
    }

    public ConectaDb() {
    }

    public ConectaDb(String database) {
        url = "jdbc:mysql://localhost:3306/" + database;
    }
    
}
