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
        <style></style>

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
                    alert("Debe ingresar su usuario y password");
                    var input = document.getElementById("nickUsuario");
                    input.focus();
                    //form.usuario.focus();
                    return;
                }

                document.forms["frmdata"].submit();
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

        <title>BIENVENIDO AL SISTEMA COORDINADOR 360</title>
    </head>
    <body>

        <!--<h1 class="Estilo2" align="center">SISTEMA COORDINADOR 360</h1>-->
        <div class="bg-orange">
            <img id="j_idt6:j_idt8"
                 src="<c:out value="${pageContext.request.contextPath}"/>/images/cabecera_2.png"
                 alt="" class="logo" />
        </div>
        <html:form action="/validateLogin.do" styleId="frmdata">

            <div class="container">
                <div class="row">
                    <div class="ui-g-12">
                        <!--                        <label id="j_idt6:j_idt11" class="ui-outputlabel ui-widget"
                                                       for="j_idt6:username">Usuario</label>-->
                        <div class="col-md-4 col-md-offset-4">
                            <div class="login-panel panel panel-default">

                                <div class="panel-body">
                                    <form role="form">
                                        <fieldset>
                                            <div class="form-group">
                                                <input id="nickUsuario" class="form-control" type="text" placeholder="Username" name="nickUsuario" >
                                            </div>
                                            <div class="form-group">
                                                <input id="password" name="password" class="form-control" placeholder="Password"  type="password" value="">
                                            </div>
                                            <c:if test="${param['auth-error']}">
                                                <span
                                                    style="color: white; font-size: 12px; background: #de2c1a; padding: 5px; border-radius: 4px;">Datos
                                                    incorrectos. Porfavor, intente nuevamente.</span>
                                                </c:if>

                                            <!-- Change this to a button or input when using this as a form -->
                                            <div class="ui-g-12 button-container">
                                                <button id="ingresar" name="ingresar" type="submit"
                                                        class="btn btn-lg btn-warning btn-block"
                                                        role="button" aria-disabled="false"
                                                        style="padding: 5px; cursor: pointer;" onclick="javaScript:validateLogin();">
                                                    <span class="ui-button-text ui-c">Ingresar</span>
                                                </button>
                                            </div>
                                           
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
           
                    </div>
                   

                    
                </div>
            </div>


        </html:form>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <!-- Scripts-->
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/nanoscroller.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/layout.js"></script>


    </body>
</html>


