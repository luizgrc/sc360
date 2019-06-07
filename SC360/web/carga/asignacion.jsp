<%-- 
    Document   : asignacion
    Created on : 11/04/2019, 08:48:09 PM
    Author     : Elgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>

        <title>Asignacion</title>
        <!-- Page-Level Plugin CSS - Tables -->
        <link href="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    </head>
    <%@include file="../plantilla/menuDinamico.jsp" %>
<!-- /page-wrapper -->
        <div id="page-wrapper">
            <html:form action="Asignacion.do" styleId="frmAsignacion">
                <div class="space">&nbsp;</div>
                <div class="space">&nbsp;</div>
                <div class="row">
                        <div class="col-lg-10">
                                <i class="fa fa-upload"></i>&nbsp;<STRONG>ASIGNACION</STRONG>&nbsp;
                            </div>

                        <!-- /.col-lg-12 -->
                </div>
                <div class="space">&nbsp;</div>

                <div class="panel panel-default">
             
                <div class="panel-body">
                        <div class="table-responsive table-bordered">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">Fecha</th>
                                        <th style="text-align: center;"># Solicitud</th>
                                        <th style="text-align: center;">Cuspp</th>
                                        <th style="text-align: center;">Afiliado</th>
                                        <th style="text-align: center;">Ejecutivo Servicio</th>
                                        <th style="text-align: center;">Analista</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="documento" items="${requestScope.listAsignacion}">
                                    <tr>
                                        <td style="text-align: center;"><c:out value="${documento.fecha}"/></td>
                                        <td style="text-align: center;"><c:out value="${documento.numeroSolicitud}"/></td>
                                        <td style="text-align: center;"><c:out value="${documento.cuspp}"/></td>
                                        <td style="text-align: center;"><c:out value="${documento.afiliado}"/></td>
                                        <td style="text-align: center;"><c:out value="${documento.ejecutivoServicioAtencion}"/></td>
                                        <td style="text-align: center;"><c:out value="${documento.analista}"/></td>
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

                    <div class="space">&nbsp;</div>       
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-7 form-inline">
                                &nbsp;
                            </div>
                            <div class="col-lg-3 form-inline">
                                
                                <input type="button" value="ASIGNAR" alt="Asignar" id="btn-asignar" class="btn btn-custom" onclick="fncAsignar()" >
                            </div>
                        </div>
                    </div>
           </html:form>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="<c:out value="${pageContext.request.contextPath}"/>/js/jquery-3.4.1.js"></script>
    <script src="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/js/bootstrap.js"></script>
    <script src="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Tables -->
    <script src="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="<c:out value="${pageContext.request.contextPath}"/>/js/sb-admin.js"></script>
    <script>
            $(function () {
                $( "#btn-asignar" ).click(function() {

          });
            });
            function fncAsignar() {
                alert("Asignar");
            }
            
    </script>

</body>

</html>
