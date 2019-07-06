<%-- 
    Document   : consultaSolicitud
    Created on : 15/02/2019, 10:52:25 AM
    Author     : evalencia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plantilla de Cartas</title>
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
                <i class="fa fa-search fa-fw"></i
                >&nbsp;<STRONG>PLANTILLA DE CARTAS</STRONG>&nbsp;
            </div>
            <hr />
            <div class="col-lg-1 col-lg-offset-10">
                <a href="MantenimientoPlantillaCartas.do?method=editar"> <button
                        type="button"
                        value="Agregar"
                        alt="Agregar"
                        class="btn btn-custom"
                        id="mostrarmodal"
                        >
                        Agregar
                    </button></a>
            </div>
        </div>
        <div class="space">&nbsp;</div>
        <div class="row">
            <div class="col-lg-12">
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table
                            class="table table-striped table-bordered table-hover"
                            id="dataTables-example"
                            >
                            <thead>
                                <tr>
                                    <th style="text-align: center;"></th>
                                    <th style="text-align: center;">Tramite</th>
                                    <th style="text-align: center;">Tipo</th>
                                    <th style="text-align: center;">Etapa</th>
                                    <th style="text-align: center;">Cob</th>
                                    <th style="text-align: center;"><i class="fa fa-check" style="color:#000;"></i></th>
                                    <th style="text-align: center;"><i class="fa fa-times" style="color:#000;"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${listCorreo != null}" var="ok">
                                    <c:forEach var="t" items="${listCorreo}">
                                        <tr class="odd gradeX">
                                            <td style="text-align: center;">
                                                <a href=""><i class="fa fa-eye" style="color:#000;"></i></a>
                                            </td>
                                            <td style="text-align: center;"><c:out value="${t.tramite}"/></td>
                                            <td style="text-align: center;"><c:out value="${t.tipo}"/></td>
                                            <td style="text-align: center;"><c:out value="${t.etapa}"/></td>
                                            <td style="text-align: center;"><c:out value="${t.cobertura}"/></td>
                                            <td style="text-align: center;">
                                                <a href="MantenimientodePlantillaCartas.do?method=editar&codigo=<c:out value="${t.codigo}"/>"><i class="fa fa-pencil" style="color:#000;"></i></a>
                                                </td>
                                                <td style="text-align: center;">
                                                    <a class="delete"><i class="fa fa-eraser" style="color:#000;"></i></a>
                                                </td>
                                            </tr>
                                    </c:forEach>
                                </c:if>
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
<script src="<c:out value="${pageContext.request.contextPath}"/>/js/utils/jszip.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}"/>/js/utils/FileSaver.js"></script>

<script src="<c:out value="${pageContext.request.contextPath}"/>/js/mantenimientoPlantillaCartas.js"></script>





</body>

</html>
