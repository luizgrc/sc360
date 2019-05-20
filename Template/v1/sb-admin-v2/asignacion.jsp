<%-- 
    Document   : asignacion
    Created on : 11/04/2019, 08:48:09 PM
    Author     : Elgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/main.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/style.css">
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-1.12.4.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css"></script>
        <script src="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"></script>
        <title>Asignacion</title>
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/main.css">
        <script>
            $(function () {
                $('#idAsignacion').DataTable();
                
                $( "#btn-asignar" ).click(function() {
            alert( "btn-export" );
          });
            });
            function fncAsignar() {

                alert("Asignar");

            }
        </script>
    </head>
    <body>

        <div  class="container-fluid">
            <div class="row">
                <%@include file="../plantilla/menuDinamico.jsp" %>
                <div class="col-sm-10 col-sm-offset-1">
                    <html:form action="Asignacion.do" styleId="frmAsignacion">

                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td >
                                    <i class="fa fa-bars"></i>&nbsp;<STRONG>ASIGNACION</STRONG>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                        <table id="idAsignacion"  class="table table-striped table-bordered" style="width:100%">
                            <tr>
                                <td scope="col">Fecha</td>
                                <td scope="col"># Solicitud</td>
                                <td scope="col">Cuspp</td>
                                <td scope="col">Afiliado</td>
                                <td scope="col">Ejecutivo Servicio</td>
                                <td scope="col">Analista</td>
                            </tr>
                            <c:forEach var="documento" items="${requestScope.listAsignacion}">
                                <tr>
                                    <td align="center"><c:out value="${documento.fecha}"/></td>
                                    <td align="center"><c:out value="${documento.numeroSolicitud}"/></td>
                                    <td align="center"><c:out value="${documento.cuspp}"/></td>
                                    <td align="center"><c:out value="${documento.afiliado}"/></td>
                                    <td align="center"><c:out value="${documento.ejecutivoServicioAtencion}"/></td>
                                    <td align="center"><c:out value="${documento.analista}"/></td>
                                </tr>
                            </c:forEach>   
                        </table>
                        <div class="space">&nbsp;</div>       
                        <div class="form-group">
                            <div class="row">
                                <div class="col-7 form-inline">
                                    &nbsp;
                                </div>
                                <div class="col-3 form-inline">
                                    <a href="javascript:fncAsignar()"><input type="button" id="btn-asignar" value="ASIGNAR" alt="Asignar" class="btn btn-custom">
                                    </a>
                                </div>
                            </div>
                        </div>


                    </html:form>
                </div>
            </div>
        </div>

    </center>
</body>
</html>
