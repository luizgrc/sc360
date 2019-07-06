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
            <div class="row">
                
                <div class="col-lg-2 col-lg-offset-10"><a href="MantenimientoPlantillaCartas.do?method=inicio">

                    <button type="button" value="Guardar" alt="Agregar" id="btn-save"
                            class="btn btn-custom">GRABAR</button></a>
                </div>
            </div>
            <div class="row show-grid">
                <div class="col-md-3">TRAMITE</div>
                <div class="col-md-2">TIPO</div>
                <div class="col-md-3">ETAPA</div>
                <div class="col-md-2">COBERTURA</div>

            </div>

            <div class="row ">
                <div class="col-md-3 form-group"><input class="form-control" type="text" /></div>
                <div class="col-md-2 form-group"><input class="form-control" type="text" /></div>
                <div class="col-md-3 form-group"><input class="form-control" type="text" /></div>
                <div class="col-md-2 form-group"><input class="form-control" type="text" /></div>
                <a href="MantenimientoPlantillaCartas.do?method=inicio"><div class="col-md-2 form-group"><input class="btn btn-custom" type="submit" value="regresar" /></div></a>
            </div>

            <div class="row">

                <div class="col-lg-12">
                    <textarea cols="80"  class="form-control input-sm"
                              property="Apelacion"
                              style="min-height: 300px; max-height: 300px; resize: vertical;"></textarea>
                </div>
            </div>
            <!-- /Modal -->

            <!-- /.Modal -->


        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
</div>
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
