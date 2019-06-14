/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.sc360.struts.jdbc.conexion.ConectaDb;
import com.sc360.struts.form.LoginForm;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
/**
 *
 * @author epuma
 */
public class ImpLogin implements IfaceLogin{
    
    private final ConectaDb db;
    private final StringBuilder sql;
    private String message;
    private final static Logger LOGGER = Logger.getLogger(ConectaDb.class);
    public ImpLogin() {
        this.db = new ConectaDb();
        this.sql = new StringBuilder();
    }

    @Override
    public LoginForm validaLogin(LoginForm obj) {
        
        LoginForm bean = null;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            cn = db.getConnection();
            sql.append("SELECT * FROM USUARIO WHERE nickUsuario = ? AND PASSWORD = ? ");
            ps = cn.prepareStatement(sql.toString());
            ps.setString(1, obj.getNickUsuario());
            ps.setString(2, obj.getPassword());
            rs = ps.executeQuery();
            
             if (rs.next()) {
                    bean = new LoginForm();

                    bean.setIdUsuario(rs.getString(1));
                    bean.setNickUsuario(rs.getString(2));
                    bean.setPassword(rs.getString(3));
                    bean.setTipoUsuario(rs.getString(4));

                }
        } catch (Exception e) {
            
            message = e.getMessage();
            LOGGER.log(Level.ERROR, message);
            
        }
        
        return bean;
    }
    
  @Override
    public String getMessage(){
        return message;
    }  
    
}
