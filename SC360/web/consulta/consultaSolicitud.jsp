<%-- 
    Document   : consultaSolicitud
    Created on : 15/02/2019, 10:52:25 AM
    Author     : epuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Solicitudes</title>
        <!-- Page-Level Plugin CSS - Tables -->
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/css/plugins/dataTables/dataTables.bootstrap.css" >
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/css/bootstrap-datetimepicker.css">
        <!-- Customize CSS - Consulta Tramite-->


    </head>
    <%@include file="../plantilla/menuDinamico.jsp" %>
    <div id="page-wrapper">
        <div class="space">&nbsp;</div>
        <div class="space">&nbsp;</div>
        <div class="row">
            <div class="col-lg-10">
                <i class="fa fa-search fa-fw"></i>&nbsp;<STRONG>CONSULTA DE TRÁMITES</STRONG>&nbsp;
            </div>

            <!-- /.col-lg-12 -->
        </div>
        <html:form action="Consulta.do" styleId="frmConsulta" > 
            <div class="row">
                <div class="col-lg-3 form-inline">
                    <label for="tipoDocumento">Tipo de Documento</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <html:select property="tipoDocumento" styleClass="form-control" styleId="tipoDocumento">
                        <html:option value="0">SELECCIONE</html:option>   
                        <html:options collection="list" property="codigoTipoDocumento" labelProperty="descripcionTipoDocumento"/>
                    </html:select>
                </div>
                <div class="col-lg-1 form-inline">
                    <label for="numeroDocumento">Numero</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <html:text property="numeroDocumento" styleClass="form-control" size="20" maxlength="20"></html:text>
                    </div>
                </div>
                <!-- Date Time Picker Fecha Seccion -->
                <div class="row">
                    <div class="col-lg-3 form-inline">
                        <label for="fechaSeccionIni">Fecha Seccion Desde</label>&nbsp;
                    </div>
                    <div class="col-lg-3 form-inline">
                        <div class='input-group date' id="fechaSeccionIni">
                        <html:text property="fechaSeccionIni" styleClass="form-control"/>
                        <span class="input-group-addon">
                            <span class="fa fa-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="col-lg-1 form-inline">
                    <label for="fechaSeccionFin">Hasta</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <div class='input-group date' id='fechaSeccionFin'>
                        <html:text property="fechaSeccionFin" styleClass="form-control"/>
                        <span class="input-group-addon">
                            <span class="fa fa-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <!-- /.Date Time Picker Fecha Seccion -->
            <!-- Date Time Picker Fecha Asignación-->
            <div class="row">
                <div class="col-lg-3 form-inline">
                    <label for="fechaAsignacionIni">Fecha Asignacion Inicial Desde</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <div class='input-group date' id='fechaAsignacionIni'>
                        <html:text property="fechaAsignacionIni" styleClass="form-control"/>
                        <span class="input-group-addon">
                            <span class="fa fa-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="col-lg-1 form-inline">
                    <label for="fechaAsignacionFin">Hasta</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <div class='input-group date' id='fechaAsignacionFin'>
                        <html:text property="fechaAsignacionFin" styleClass="form-control" />
                        <span class="input-group-addon">
                            <span class="fa fa-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <!-- /.Date Time Picker Fecha Asignación-->
            <!-- Date Time Picker Fecha Vencimiento-->
            <div class="row">
                <div class="col-lg-3 form-inline">
                    <label for="fechaVencimientoIni">Fecha Vencimiento Desde</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <div class='input-group date' id='fechaVencimientoIni'>
                        <html:text property="fechaVencimientoIni" styleClass="form-control"/>
                        <span class="input-group-addon">
                            <span class="fa fa-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="col-lg-1 form-inline">
                    <label for="fechaVencimientoFin">Hasta</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <div class='input-group date' id='fechaVencimientoFin'>
                        <html:text property="fechaVencimientoFin" styleClass="form-control"/>
                        <span class="input-group-addon">
                            <span class="fa fa-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <!-- /.Date Time Picker Fecha Vencimiento-->
            <div class="row">
                <div class="col-lg-3 form-inline">
                    <label for="analista">Analista</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <html:text property="analista" styleClass="form-control" styleId="analista"></html:text>
                    </div>
                    <div class="col-lg-1 form-inline">
                        <label for="estadoSolicitud">Estado</label>&nbsp;
                    </div>
                    <div class="col-lg-3 form-inline">
                    <html:select property="estadoSolicitud" styleClass="form-control">
                        <html:option value="0">SELECCIONE</html:option>   
                        <html:options collection="listEstado" property="codigoTipoEstado" labelProperty="descripcionTipoEstado"/>
                    </html:select>
                </div>

            </div>
            <div class="space">&nbsp;</div>
            <div class="row">
                <div class="col-lg-7">
                    &nbsp;
                </div>
                <div class="col-lg-1">
                    <input type="button" value="Exportar" alt="Exportar" id="btn-export" class="btn btn-custom">
                </div>
                <div class="col-lg-1">
                    <input type="button" value="Guardar" alt="Guardar" id="btn-save" class="btn btn-custom">
                </div>
                <div class="col-lg-1">
                    <input type="button" value="Buscar" alt="Buscar" id="btn-find" class="btn btn-custom">
                </div>
            </div>
            <div class="space">&nbsp;</div>
            <!-- Detalle -->
            <div class="row">
                <div class="col-lg-12">

                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">Cuspp</th>
                                        <th style="text-align: center;">Nombre</th>
                                        <th style="text-align: center;">Tramite</th>
                                        <th style="text-align: center;">Etapa</th>
                                        <th style="text-align: center;">Fecha Vencimiento</th>
                                        <th style="text-align: center;">Estado</th>
                                        <th style="text-align: center;">Detalle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${listSolicitud != null}" var="ok">
                                        <c:forEach var="t" items="${listSolicitud}">
                                            <tr class="odd gradeX">

                                                <td style="text-align: center;"><c:out value="${t.cuspp}"/></td>
                                                <td style="text-align: center;"><c:out value="${t.afiliado}"/></td>
                                                <td style="text-align: center;"><c:out value="${t.plan}"/></td>
                                                <td style="text-align: center;"><c:out value="${t.etapa}"/></td>
                                                <td style="text-align: center;"><c:out value="${t.fechaVencimientoSolicitud}"/></td>
                                                <td style="text-align: center;"><c:out value="${t.estado}"/></td>
                                                <td style="text-align: center;">
                                                    <a href="javascript:showModalWindow('<c:out value="${t.idSolicitud}"/>')">
                                                        <i class="fa fa-file-text fa-fw" style="color:#000;"></i></a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </html:form>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->

            </div>
            <!-- /.col-lg-12 -->
        </div>

        <!-- /Modal -->
        <div class="modal fade" id="modal-detalle" tabindex="-1" role="dialog" style="font-size: 9px; ">
            <div class="modal-dialog" role="document" style="width: 1270px;">
                <div class="modal-content" style="height: 620px;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!--Modal Body-->
                    <div class="modal-body">
                        <!--Contenedor-->
                        <div class="container" style="width: 1235px;">
                            <!--Titles Steppers-->
                            <div class="stepwizard">
                                <div class="stepwizard-row setup-panel">
                                    <div class="stepwizard-step col-xs-2">
                                        <a href="#step-1" type="button" class="btn btn-warning btn-circle">1</a>
                                        <p><small>Consulta Detalle</small></p>
                                    </div>
                                    <div class="stepwizard-step col-xs-2">
                                        <a href="#step-2" type="button" class="btn btn-default btn-circle">2</a>
                                        <p><small>Seyci</small></p>
                                    </div>
                                    <div class="stepwizard-step col-xs-2">
                                        <a href="#step-3" type="button" class="btn btn-default btn-circle ">3</a>
                                        <p><small>Traslado</small></p>
                                    </div>
                                    <div class="stepwizard-step col-xs-2">
                                        <a href="#step-4" type="button" class="btn btn-default btn-circle ">4</a>
                                        <p><small>Reevaluacion</small></p>
                                    </div>
                                    <div class="stepwizard-step col-xs-2">
                                        <a href="#step-5" type="button" class="btn btn-default btn-circle ">5</a>
                                        <p><small>Dictamen</small></p>
                                    </div>
                                    <div class="stepwizard-step col-xs-2">
                                        <a href="#step-6" type="button"
                                           class="btn btn-default btn-circle ">6</a>
                                        <p><small>Apelacion</small></p>
                                    </div>

                                </div>
                            </div>
                            <!--/.Titles Steppers-->
                            <!--DATOS GENERALES-->

                            <%@include file="../consulta/detalleConsulta.jsp" %>

                            <!--/.DATOS GENERALES-->

                            <!--SEYCI-->
                            <%@include file="../consulta/inicioSeyci.jsp" %>
                            <!--/.SEYCI-->

                            <!--TRASLADO-->
                            <%@include file="../consulta/traslado.jsp" %>
                            <!--/.SEYCI-->
                            <!--REEVALUACION-->
                            <%@include file="../consulta/reevaluacion.jsp" %>
                            <!--/.REEVALUACION-->
                        </div>
                        <!--/.Contenedor-->
                    </div>
                    <!--/.Modal Body-->
                </div>
            </div>
        </div><!-- /.Modal -->



    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Core Scripts - Include with every page -->
<script src="<c:out value="${pageContext.request.contextPath}"/>/js/jquery-3.4.1.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/js/bootstrap.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<!-- Moment JS-->
<script src="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/js/moment.js"></script>

<!-- Page-Level Plugin Scripts - Tables -->
<script src="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/js/plugins/dataTables/dataTables.bootstrap.js"></script>


<!-- SB Admin Scripts - Include with every page -->
<script src="<c:out value="${pageContext.request.contextPath}"/>/js/sb-admin.js"></script>

<!-- Customize JS - Consulta Tramite-->
<script src="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/js/bootstrap-datetimepicker.min.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}"/>/js/reevaluacion.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}"/>/js/seyci.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}"/>/js/traslado.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}"/>/js/consultaSolicitud.js"></script>




</body>

</html>
