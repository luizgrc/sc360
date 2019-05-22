<%-- 
    Document   : login
    Created on : 29/01/2019, 11:27:24 AM
    Author     : Elgar Eduardo Puma Cruz
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String valida = (String) session.getAttribute("valida");
    System.out.println(" Valida:  " + valida);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



        <!-- Core CSS - Include with every page -->
        <link href="bootstrap-3.4.1/css/bootstrap.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
        <!-- SB Admin CSS - Include with every page -->
        <link href="css/sb-admin.css" rel="stylesheet">

        <title>BIENVENIDO AL SISTEMA COORDINADOR 360</title>
    </head>
    <body cz-shortcut-listen="true">

        <!--<h1 class="Estilo2" align="center">SISTEMA COORDINADOR 360</h1>-->
        <nav class="navbar navbar-default navbar-fixed-top nav-custom" role="navigation" ></nav>
        <div class="container">
            <div class="row">
                <html:form action="/validateLogin.do" styleId="frmdata">
                    <!--                        <label id="j_idt6:j_idt11" class="ui-outputlabel ui-widget"
                                                     for="j_idt6:username">Usuario</label>-->
                    <div class="col-md-4 col-md-offset-4">
                        <div class="login-panel panel panel-default">

                            <div class="panel-body">
                                <form role="form">
                                    <fieldset>
                                        <div class="form-group">
                                            <input id="nickUsuario" class="form-control" type="text" placeholder="Username" name="nickUsuario" required="" >
                                            <span class="help-block"></span>
                                        </div>
                                        <div class="form-group">
                                            <input id="password" name="password" class="form-control" placeholder="Password"  type="password" required="">
                                            <span class="help-block"></span>
                                        </div>


                                        <div class="alert alert-danger page-alert alert-dismissible" id="alertLogin">
                                            <button type="button" class="close" data-dismiss="alert">
                                                <span aria-hidden="true">&times;</span></button>
                                            Usuario o Contraseña Incorrectos
                                        </div>

                                        <!-- Change this to a button or input when using this as a form -->
                                        <div class="form-group">
                                            <!--<button id="ingresar" name="ingresar" 

                                                    class="btn btn-lg btn-warning btn-block"
                                                    role="button" aria-disabled="false"
                                                    style="padding: 5px; cursor: pointer;" onclick="javaScript:validateLogin();">
                                                <span class="ui-button-text ui-c">Ingresar</span>
                                            </button>-->

                                            <html:submit onclick="javaScript:validateLogin();" value="ingresar" styleClass="btn btn-lg btn-warning btn-block" style="padding: 5px; cursor: pointer;">
                                                <span class="ui-button-text ui-c">Ingresar</span>
                                            </html:submit>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>

                    </div>     
                </html:form>
            </div>
        </div>
        <!-- Core Scripts - Include with every page -->
        <script src="js/jquery-3.4.1.js"></script>
        <script src="bootstrap-3.4.1/js/bootstrap.js"></script>
        <script language="javascript">
            var tecla;
            $('#alertLogin').hide();
            $('#alertLogin').on('close.bs.alert', function (e) {
                e.preventDefault();
                $('#alertLogin').hide();
            });
            var validar = '<%= session.getAttribute("valida")%>';
            if (validar === '0') {
                $('#alertLogin').slideDown();
            }
            function validateLogin()
            {
                var ussro = document.getElementById("nickUsuario").value;
                var pssord = document.getElementById("password").value;
                /*
                 var form=document.frmdata;
                 var ussro=form.ussro.value;
                 var pssord=form.pssord.value;
                 */
                if (ussro == "" || pssord == "")
                {
                    // $("#ingresar".parent().children("span").text("Debe ingresar algun caracter").show());
                    //alert("Debe ingresar su usuario y password");
                    //var input = document.getElementById("nickUsuario");
                    $('#alertLogin').html("<button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span></button>Campos necesarios incompletos");
                    $('#alertLogin').slideDown();
                    //ussro.focus();
                    //form.usuario.focus();
                    return false;
                } else if (ussro == null || ussro.length == 0) {
                    $('#alertLogin').html('Campos necesarios incompletos');
                    $('#alertLogin').slideDown();
                    return false;
                } else if (pssord == null || pssord.length == 0) {
                    $('#alertLogin').html('Campos necesarios incompletos');
                    $('#alertLogin').slideDown();
                    return false;
                }

                //document.forms["frmdata"].submit();
                //document.frmdata.submit();
                /*
                 form.action="Login.do?metodo=signIn";
                 form.method="post";
                 form.submit();
                 */
            }



            function capturaTecla(e)
            {
                if (document.all)
                    tecla = event.keyCode;
                else
                {
                    tecla = e.which;
                }
                if (tecla == 13)
                {
                    validateLogin();
                }
            }

            document.onkeydown = capturaTecla;
        </script>




    </body>
</html>


