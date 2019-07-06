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
        <title>TopeGS</title>
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
                >&nbsp;<STRONG>TOPE-GS</STRONG>&nbsp;
            </div>
            <hr />
            <div class="col-lg-1 col-lg-offset-10">
                <button
                    type="button"
                    value="Agregar"
                    alt="Agregar"
                    class="btn btn-custom"
                    id="mostrarmodal"
                    >
                    Agregar
                </button>
            </div>
        </div>

        <div class="row show-grid">
            <div class="col-md-4">PERIODO</div>
            <div class="col-md-4">AÑO</div>
            <div class="col-md-4">TOPE</div>
        </div>

        <div class="row ">
            <div class="col-md-4 form-group">
                <select class="form-control"
                        ><option>SELECCIONRAR</option></select
                >
            </div>
            <div class="col-md-4 form-group">
                <select class="form-control"
                        ><option>SELECCIONRAR</option></select
                >
            </div>
            <div class="col-md-4 form-group">
                <select class="form-control"
                        ><option>SELECCIONRAR</option></select
                >
            </div>
        </div>
        <div class="row">
            <p>HISTORIAL</p>
        </div>
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
                                    <th style="text-align: center;">Periodo</th>
                                    <th style="text-align: center;">Año</th>
                                    <th style="text-align: center;">Tope</th>
                                    <th style="text-align: center;">
                                        <i class="fa fa-check" style="color:#000;"></i>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr class="odd gradeX">
                                    <td style="text-align: center;"></td>
                                    <td style="text-align: center;"></td>
                                    <td style="text-align: center;"></td>
                                    <td style="text-align: center;">
                                        <a href="javascript:showModalWindow()"
                                           ><i class="fa fa-pencil" style="color:#000;"></i
                                            ></a>
                                    </td>

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
        <div class="modal fade" id="modal-detalle" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document" style="width: 980px;">
                <div class="modal-content" style="height: 560px;">
                    <div class="modal-header">
                        <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                            >
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">Modal title</h4>
                    </div>
                    <!--Modal Body-->

                    <!--Modal Body-->
                    <div class="modal-body" >
                        <div class="container"  style="width: 800px;">

                            <%@include file="../mantenimiento/mantEtapas-topegsedicion.jsp" %>
                        </div>
                    </div>
                    <!--MANTENIMIENTO-->




                    <!--/.Modal Body-->
                    <!--/Modal Pie
                    <div class="modal-footer">
                      <button
                        type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                      >
                        Close
                      </button>
                      <button type="button" class="btn btn-primary">
                        Seleccionar
                      </button>
                    </div>
                    /.Modal Pie-->
                </div>
            </div>
        </div>

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

<script src="<c:out value="${pageContext.request.contextPath}"/>/js/mantenimientoTopeGS.js"></script>





</body>

</html>
