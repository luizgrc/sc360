<%-- 
    Document   : datosGenerales
    Created on : 16/03/2019, 09:16:42 PM
    Author     : Elgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Datos Generales</title>
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/css/bootstrap.min.css">
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/3.3.1/jquery.min.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/bootstrap.min.js"></script>
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/main.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/style.css">
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-1.12.4.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/ajax.js"></script>
        <script src="../scripts/jquery.js"></script>
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/layout-default.css">
        <link href="../css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <script>
            $(function () {
                $("#primerNombre").attr("placeholder", "Nombre 1");
                $("#primerApellido").attr("placeholder", "Apellido 1");
                $("#segundoApellido").attr("placeholder", "Apellido 2");
                $("#fechaNacimiento").datepicker();
            });

            function onChangeProvincia(campo, flag) {

                var form = document.getElementById("frmconsulta");
                var dpto = document.getElementById("departamento").value;
                var campoaLlenar;
                if (flag == 'PR') {
                    campoaLlenar = document.getElementById("provincia");
                    limpiarCombo(campoaLlenar);
                }
                if (campo.value != 'S') {
                    ajax = new Ajax();
                    ajax.clase = "com.sc360.struts.jdbc.dao.ImpUtil";
                    ajax.metodo = "provinciasXdepaAjax";
                    ajax.async = false;
                    ajax.parametros = new Array("2", dpto, " ", " ");
                    ajax.cargarComboBox(campoaLlenar, "descripcion", "codigo");
                } else {
                    if (flag == 'PR' && campo.value == 'S') {
                        limpiarCombo(form.provincia);
                        limpiarCombo(form.distrito);
                    }
                }


            }

            function onChangeDistrito(campo, flag) {
                var form = document.getElementById("frmconsulta");
                var dpto = document.getElementById("departamento").value;
                var prov = document.getElementById("provincia").value;
                var campoaLlenar;
                if (flag == 'DI') {
                    campoaLlenar = document.getElementById("distrito");
                    limpiarCombo(campoaLlenar);
                }
                if (campo.value != 'S') {
                    ajax = new Ajax();
                    ajax.clase = "com.sc360.struts.jdbc.dao.ImpUtil";
                    ajax.metodo = "distritoXprovinciaAjax";
                    ajax.async = false;
                    ajax.parametros = new Array("3", dpto, prov, " ");
                    ajax.cargarComboBox(campoaLlenar, "descripcion", "codigo");
                } else {
                    if (flag == 'DI' && campo.value == 'S')
                    {
                        limpiarCombo(form.distrito);
                    }
                }
            }

            function limpiarCombo(campo) {

                while (campo.options.length > 1) {
                    campo.options.remove(1);
                }
            }


            function irSeyci() {
                var form = document.frmConsulta;
                var numeroExp = form.numeroExpediente.value;
                var url = 'Seyci.do?method=inicioSeyci&numeroExp=' + numeroExp;
                var form = document.forms(0);
                form.action = url;
                form.method = "post";
                form.submit();
            }
            ;
        </script>     


    </head>    
    <body style="background-color:#FFFFFF;">

        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item active"><a class="nav-link" href="#">Detalle Consulta</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irSeyci()">SEYCI</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irTraslado()">TRASLADO</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irReevaluacion()">REEVALUACION</a></li>
                <li class="nav-item"><a class="nav-link" href="#">DICTAMEN</a></li>
                <li class="nav-item"><a class="nav-link" href="#">APELACION</a></li>
            </ul>
        </div>
        <html:form action="Consulta.do" styleId="frmConsulta" >

            <div class="form-group div-align-l dv-align-2030">
                <div class="row">  

                    <STRONG>DATOS GENERALES</STRONG>&nbsp;                   
                </div>


                <div class=" col-sm-2 control-label">
                    Exp&nbsp;
                </div>
                <div class="col-2 form-inline" >
                    <html:text property="numeroExpediente" styleClass="form-control input-sm" size="20" maxlength="20" disabled="true"/>
                </div>
                <br>

                <div class="col-md-6">
                    <div class="row show-grid form-group">

                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label>CUSPP&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:text property="cuspp" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>

                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox"  id="cuspp">
                        </div>

                    </div>


                    <div class="row show-grid form-group" >
                        <div class="col-md-4">
                            <label  col-sm-2 control-label>Primer nombre&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:text property="primerNombre" styleClass="form-control input-sm" styleId="primerNombre" size="20" maxlength="20" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="primerNombre" >
                        </div>
                    </div>

                    <div class="row show-grid form-group">
                        <div class="col-md-4">
                            <label  col-sm-2 control-label>Segundo Nombre&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:text property="segundoNombre" styleClass="form-control input-sm" styleId="segundoNombre" size="20" maxlength="20" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="segundoNombre" >
                        </div>
                    </div>
                    <div class="row show-grid form-group">
                        <div class="col-md-4">
                            <label  col-sm-2 control-label>Primer Apellido&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:text property="primerApellido"  styleClass="form-control input-sm" styleId="primerApellido" size="20" maxlength="20" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="primerApellido" >
                        </div>
                    </div>
                    <div class="row show-grid form-group">
                        <div class="col-md-4">
                            <label  col-sm-2 control-label>Segundo Apellido&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:text property="segundoApellido" styleClass="form-control input-sm" styleId="segundoApellido" size="20" maxlength="20" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="segundoApellido" >
                        </div>
                    </div>
                    <div class="row show-grid form-group">
                        <div class="col-md-4">
                            <label  col-sm-2 control-label>Fecha Nacimiento&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-10">
                                <html:text property="fechaNacimiento" styleClass="form-control input-sm" styleId="fechaNacimiento" size="12" />
                            </div>
                            &nbsp;
                            <label >     
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </label> 
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaNacimiento">
                        </div>
                    </div>
                    <div class="row show-grid form-group">
                        <div class="col-md-4">
                            <label  col-sm-2 control-label>Correo&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:text property="correo" styleClass="form-control input-sm"  size="20" maxlength="20" /> 
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaNacimiento" >
                        </div>
                    </div>

                </div>



                <div class="col-md-6">
                    <div class="row show-grid form-group">

                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label>Sexo&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:select property="sexo" styleClass="form-control input-sm">
                                    <html:option value="0">SEXO</html:option>   
                                    <html:option value="1">MASCULINO</html:option>
                                    <html:option value="2">FEMENINO</html:option>
                                </html:select> 
                            </div>
                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="sexo" >
                        </div>

                    </div>
                    <div class="row show-grid form-group">

                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label>Telefono&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:text property="telefono" styleClass="form-control input-sm" styleId="telefono" size="20" maxlength="20" />
                            </div>

                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="telefono" >
                        </div>

                    </div>
                    <div class="row show-grid form-group">

                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label>Estado Civil&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:select property="estadoCivil" styleClass="form-control input-sm ">
                                    <html:option value="0">ESTADO CIVIL</html:option>   
                                    <html:option value="1">SOLTERO</html:option>
                                    <html:option value="2">CASADO</html:option>
                                    <html:option value="3">VIUDO</html:option>
                                    <html:option value="4">DIVORCIADO</html:option>
                                </html:select>
                            </div>
                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="estadoCivil" >
                        </div>

                    </div>
                    <div class="row show-grid form-group">

                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label>Direccion&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:text property="direccion" styleClass="form-control input-sm" styleId="direccion" size="40" maxlength="40" />
                            </div>

                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="direccion" >
                        </div>

                    </div>
                    <div class="row show-grid form-group">

                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label>Departamento&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:select property="departamento" styleClass="form-control input-sm" styleId="departamento" onchange="onChangeProvincia(this,'PR')" >
                                    <html:options collection="listDepartamento" property="codigo" labelProperty="descripcion"/>
                                </html:select> 
                            </div>
                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="departamento" >
                        </div>

                    </div>
                    <div class="row show-grid form-group">

                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label>Provincia&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <html:select property="provincia" styleClass="form-control input-sm" styleId="provincia" onchange="onChangeDistrito(this,'DI')" >
                                    <html:options collection="listaProvincia" property="codigo" labelProperty="descripcion"/>
                                </html:select> 
                            </div>
                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="provincia" >
                        </div>

                    </div>

                    <div class="row show-grid form-group">

                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label>Distrito&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-12">
                                <select name="distrito" class="form-control input-sm" id="distrito" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #000000;">
                                    <c:forEach var="item" items="${listaDistrito}">
                                        <option value="${item.codigo}" ${item.codigo == selectedDist ? 'selected="selected"' : ''}>${item.descripcion}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="distrito" >
                        </div>

                    </div>
                </div>

                <div class="col-9 form-inline"> 
                    <input type="checkbox" id="Apoderado">&nbsp;
                    Tiene Apoderado
                </div>
                <br>
                <div class="col-2 form-inline">
                    <a href="javascript:fncGuardarSolicitud()">
                        <div style="text-align: center"><input type="button" value="Guardar" alt="Guardar" class="btn btn-custom"></div>
                    </a> 
                </div>

            </div>
        </html:form>


    </body>
    <script src="js/jquery-3.4.1.js"
    <script src="js/ajax.js"></script>
     <script>
            $(function () {
                $("#primerNombre").attr("placeholder", "Nombre 1");
                $("#primerApellido").attr("placeholder", "Apellido 1");
                $("#segundoApellido").attr("placeholder", "Apellido 2");
                $("#fechaNacimiento").datetimepicker();
            });

            function onChangeProvincia(campo, flag) {

                var form = document.getElementById("frmconsulta");
                var dpto = document.getElementById("departamento").value;
                var campoaLlenar;
                if (flag == 'PR') {
                    campoaLlenar = document.getElementById("provincia");
                    limpiarCombo(campoaLlenar);
                }
                if (campo.value != 'S') {
                    ajax = new Ajax();
                    ajax.clase = "com.sc360.struts.jdbc.dao.ImpUtil";
                    ajax.metodo = "provinciasXdepaAjax";
                    ajax.async = false;
                    ajax.parametros = new Array("2", dpto, " ", " ");
                    ajax.cargarComboBox(campoaLlenar, "descripcion", "codigo");
                } else {
                    if (flag == 'PR' && campo.value == 'S') {
                        limpiarCombo(form.provincia);
                        limpiarCombo(form.distrito);
                    }
                }


            }

            function onChangeDistrito(campo, flag) {
                var form = document.getElementById("frmconsulta");
                var dpto = document.getElementById("departamento").value;
                var prov = document.getElementById("provincia").value;
                var campoaLlenar;
                if (flag == 'DI') {
                    campoaLlenar = document.getElementById("distrito");
                    limpiarCombo(campoaLlenar);
                }
                if (campo.value != 'S') {
                    ajax = new Ajax();
                    ajax.clase = "com.sc360.struts.jdbc.dao.ImpUtil";
                    ajax.metodo = "distritoXprovinciaAjax";
                    ajax.async = false;
                    ajax.parametros = new Array("3", dpto, prov, " ");
                    ajax.cargarComboBox(campoaLlenar, "descripcion", "codigo");
                } else {
                    if (flag == 'DI' && campo.value == 'S')
                    {
                        limpiarCombo(form.distrito);
                    }
                }
            }

            function limpiarCombo(campo) {

                while (campo.options.length > 1) {
                    campo.options.remove(1);
                }
            }


            function irSeyci() {
                var form = document.frmConsulta;
                var numeroExp = form.numeroExpediente.value;
                alert(numeroExp);
                var url = 'Seyci.do?method=inicioSeyci&numeroExp=' + numeroExp;
                var form = document.forms(0);
                form.action = url;
                form.method = "post";
                form.submit();
            }
            ;

            function fncGuardarSolicitud() {
                var form = document.getElementById("frmConsulta");
                form.action = "Consulta.do?method=guardarSolicitud";
                form.method = "post";
                form.submit();
            }
        </script>
</html>
