<%-- 
    Document   : login
    Created on : 29/01/2019, 11:27:24 AM
    Author     : Elgar Eduardo Puma Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



        <!-- Bootstrap CSS -->
        <link href="botstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom CSS -->
        <link href="css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <title>BIENVENIDO AL SISTEMA COORDINADOR 360</title>
    </head>
    <body>

        <!--<h1 class="Estilo2" align="center">SISTEMA COORDINADOR 360</h1>-->
        <div class="bg-orange">
            <img id="j_idt6:j_idt8"
                 src="<c:out value="${pageContext.request.contextPath}"/>/images/cabecera_2.png"
                 alt="" class="logo" />
        </div>
        <div class="container">
            <html:form action="/validateLogin.do" styleId="frmdata">
                      <!--                        <label id="j_idt6:j_idt11" class="ui-outputlabel ui-widget"
                                                       for="j_idt6:username">Usuario</label>-->
                        <div class="col-md-4 col-md-offset-4">
                            <div class="login-panel panel panel-default">

                                <div class="panel-body">
                                    <form role="form">
                                        <fieldset>
                                            <div class="form-group">
                                                <input id="nickUsuario" class="form-control" type="text" placeholder="Username" name="nickUsuario" >
                                                <span class="help-block"></span>
                                            </div>
                                            <div class="form-group">
                                                <input id="password" name="password" class="form-control" placeholder="Password"  type="password" >
                                                <span class="help-block"></span>
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
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script language="javascript">
            var tecla;
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
                    $("#nickUsuario").parent().parent().attr("class", "form-group has-error");
                    $("#nickUsuario".parent().children("span").text("Debe ingresar algun caracter").show());
                    ussro.focus();
                    //form.usuario.focus();
                    return false;
                } else if (ussro == null || ussro.length == 0 || /^\s+$/.text(ussro)) {
                    $("#nickUsuario").parent().parent().attr("class", "form-group has-error");
                    $("#nickUsuario".parent().children("span").text("Debe ingresar algun caracter").show());
                    return false;
                } else if (pssord == null || pssord.length == 0 || /^\s+$/.text(pssord)) {
                    $("#password").parent().parent().attr("class", "form-group has-error");
                    $("#password".parent().children("span").text("Debe ingresar algun caracter").show());
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


        <script src="jq/jquery.min.js" type="text/javascript"></script>
        <script src="botstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/nanoscroller.js"></script>


    </body>
</html>


