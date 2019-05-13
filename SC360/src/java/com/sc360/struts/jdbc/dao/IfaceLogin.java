/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.jdbc.dao;

import com.sc360.struts.form.LoginForm;

/**
 *
 * @author epuma
 */
public interface IfaceLogin {
    
    LoginForm validaLogin(LoginForm obj);
    public String getMessage();
    
}
