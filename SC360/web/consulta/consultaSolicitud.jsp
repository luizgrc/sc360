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
        <link rel="stylesheet" href="bootstrap-3.4.1/css/plugins/dataTables/dataTables.bootstrap.css" >
        <link rel="stylesheet" href="bootstrap-3.4.1/css/bootstrap-datetimepicker.css">
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
            <div class="row">
                <div class="col-lg-3 form-inline">
                    <label for="tipoDocumento">Tipo de Documento</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <select class="form-control">
                        <option>SELECCIONAR</option>
                    </select>
                </div>
                <div class="col-lg-1 form-inline">
                    <label for="numeroDocumento">Numero</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <input class="form-control" type="text" value="" id="numeroDocumento">
                </div>
            </div>
            <!-- Date Time Picker Fecha Seccion -->
            <div class="row">
                <div class="col-lg-3 form-inline">
                    <label for="fechaSeccionIni">Fecha Seccion Desde</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <div class='input-group date' id="fechaSeccionIni">
                        <input type='text' class="form-control" id="fechaSeccionIni" />
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
                        <input type='text' class="form-control" id='fechaSeccionFin' />
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
                        <input type='text' class="form-control" />
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
                        <input type='text' class="form-control" />
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
                        <input type='text' class="form-control" />
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
                        <input type='text' class="form-control" />
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
                    <input class="form-control" type="text" value="" id="analista">
                </div>
                <div class="col-lg-1 form-inline">
                    <label for="estadoSolicitud">Estado</label>&nbsp;
                </div>
                <div class="col-lg-3 form-inline">
                    <select class="form-control">
                        <option>SELECCIONAR</option>
                    </select>

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
                                    <tr class="odd gradeX">

                                        <td style="text-align: center;">Trident</td>
                                        <td style="text-align: center;">Internet Explorer 4.0</td>
                                        <td style="text-align: center;">Win 95+</td>
                                        <td style="text-align: center;">4</td>
                                        <td style="text-align: center;">X</td>
                                        <td style="text-align: center;">X</td>
                                        <td style="text-align: center;">
                                            <a href="javascript:showModalWindow()">
                                                <i class="fa fa-file-text fa-fw" style="color:#000;"></i></a></td>
                                    </tr>

                                </tbody>
                            </table>
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
                                            <a href="#step-2" type="button" class="btn btn-default btn-circle ">2</a>
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
                                            <a href="#step-6" type="button" class="btn btn-default btn-circle ">6</a>
                                            <p><small>Apelacion</small></p>
                                        </div>

                                    </div>
                                </div>
                                <!--/.Titles Steppers-->
                                <!--DATOS GENERALES-->
                                <form role="form" id="step-1" class="setup-content">
                                    <div class="panel panel-primary ">
                                        <!--Titulo-->
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Consulta detalle</h3>
                                        </div>
                                        <!--/.Titulo-->
                                        <div class="panel-body" style="width: auto;height: 400px;overflow-y: auto;">
                                            <div class="container">
                                                <div>
                                                    <STRONG>DATOS GENERALES</STRONG>&nbsp;
                                                </div>
                                                <div class="space">&nbsp;</div>
                                                <div class="col-md-12">
                                                    <div class="col-md-2">
                                                        <label style="margin: 4px">Exp &nbsp;</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <input property="numeroExpediente" class="form-control input-sm"
                                                            size="12" maxlength="12" disabled="true" /></div>
                                                </div>
                                                <div class="space">&nbsp;</div>
                                                <div>
                                                    <div class="col-lg-6">
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">CUSPP&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="text" required="" class="input-sm form-control"
                                                                style="width: 167px;" />
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="" id="cuspp">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Primer
                                                                nombre&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="text" required="" class="input-sm"
                                                                styleId="primerNombre" style="width: 167px;" />
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required"
                                                                id="primerNombre">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Segundo
                                                                Nombre&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="text" required="required" class="input-sm"
                                                                styleId="segundoNombre" style="width: 167px;" />
                                                        </div>
                                                        <div class="col-md-4 ">
                                                            <input type="checkbox" required="required"
                                                                id="segundoNombre">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Primer
                                                                Apellido&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="text" required="required" class=" input-sm"
                                                                styleId="primerApellido" style="width: 167px;" />

                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required"
                                                                id="primerApellido">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <!---->
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Segundo
                                                                Apellido&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="text" required="required" class="input-sm"
                                                                styleId="segundoApellido" style="width: 167px;" />

                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required"
                                                                id="segundoApellido">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <div class="col-lg-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Fecha
                                                                Nacimiento&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4 form-inline">
                                                            <div class="input-group date fechaModal">
                                                                <input type="text" required="required"
                                                                    class="form-control input-sm "
                                                                    style="width: 130px;" />
                                                                <span class="input-group-addon">
                                                                    <span class="fa fa-calendar"></span>
                                                                </span></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required"
                                                                id="fechaNacimiento">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Correo&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="text" required="required" styleId="correo"
                                                                class="input-sm" style="width: 167px;">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required" id="correo">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="col-md-4" style="height: 20px ">
                                                            <label style="padding-top: 10px;"> Sexo&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select required="required" style="width: 168px;"
                                                                class="input-sm">
                                                                <option value="">
                                                                    SELECCIONAR
                                                                </option>
                                                                <option value="00">
                                                                    Maculino
                                                                </option>
                                                                <option value="01">
                                                                    Femenino
                                                                </option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required" id="sexo">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <!---->
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Telefono&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input required="required" class=" input-sm" id="telefono"
                                                                style="width: 167px;" />

                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required" id="telefono">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Estado Civil&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select required="required" style="width: 168px;"
                                                                class="input-sm">
                                                                <option value="">
                                                                    SELECCIONAR
                                                                </option>
                                                                <option value="00">
                                                                    Soltero
                                                                </option>
                                                                <option value="01">
                                                                    Casado
                                                                </option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required" id="estadoCivil">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <!---->
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Direccion&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input required="required" class="input-sm" id="direccion"
                                                                size="20" maxlength="20" />

                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required" id="direccion">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <!---->
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Departamento&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select required="required" class=" input-sm"
                                                                style="width: 168px;" id="departamento">
                                                                <option value="">
                                                                    SELECCIONAR
                                                                </option>
                                                                <option value="00">
                                                                    lima
                                                                </option>
                                                                <option value="01">
                                                                    ate
                                                                </option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required"
                                                                id="departamento">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <!---->
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Provincia&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select required="required" class="input-sm"
                                                                style="width: 168px;" id="provincia">
                                                                <option value="">
                                                                    SELECCIONAR
                                                                </option>
                                                                <option value="00">
                                                                    smp
                                                                </option>
                                                                <option value="01">
                                                                    los olivos
                                                                </option>

                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required" id="provincia">
                                                        </div>
                                                        <div class="space">&nbsp;</div>
                                                        <!---->
                                                        <div class="col-md-4" style="height: 20px">
                                                            <label style="padding-top: 10px;">Distrito&nbsp;</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select name="distrito" style="width: 168px;"
                                                                required="required" class="input-sm" id="distrito">
                                                                <option value="">
                                                                    SELECCIONAR
                                                                </option>
                                                                <option value="00">
                                                                    lima
                                                                </option>
                                                                <option value="01">
                                                                    ate
                                                                </option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="checkbox" required="required" id="distrito">
                                                        </div>
                                                    </div>
                                                    <div class="space">&nbsp;</div>
                                                    <div class="container col-9 form-inline">
                                                        <input type="checkbox" required="required"
                                                            id="Apoderado">&nbsp;<label style="padding-top: 10px;">Tiene
                                                            Apoderado</label>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <button class="btn btn-custom nextBtn pull-right" type="submit">Siguiente</button>
                                </form>
                                <!--/.DATOS GENERALES-->
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
