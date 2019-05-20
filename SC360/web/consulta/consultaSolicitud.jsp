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
    <!-- Customize CSS - Consulta Tramite-->
    <link rel="stylesheet" href="bootstrap-3.4.1/css/bootstrap-datetimepicker.css">
    <!-- Page-Level Plugin CSS - Tables -->
    <link href="bootstrap-3.4.1/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    </head>
    <%@include file="../plantilla/menuDinamico.jsp" %>
     <div id="page-wrapper">
         <html:form action="Consulta.do" styleId="frmConsulta" > 
            <div class="space">&nbsp;</div>
            <div class="space">&nbsp;</div>
            <div class="row">
                    <div class="col-lg-10">
                            <i class="fa fa-search fa-fw"></i>&nbsp;<STRONG>CONSULTA DE TRÁMITES</STRONG>&nbsp;
                        </div>

                    <!-- /.col-lg-12 -->
            </div>
                <div class="row">
                    <div class="col-lg-3 form-inline">
                        <label for="tipoDocumento">Tipo de Documento</label>&nbsp;
                    </div>
                    <div class="col-lg-3 form-inline">
                        <html:select property="tipoDocumento" styleClass="form-control">
                                <html:option value="0">SELECCIONE</html:option>   
                                <html:options collection="list" property="codigoTipoDocumento" labelProperty="descripcionTipoDocumento"/>
                            </html:select>
                            <!--<select class="form-control">
                                <option>SELECCIONAR</option>
                            </select>-->
                    </div>
                    <div class="col-lg-1 form-inline">
                        <label for="numeroDocumento">Numero</label>&nbsp;
                    </div>
                    <div class="col-lg-3 form-inline">
                        <!--<input class="form-control" type="text" value="" id="numeroDocumento">-->
                        <html:text property="numeroDocumento" styleClass="form-control" size="20" maxlength="20"></html:text>
                    </div>
                </div>
                <!-- Date Time Picker Fecha Seccion -->
                <div class="row">
                    <div class="col-lg-3 form-inline">
                        <label for="fechaSeccionIni">Fecha Seccion Desde</label>&nbsp;
                    </div>
                    <div class="col-lg-3 form-inline">
                        
                        <div class="input-group date"  id="fechaSeccionIni">
                            <html:text property="fechaSeccionIni" styleClass="form-control" styleId="fechaSeccionIni" size="12" value="" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-1 form-inline">
                        <label for="fechaSeccionFin">Hasta</label>&nbsp;
                    </div>
                    <div class="col-lg-3 form-inline">
                        
                        <div class="input-group date" id="fechaSeccionFin">
                            <html:text property="fechaSeccionFin" styleClass="form-control" styleId="fechaSeccionFin" size="12" value="" />
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
                        <div class="input-group date" id="fechaAsignacionIni" >
                            <html:text property="fechaAsignacionIni" styleClass="form-control" styleId="fechaAsignacionIni" size="12" value=""  />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-1 form-inline">
                        <label for="fechaAsignacionFin">Hasta</label>&nbsp;
                    </div>
                    <div class="col-lg-3 form-inline">
                        
                        <div class="input-group date" id="fechaAsignacionFin">
                            <html:text property="fechaAsignacionFin" styleClass="form-control" styleId="fechaAsignacionFin" size="12" value=""  />
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
                        
                        <div class="input-group date" id="fechaVencimientoIni">
                                <html:text property="fechaVencimientoIni" styleClass="form-control" styleId="fechaVencimientoIni" size="12" value=""  />
                                <span class="input-group-addon">
                                    <span class="fa fa-calendar"></span>
                                </span>
                        </div>
                    </div>
                    <div class="col-lg-1 form-inline">
                        <label for="fechaVencimientoFin">Hasta</label>&nbsp;
                    </div>
                    <div class="col-lg-3 form-inline">
                        
                        <div class="input-group date" id="fechaVencimientoFin">
                                <html:text property="fechaVencimientoFin" styleClass="form-control" styleId="fechaVencimientoFin" size="12" value=""  />
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
                        
                        <html:text property="analista" styleClass="form-control" size="20" maxlength="20"></html:text>
                    </div>   
                    <div class="col-lg-1 form-inline">
                        <label for="estadoSolicitud">Estado</label>&nbsp;
                    </div>
                    <div class="col-lg-3 form-inline">
                        <html:select property="estadoSolicitud" styleClass="form-control">
                            <html:option value="0">SELECCIONE</html:option>   
                            <html:options collection="listEstado" property="codigoTipoEstado" labelProperty="descripcionTipoEstado"/>
                        </html:select>
                        <!--<select class="form-control">
                                <option>SELECCIONAR</option>
                            </select>-->

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
                        <input type="button" value="Buscar" alt="Buscar" id="btn-find" class="btn btn-custom" >
                    </div> 
                </div>    
                <div class="space">&nbsp;</div>
                <c:if test="${listSolicitud != null}" var="ok">
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
                                                <c:forEach var="t" items="${listSolicitud}">
                                                <tr class="odd gradeX">
                                                    <td style="text-align: center;"><c:out value="${t.cuspp}"/></td>
                                                    <td style="text-align: center;"><c:out value="${t.afiliado}"/></td>
                                                    <td style="text-align: center;"><c:out value="${t.plan}"/></td>
                                                    <td style="text-align: center;"><c:out value="${t.etapa}"/></td>
                                                    <td style="text-align: center;"><c:out value="${t.fechaVencimientoSolicitud}"/></td>
                                                    <td style="text-align: center;"><c:out value="${t.estado}"/></td>
                                                    <td style="text-align: center;">
                                                    <a  href="javascript:showModalWindow('<c:out value="${t.idSolicitud}"/>')">
                                                    <i class="fa fa-file-text fa-fw" style="color:#000;"></i></a></td>
                                                </tr>
                                                </c:forEach>   
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->

                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </c:if>
                </html:form>        

            
           
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="js/jquery-3.4.1.js" ></script>
    <script src="bootstrap-3.4.1/js/bootstrap.js"></script>
    <script src="bootstrap-3.4.1/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <!-- Moment JS-->
    <script src="bootstrap-3.4.1/js/moment.js"></script>
    
    <!-- Page-Level Plugin Scripts - Tables -->
    <script src="bootstrap-3.4.1/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="bootstrap-3.4.1/js/plugins/dataTables/dataTables.bootstrap.js"></script>


    <!-- SB Admin Scripts - Include with every page -->
    <script src="js/sb-admin.js"></script>

    <!-- Customize JS - Consulta Tramite-->
    <script src="bootstrap-3.4.1/js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/consultaSolicitud.js"></script>


</body>

</html>
