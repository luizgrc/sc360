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
        <link href="bootstrap-3.4.1/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

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

                <!-- /.col-lg-12 -->
            </div>
            <div class="space">&nbsp;</div>
            <div class="row">
                <div class="col-lg-10">
                    <label>Registre sus archivos correctamente en el sistema Coordinador 360, tomando en cuenta lo
                        siguiente:</label>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10">
                    <ol>
                        <li>Seleccione el Tipo de Archivo a Procesar, según el tipo de archivo EXCEL.</li>
                        <li>Seleccione los archivos a procesar dentro de su PC a través del botón "Examinar"..</li>
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

                    <!-- <select class="form-control" id="tipoArchivo" >
                         <option value="S">SELECCIONAR</option>
                         <option value="A">Objeto 1</option>
                         <option value="B">Objeto 2</option>-->
                    </select>
                </div>
            </div>
            <div class="space">&nbsp;</div>
            <div class="row">
                <div class="col-lg-3">
                    <label for="archivo">Archivo:</label>&nbsp;
                </div>
                <div class="col-lg-7">
                    <html:file  property="archivo" styleId="archivo" styleClass="form-control" size="70" accept=".csv ,.xlsm,.xls"/>
                    <!--<input type="file" class="form-control" id="archivo" accept=".csv ,.xlsm,.xls" >-->
                    <div class="space">&nbsp;</div>
                </div>
            </div>
            <div class="space">&nbsp;</div>
            <div class="row">
                <div class="col-lg-7">
                    &nbsp;
                </div>
                <div class="col-lg-3">
                    <input type="button" value="Cargar" alt="Cargar" id="btn-cargar" class="btn btn-custom"
                           onclick="ValidarArchivo()">

                </div>
            </div>
            <div class="space">&nbsp;</div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">

                        <!-- /.panel-heading -->
                        <div class="panel-body">
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
                <!-- /.col-lg-12 -->
            </div>
            <!--/.Row Tabla Responsive-->
        </html:form>
    </div>
    <!-- /#page-wrapper -->
    <!-- /.modal -->
    <div class="modal fade" id="AlertModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Confirmación de Carga</h4>
                </div>
                <div class="modal-body">
                    <p>Esta seguro de realizar la carga?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-custom" onclick="CargaArchivo()">Guardar</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>
<!-- /#wrapper -->

<!-- Core Scripts - Include with every page -->
<script src="js/jquery-3.4.1.js"></script>
<script src="bootstrap-3.4.1/js/bootstrap.js"></script>
<script src="bootstrap-3.4.1/js/plugins/metisMenu/jquery.metisMenu.js"></script>

<!-- Page-Level Plugin Scripts - Tables -->
<script src="bootstrap-3.4.1/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="bootstrap-3.4.1/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- SB Admin Scripts - Include with every page -->
<script src="js/sb-admin.js"></script>
<script>
                        $(document).ready(function () {
                            $('#dataTables-example').dataTable();
                            //----------------------------------------------------------------
                            // Crear elemento Alerta de Error 
                            var myEl = document.createElement("div");
                            // Agregando clases al elemento
                            myEl.classList.add("alert");
                            myEl.classList.add("alert-danger");
                            // Agregando atributos al elemento
                            myEl.setAttribute("role", "alert")
                            // Agregando id
                            myEl.setAttribute("id", "msgError")
                            // Agregando Contenido del elemento
                            myEl.textContent = "Tipo de Archivo Incorrecto";
                            //----------------------------------------------------------------
                            $("#tipoArchivo").change(function (e) {

                                var select = e.target;
                                var selectParent = select.parentNode;
                                // console.log(select.value);
                                //console.log("----------");
                                //console.log(selectParent);

                                if (select.value !== "S") {

                                    if (selectParent.classList.contains('has-error')) {
                                        selectParent.classList.remove('has-error');
                                    }
                                    selectParent.classList.add('has-success');

                                } else {
                                    if (selectParent.classList.contains('has-success')) {

                                        selectParent.classList.remove('has-success');

                                        selectParent.classList.add('has-error');

                                    }
                                }


                            });

                            $("#archivo").change(function (e) {

                                var input = e.target;
                                var file = input.files[0];
                                var reImageName = /^.*\.(csv|xls|xlsm)$/i;
                                if (file) {
                                    var isExcel = reImageName.test(file.name);


                                    if (!isExcel) {
                                        input.parentNode.classList.add('has-error');

                                        input.parentNode.appendChild(myEl);
                                    } else {
                                        if (input.parentNode.classList.contains('has-error')) {
                                            input.parentNode.classList.remove('has-error');
                                        }

                                        input.parentNode.classList.add('has-success');

                                        if (document.contains(myEl)) {
                                            input.parentNode.removeChild(myEl);
                                        }

                                    }
                                } else {
                                    input.parentNode.classList.add('has-error');

                                    input.parentNode.appendChild(myEl);
                                }
                            });


                        });

                        function CargaArchivo() {
                            if ($('#frmcargaExcel').length) {
                                $('#frmcargaExcel').attr({
                                    action: 'CargaExcel.do?method=cargaExcel',
                                    method: 'POST'
                                });

                                $('#frmcargaExcel').submit();
                            }/*
                            var form = $('#frmcargaExcel').val();
                            form.action = "CargaExcel.do?method=cargaExcel";
                            ;
                            form.method = "post";
                            form.submit();*/
                        }

                        function ValidarArchivo() {

                            var tipoArchivo = $('#tipoArchivo').val();
                            var archivo = $('#archivo').val();

                            if (tipoArchivo === "S") {

                                $('#tipoArchivo').focus();
                                return;
                            }
                            if (archivo === "") {
                                $('#archivo').focus();
                                return;
                            }
                            if (!archivo || !tipoArchivo) {

                                return;
                            }

                            if ($('#msgError').length) {
                                return;
                            }

                            $('#AlertModal').modal({
                                backdrop: 'static',
                                keyboard: false
                            });



                        }

                        function GenerarLog(idArchivo) {
                            //Ejemplo : $('#your_form').attr('action', 'http://uri-for-button1.com');
                            if ($('#frmcargaExcel').length) {
                                $('#frmcargaExcel').attr({
                                    action: 'CargaExcel.do?method=generarCsvError&idArchivo=' + idArchivo,
                                    method: 'POST'
                                });

                                $('#frmcargaExcel').submit();
                            }
                            /*
                             var form = document.frmcargaExcel;
                             form.action = "CargaExcel.do?method=generarCsvError&idArchivo=" + idArchivo;
                             form.method = "post";
                             form.submit();*/
                        }
</script>

</body>

</html>
