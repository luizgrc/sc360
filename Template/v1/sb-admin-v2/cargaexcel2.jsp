<%-- 
    Document   : cargaExcel
    Created on : 05/02/2019, 08:21:58 AM
    Author     : epuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carga de Archivos</title>

    <!-- Page-Level Plugin CSS - Tables -->
    <link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
       
    </head>
                <%@include file="../plantilla/menuDinamico.jsp" %>
                <div id="page-wrapper">
                <div class="col-sm-10 col-sm-offset-1">
                    <html:form action="CargaExcel.do" styleId="frmcargaExcel" enctype="multipart/form-data">

                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="fa fa-bars"></i>&nbsp;<STRONG>PROCESO DE CARGA DE ARCHIVOS</STRONG>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <div class="form-group div-align-l">
                            <div class="row">
                                <div class="col-10">
                                    <label>Registre sus archivos correctamente en el sistema Coordinador 360, tomando en cuenta lo siguiente:</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-10">
                                    <ol>
                                        <li>Seleccione el Tipo de Archivo a Procesar, según el tipo de archivo EXCEL.</li>
                                        <li>Seleccione los  archivos a procesar dentro de su PC a través del botón "Examinar"..</li>
                                        <li>Finalmente presione el botón "Cargar".</li>
                                    </ol>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-3 form-inline">
                                    <label for="tipoArchivo">Tipo de Archivo</label>&nbsp;
                                </div>
                                <div class="col-7 form-inline">
                                    <html:select property="tipoArchivo" styleClass="form-control" styleId="tipoArchivo">   
                                        <html:option value="S">[SELECCIONAR]</html:option>
                                        <html:options collection="listTipoArchivo" property="tipoArchivo" labelProperty="descripcion"/>
                                    </html:select>
                                </div>
                            </div>
                            <div class="space">&nbsp;</div>
                            <div class="row">
                                <div class="col-3 form-inline">
                                    <label for="archivo">Archivo:</label>&nbsp;
                                </div>
                                <div class="col-7 form-inline">
                                    <html:file property="archivo" styleId="archivo" styleClass="form-control" size="70" />
                                </div>
                            </div>
                            <div class="space">&nbsp;</div>
                            <div class="row">
                                <div class="col-7 form-inline">
                                    &nbsp;
                                </div>
                                <div class="col-3 form-inline"><a href="javascript:cargarArchivo()">
                                   <input type="button" value="Cargar" alt="Cargar" id="btn-cargar" class="btn btn-custom" >
                                    </a>
                                </div>
                            </div>
                            <div class="space">&nbsp;</div>
                            <table id="idCarga" class="table table-striped table-bordered" style="width:100%">
                                <tr>
                                    <td scope="col">Nombre del Archivo</td>
                                    <td scope="col"># Registros Cargados</td>
                                    <td scope="col"># Registros Errados</td>
                                    <td scope="col">Estado</td>
                                    <td scope="col">Fecha Inicio</td>
                                    <td scope="col">Fecha Fin</td>
                                    <td scope="col">Log</td>
                                </tr>
                                <c:forEach var="documento" items="${requestScope.listCarga}">
                                    <tr>
                                        <td align="center"><c:out value="${documento.nombreArchivo}"/></td>
                                        <td align="center"><c:out value="${documento.cantidad}"/></td>
                                        <td align="center"><c:out value="${documento.cantidadErrados}"/></td>
                                        <td align="center"><c:out value="${documento.estadoCarga}"/></td>
                                        <td align="center"><c:out value="${documento.fechaInicio}"/></td>
                                        <td align="center"><c:out value="${documento.fechaFin}"/></td>
                                        <td align="center">
                                            <a href="javascript:GenerarLog('<c:out value="${documento.tipoArchivo}"/>')" >
                                                <img src="<c:out value="${pageContext.request.contextPath}"/>/images/log.png" width="16" height="18" border="0" />
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>   
                            </table>

                        </html:form>   
                    </div>
                </div>
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
            function cargarArchivo()
            { 
                var form=document.getElementById("frmcargaExcel");
                var tipoArchivo=document.getElementById("tipoArchivo").value;
                
                if(tipoArchivo==="S")
                    {
                      alert("Debe seleccionar un tipo de Archivo");
                      form.tipoArchivo.focus();
                      return;
                    }
                
                if(!confirm("Esta seguro de realizar la carga?"))
                return;
            
                form.action="CargaExcel.do?method=cargaExcel";;
                form.method="post";
                form.submit();

            }

            function GenerarLog(idArchivo) {

                var form = document.frmcargaExcel;
                form.action = "CargaExcel.do?method=generarCsvError&idArchivo=" + idArchivo;
                form.method = "post";
                form.submit();
            }
            
            $(function () {
                $('#idCarga').DataTable();

            });
        </script>

</body>

</html>
