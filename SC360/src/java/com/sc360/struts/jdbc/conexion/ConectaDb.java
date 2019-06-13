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
import java.net.URL;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;


/**
 *
 * @author epuma
 */
public class ConectaDb {

    private final static Logger LOGGER = Logger.getLogger(ConectaDb.class);

//    URL log4url = ConectaDb.class.getResource("log4j.properties");
    private String url = "";

    //private final String driver = "com.mysql.jdbc.Driver";
    //private final String user = "root";
    //private final String password = "mysql";
    //private final String password = "root";
    public Connection getConnection() throws SQLException {
        
        Connection cn = null;
            
        String archivo_configuracion = "com.sc360.struts.jdbc.conexion.sc360";

        LOGGER.log(Level.INFO, "Inicio Cadena Conexion");
        

        ResourceBundle rb = ResourceBundle.getBundle(archivo_configuracion);
        try {
            String user = rb.getString("US");
            String password = rb.getString("PW");
            String url = rb.getString("URL");
            LOGGER.log(Level.INFO, user);
            LOGGER.log(Level.INFO, password);
            LOGGER.log(Level.INFO, url);
            String driver = rb.getString("DRIVER");
            Class.forName(driver).newInstance();
            cn = DriverManager.getConnection(url, user, password);
        } catch (Exception ex) {

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
