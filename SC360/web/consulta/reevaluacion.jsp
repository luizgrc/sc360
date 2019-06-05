<%-- 
    Document   : reevaluacion
    Created on : 10/04/2019, 04:25:22 PM
    Author     : epuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>REEVALUACION</title>
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
        <script>

            $(function () {
                $("#fechaIngresoBeneficios").datepicker();
                $("#fechaEvaluacionDoc").datepicker();
                $("#fechaNotificacion").datepicker();
            });

            function irTraslado() {
                var form = document.frmReevaluacion;
                var url = "Traslado.do?method=inicioTraslado";
                var form = document.forms(0);
                form.action = url;
                form.method = "post";
                form.submit();
            }
            ;

            function irDictamen() {
                var form = document.frmReevaluacion;
                var numeroExp = form.numeroSeyci.value;
                var url = 'Dictamen.do?method=inicioDictamen&numeroExp=' + numeroExp;
                //var url = "Dictamen.do?method=inicioDictamen";
                var form = document.forms(0);
                form.action = url;
                form.method = "post";
                form.submit();
            }
            ;

            function fncGuardarReevaluacion() {

                var form = document.getElementById("frmReevaluacion");
                form.action = "Reevaluacion.do?method=guardaReevaluacion";
                form.method = "post";
                form.submit();

            }

        </script>
    </head>

    <body style="background-color:#FFFFFF;">
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link" href="javascript:irDetalle()">Detalle Consulta</a></li>
                <li class="nav-item"><a class="nav-link" href="#">SEYCI</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irTraslado()">TRASLADO</a></li>
                <li class="nav-item active"><a class="nav-link" href="javascript:irReevaluacion()">REEVALUACION</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irDictamen()">DICTAMEN</a></li>
                <li class="nav-item"><a class="nav-link" href="#">APELACION</a></li>
            </ul>
        </div>

        <html:form action="Reevaluacion.do" styleId="frmReevaluacion" >

            <div class="form-group div-align-l dv-align-2030">
                <div class="row show-grid">


                    <STRONG>REEVALUACION</STRONG>&nbsp;                   
                        <html:hidden property="numeroSeyci"></html:hidden>

                        <div class="space">&nbsp;</div>
                        <div class="col-md-6">


                            <div class="col-md-6">
                                Fec. Ingreso Beneficios
                                &nbsp;
                            </div>
                            <div class="col-md-6">
                                <div class="col-xs-10">
                                <html:text property="fechaIngresoBeneficios" styleClass="form-control input-sm" styleId="fechaIngresoBeneficios" size="12"/>
                            </div>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario">

                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-md-6">
                            Fecha de Evaluacion Doc                   
                            &nbsp;
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-10">
                                <html:text property="fechaEvaluacionDoc" styleClass="form-control input-sm" styleId="fechaEvaluacionDoc" size="12">

                                </html:text>
                            </div>

                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario">

                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-md-6">
                            Fecha de Notificacion
                            &nbsp;
                        </div>
                        <div class="col-md-6">
                            <div class="col-xs-10">
                                <html:text property="fechaNotificacion" styleClass="form-control input-sm" styleId="fechaNotificacion" size="12">

                                </html:text>
                            </div>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario">

                        </div>



                    </div>
                    <div class="col-md-6">


                        <div class="col-md-6">
                            Tipo Documento
                            &nbsp;
                        </div>
                        <div class="col-md-6">
                            <html:select property="tipoDocumento" styleClass="form-control input-sm">
                                <html:option value="0">SELECCIONE</html:option>   
                                <html:options collection="list" property="codigoTipoDocumento" labelProperty="descripcionTipoDocumento"/>
                            </html:select>  
                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-md-6">
                            Analista
                            &nbsp;
                        </div>
                        <div class="col-md-6">
                            <html:text property="analista" styleClass="form-control input-sm" size="20" maxlength="20"/>
                        </div>




                    </div>
                    <div class="col-md-12">
                        <div class="space">&nbsp;</div>
                        <div class="row">
                            <div class="col-6 form-inline">
                                Observaciones Reevaluacion
                                &nbsp;
                            </div>
                        </div>
                        <div class="space">&nbsp;</div>

                        <div class="col-8 form-inline">
                            <html:textarea cols="80" rows="4" styleClass="form-control input-sm" property="observacionesReevaluacion" readonly="false" />
                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-2 form-inline">
                            <a href="javascript:fncGuardarReevaluacion()">
                                <div style="text-align: center"><input type="button" value="Guardar" alt="Guardar" class="btn btn-custom"></div>
                            </a>
                        </div>

                    </div>
                </div>
            </div> 


        </html:form>
    </body>
</html>
