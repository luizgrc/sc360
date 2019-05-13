/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import com.sc360.struts.jdbc.conexion.ConectaDb;
import com.sc360.struts.form.LoginForm;

/**
 *
 * @author epuma
 */
public class ImpLogin implements IfaceLogin{
    
    private final ConectaDb db;
    private final StringBuilder sql;
    private String message;

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
            
        }
        
        return bean;
    }
    
  @Override
    public String getMessage() {
        return message;
    }  
    
}
