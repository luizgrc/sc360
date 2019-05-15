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
       <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/main.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/style.css">
         <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/layout-default.css">
         <link href="../botstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
         <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
         
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

            function fncGuardarSolicitud() {
                var form = document.getElementById("frmConsulta");
                form.action = "Consulta.do?method=guardarSolicitud";
                form.method = "post";
                form.submit();
            }
        </script>
    </head>
    <body >
    
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
                    <div class="col-4 form-inline">
                        <STRONG>DATOS GENERALES</STRONG>&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        Exp&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="numeroExpediente" styleClass="form-control" size="20" maxlength="20" disabled="true"/>
                    </div>
                    <div class="col-1 form-inline">
                        CUSPP&nbsp;
                    </div>
                    <div class="col-3 form-inline">
                        <html:text property="cuspp" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="cuspp">
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-5 form-inline">
                        <html:text property="primerNombre" styleClass="form-control" styleId="primerNombre" size="20" maxlength="20" />
                        &nbsp;
                        <input type="checkbox" id="primerNombre" >
                        <html:text property="segundoNombre" styleClass="form-control" styleId="segundoNombre" size="20" maxlength="20" />
                        &nbsp;
                        <input type="checkbox" id="segundoNombre" >
                    </div>
                    <div class="col-1 form-inline">&nbsp;</div>
                    <div class="col-5 form-inline">
                        <html:text property="primerApellido" styleClass="form-control" styleId="primerApellido" size="20" maxlength="20" />
                        &nbsp;
                        <input type="checkbox" id="primerApellido" >
                        <html:text property="segundoApellido" styleClass="form-control" styleId="segundoApellido" size="20" maxlength="20" />
                        &nbsp;
                        <input type="checkbox" id="segundoApellido" >
                    </div>

                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Fecha de Nac.
                        &nbsp;
                    </div>
                    <div class="col-3 form-inline">
                        <html:text property="fechaNacimiento" styleClass="form-control" styleId="fechaNacimiento" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        &nbsp;
                        <input type="checkbox" id="fechaNacimiento">
                    </div>
                    <div class="col-2 form-inline">
                        Correo
                    </div>
                    <div class="col-3 form-inline">
                        <html:text property="correo" styleClass="form-control"  size="20" maxlength="20" /> 
                        &nbsp;
                        <input type="checkbox" id="fechaNacimiento" >
                    </div>
                    <div class="col-2 form-inline">
                        <html:select property="sexo" styleClass="form-control">
                            <html:option value="0">SEXO</html:option>   
                            <html:option value="1">MASCULINO</html:option>
                            <html:option value="2">FEMENINO</html:option>
                        </html:select> 
                        &nbsp;
                        <input type="checkbox" id="sexo" >
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Telefono
                        &nbsp;
                    </div>
                    <div class="col-4 form-inline">
                        <html:text property="telefono" styleClass="form-control" styleId="telefono" size="20" maxlength="20" />
                        &nbsp;
                        <input type="checkbox" id="telefono" >
                    </div>
                    <div class="col-3 form-inline">
                        <html:select property="estadoCivil" styleClass="form-control">
                            <html:option value="0">ESTADO CIVIL</html:option>   
                            <html:option value="1">SOLTERO</html:option>
                            <html:option value="2">CASADO</html:option>
                            <html:option value="3">VIUDO</html:option>
                            <html:option value="4">DIVORCIADO</html:option>
                        </html:select>
                        &nbsp;
                        <input type="checkbox" id="estadoCivil" >
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Direccion
                        &nbsp;
                    </div>
                    <div class="col-6 form-inline">
                        <html:text property="direccion" styleClass="form-control" styleId="direccion" size="40" maxlength="40" />
                        &nbsp;
                        <input type="checkbox" id="direccion" >
                    </div>
                    <div class="col-1 form-inline">
                        Departamento
                        &nbsp;
                    </div>
                    <div class="col-3 form-inline">
                        <html:select property="departamento" styleClass="form-control" styleId="departamento" onchange="onChangeProvincia(this,'PR')" >
                            <html:options collection="listDepartamento" property="codigo" labelProperty="descripcion"/>
                        </html:select> 
                        &nbsp;
                        <input type="checkbox" id="departamento" >
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Provincia
                        &nbsp;
                    </div>
                    <div class="col-6 form-inline">
                        <html:select property="provincia" styleClass="form-control" styleId="provincia" onchange="onChangeDistrito(this,'DI')" >
                            <html:options collection="listaProvincia" property="codigo" labelProperty="descripcion"/>
                        </html:select> 
                        &nbsp;
                        <input type="checkbox" id="provincia" >
                    </div>
                    <div class="col-1 form-inline">
                        Distrito
                        &nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <select name="distrito" class="form-control" id="distrito" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #000000;">
                            <c:forEach var="item" items="${listaDistrito}">
                                <option value="${item.codigo}" ${item.codigo == selectedDist ? 'selected="selected"' : ''}>${item.descripcion}</option>
                            </c:forEach>
                        </select>
                        &nbsp;
                        <input type="checkbox" id="distrito" >
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-9 form-inline"> 
                        <input type="checkbox" id="Apoderado">&nbsp;
                        Tiene Apoderado
                    </div>
                    <div class="col-2 form-inline">
                        <a href="javascript:fncGuardarSolicitud()">
                            <div style="text-align: center"><input type="button" value="Guardar" alt="Guardar" class="btn btn-custom"></div>
                        </a> 
                    </div>
                </div>
            </div>
        </html:form>
         

 <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/3.3.1/jquery.min.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/bootstrap.min.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-1.12.4.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/ajax.js"></script>
        <script src="../scripts/jquery.js"></script>
      
    </body>
</html>
