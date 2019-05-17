<%-- 
    Document   : cargaExcel
    Created on : 05/02/2019, 08:21:58 AM
    Author     : epuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Carga de Archivos</title>
        <!-- Page-Level Plugin CSS - Tables -->
        <link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    </head>
    <%@include file="../plantilla/menuDinamico.jsp" %>
    <!-- /page-wrapper -->
    <div id="page-wrapper">
        <!--/Wrapper Titulo-->
        <html:form action="CargaExcel.do" styleId="frmcargaExcel" enctype="multipart/form-data">
        <div class="space">&nbsp;</div>
        <div class="space">&nbsp;</div>
        <div class="row">
            <div class="col-lg-10">
                <i class="fa fa-upload"></i>&nbsp;<STRONG>PROCESO DE CARGA DE ARCHIVOS</STRONG>&nbsp;
            </div>
        </div>
        <div class="space">&nbsp;</div>
        <!--/.Wrapper Titulo-->
        <!--/Llenar Datos Wrapper Form-->
        <div class="row">
            <div class="col-lg-10">
                <label>Registre sus archivos correctamente en el sistema Coordinador 360, tomando en cuenta lo siguiente:</label>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-10">
                <ol>
                    <li>Seleccione el Tipo de Archivo a Procesar, según el tipo de archivo EXCEL.</li>
                    <li>Seleccione los  archivos a procesar dentro de su PC a través del botón "Examinar"..</li>
                    <li>Finalmente presione el botón "Cargar".</li>
                </ol>
            </div>
        </div>
        <div class="space">&nbsp;</div>
        <div class="row">
            <div class="col-lg-3">
                <label for="tipoArchivo">Tipo de Archivo</label>&nbsp;
            </div>
            <div class="col-lg-7">

                <html:select property="tipoArchivo" styleClass="form-control" styleId="tipoArchivo">   
                    <html:option value="S">[SELECCIONAR]</html:option>
                    <html:options collection="listTipoArchivo" property="tipoArchivo" labelProperty="descripcion"/>
                </html:select>

            </div>
        </div>
        <div class="space">&nbsp;</div>
        <div class="row">
            <div class="col-lg-3">
                <label for="archivo">Archivo:</label>&nbsp;
            </div>
            <div class="col-lg-7">
                <html:file property="archivo" styleId="archivo" styleClass="form-control" size="70" />
                
            </div>
        </div>
        <div class="space">&nbsp;</div>
        <div class="row">
            <div class="col-lg-7">
                &nbsp;
            </div>
            <div class="col-lg-3">
                <input type="button" value="Cargar" alt="Cargar" id="btn-cargar" class="btn btn-custom" onclick="cargarArchivo()" >

            </div>
        </div>
        <div class="space">&nbsp;</div>
        <!--/.Llenar Datos Wrapper Form-->
        <!--/Row Tabla Responsive-->
        <div class="row">
            <div class="col-lg-12">
                <!--/panel-->
                <div class="panel panel-default">
                    <!-- /panel-body -->
                    <div class="panel-body">
                         <!-- /table-responsive -->
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Nombre de Archivo</th>
                                        <th># Registros Cargados</th>
                                        <th># Registros Errados</th>
                                        <th>Estado</th>
                                        <th>Fecha Inicio</th>
                                        <th>Fecha Fin</th>
                                        <th>Log</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="documento" items="${requestScope.listCarga}">
                                    <tr class="odd gradeX">
                                        <td><c:out value="${documento.nombreArchivo}"/></td>
                                        <td style="text-align: center;"><c:out value="${documento.cantidad}"/></td>
                                        <td style="text-align: center;"><c:out value="${documento.cantidadErrados}"/></td>
                                        <td style="text-align: center;"><c:out value="${documento.estadoCarga}"/></td>
                                        <td style="text-align: center;"><c:out value="${documento.fechaInicio}"/></td>
                                        <td style="text-align: center;"><c:out value="${documento.fechaFin}"/></td>
                                        <td style="text-align: center;"> 
                                            <a  href="javascript:GenerarLog('<c:out value="${documento.tipoArchivo}"/>')">
                                            <i class="fa fa-file-text fa-fw" style="color:#000;"></i></a>
                                        </td>
                                    </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
        </div>
        <!--/.Row Tabla Responsive-->
        </html:form>
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Core Scripts - Include with every page -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>

<!-- Page-Level Plugin Scripts - Tables -->
<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- SB Admin Scripts - Include with every page -->
<script src="js/sb-admin.js"></script>
<script>
                               $(document).ready(function () {
                                   $('#dataTables-example').dataTable();
                               });
                               function cargarArchivo()
                               {
                                   var form = document.getElementById("frmcargaExcel");
                                   var tipoArchivo = document.getElementById("tipoArchivo").value;

                                   if (tipoArchivo === "S")
                                   {
                                       alert("Debe seleccionar un tipo de Archivo");
                                       form.tipoArchivo.focus();
                                       return;
                                   }

                                   if (!confirm("Esta seguro de realizar la carga?"))
                                       return;

                                   form.action = "CargaExcel.do?method=cargaExcel";
                                   ;
                                   form.method = "post";
                                   form.submit();

                               }

                               function GenerarLog(idArchivo) {

                                   var form = document.frmcargaExcel;
                                   form.action = "CargaExcel.do?method=generarCsvError&idArchivo=" + idArchivo;
                                   form.method = "post";
                                   form.submit();
                               }

</script>

</body>

</html>
