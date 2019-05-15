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
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/main.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/style.css">
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-1.12.4.js"></script>
        
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css"></script>
        <script src="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"></script>
        <script>
            
        $( function() {
          $( "#fechaSeccionIni" ).datepicker();
          $( "#fechaSeccionFin" ).datepicker();
          $( "#fechaAsignacionIni" ).datepicker();
          $( "#fechaAsignacionFin" ).datepicker();
          $( "#fechaVencimientoIni" ).datepicker();
          $( "#fechaVencimientoFin" ).datepicker();
          $('#idConsulta').DataTable();
          
          $( "#btn-export" ).click(function() {
//            alert( "btn-export" );
          });
          
          $( "#btn-save" ).click(function() {
//            alert( "btn-save" );
          });
          
          $( "#btn-find" ).click(function() {
            var form=document.getElementById("frmConsulta");
            var tipoDocumento       = document.getElementById('tipoDocumento');
            
            var x = form.tipoDocumento.value;
            
            var numeroDocumento     = document.getElementById("numeroDocumento");
            var fechaSeccionIni     = document.getElementById("fechaSeccionIni");
            var fechaSeccionFin     = document.getElementById("fechaSeccionFin");
            var fechaAsignacionIni  = document.getElementById("fechaAsignacionIni");
            var fechaAsignacionFin  = document.getElementById("fechaAsignacionFin");
            var fechaVencimientoIni = document.getElementById("fechaVencimientoIni");
            var fechaVencimientoFin = document.getElementById("fechaVencimientoFin");
            var analista            = document.getElementById("analista");
            var estadoSolicitud     = document.getElementById("estadoSolicitud");
            if(x=="0")
                    {
                      alert("Debe seleccionar un tipo de Documento");
                      form.tipoDocumento.focus();
                      return;
                    }
                    
            //form.action="Consulta.do?method=buscarSolicitud&numDocumento="+numeroDocumento;
            form.action="Consulta.do?method=buscarSolicitud";
            form.method="post";
            form.submit(); 
          });

        } );
    
       function showModalWindow(codigo){
//        window.open('Consulta.do?method=verDetalleDocumento&codigo='+codigo,'window','height: 300px, width: 900px'); 
        window.open("Consulta.do?method=verDetalleDocumento&codigo="+codigo, "window", "scrollbars=yes,width=1000,height=560");
       }
        
       /*function fncBuscarSolicitud(){
            var form=document.getElementById("frmConsulta");
            var tipoDocumento       = document.getElementById('tipoDocumento');
            
            var x = form.tipoDocumento.value;
            
            var numeroDocumento     = document.getElementById("numeroDocumento");
            var fechaSeccionIni     = document.getElementById("fechaSeccionIni");
            var fechaSeccionFin     = document.getElementById("fechaSeccionFin");
            var fechaAsignacionIni  = document.getElementById("fechaAsignacionIni");
            var fechaAsignacionFin  = document.getElementById("fechaAsignacionFin");
            var fechaVencimientoIni = document.getElementById("fechaVencimientoIni");
            var fechaVencimientoFin = document.getElementById("fechaVencimientoFin");
            var analista            = document.getElementById("analista");
            var estadoSolicitud     = document.getElementById("estadoSolicitud");
            if(x=="0")
                    {
                      alert("Debe seleccionar un tipo de Documento");
                      form.tipoDocumento.focus();
                      return;
                    }
                    
            //form.action="Consulta.do?method=buscarSolicitud&numDocumento="+numeroDocumento;
            form.action="Consulta.do?method=buscarSolicitud";
            form.method="post";
            form.submit(); 
          }
        */
        </script>
                
                
                
    </head>
    <body>
        <div  class="container-fluid">
            <div class="row">
                <%@include file="../plantilla/menuDinamico.jsp" %>
                <div class="col-sm-10 col-sm-offset-1">
                    <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <i class="fa fa-bars"></i>&nbsp;<STRONG>CONSULTA</STRONG>&nbsp;
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>&nbsp;</td>
                                    </tr>
                          </table>
                    <html:form action="Consulta.do" styleId="frmConsulta" > 
                            <div class="form-group div-align-l">
                                <div class="row">
                                    <div class="col-3 form-inline">
                                        <label for="tipoDocumento">Tipo de Documento</label>&nbsp;
                                    </div>
                                    <div class="col-3 form-inline">
                                        <html:select property="tipoDocumento" styleClass="form-control">
                                                <html:option value="0">SELECCIONE</html:option>   
                                                <html:options collection="list" property="codigoTipoDocumento" labelProperty="descripcionTipoDocumento"/>
                                            </html:select>
                                    </div>
                                    <div class="col-1 form-inline">
                                        <label for="numeroDocumento">Numero</label>&nbsp;
                                    </div>
                                    <div class="col-3 form-inline">
                                        <!--<input class="form-control" type="text" value="" id="numeroDocumento">-->
                                        <html:text property="numeroDocumento" styleClass="form-control" size="20" maxlength="20"></html:text>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3 form-inline">
                                        <label for="fechaSeccionIni">Fecha Seccion Desde</label>&nbsp;
                                    </div>
                                    <div class="col-3 form-inline">
                                        <html:text property="fechaSeccionIni" styleClass="form-control" styleId="fechaSeccionIni" size="12" />&nbsp;
                                        <img id="imagen_calendario4" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                                    </div>
                                    <div class="col-1 form-inline">
                                        <label for="fechaSeccionFin">Hasta</label>&nbsp;
                                    </div>
                                    <div class="col-3 form-inline">
                                        <html:text property="fechaSeccionFin" styleClass="form-control" styleId="fechaSeccionFin" size="12" />&nbsp;
                                        <img id="imagen_calendario4" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3 form-inline">
                                        <label for="fechaAsignacionIni">Fecha Asignacion Inicial Desde</label>&nbsp;
                                    </div>
                                    <div class="col-3 form-inline">
                                        <html:text property="fechaAsignacionIni" styleClass="form-control" styleId="fechaAsignacionIni" size="12" />&nbsp;
                                        <img id="imagen_calendario4" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                                    </div>
                                    <div class="col-1 form-inline">
                                        <label for="fechaAsignacionFin">Hasta</label>&nbsp;
                                    </div>
                                    <div class="col-3 form-inline">
                                        <html:text property="fechaAsignacionFin" styleClass="form-control" styleId="fechaAsignacionFin" size="12" />&nbsp;
                                        <img id="imagen_calendario4" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3 form-inline">
                                        <label for="fechaVencimientoIni">Fecha Vencimiento Desde</label>&nbsp;
                                    </div>
                                    <div class="col-3 form-inline">
                                        <html:text property="fechaVencimientoIni" styleClass="form-control" styleId="fechaVencimientoIni" size="12" />&nbsp;
                                        <img id="imagen_calendario4" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                                    </div>
                                    <div class="col-1 form-inline">
                                        <label for="fechaVencimientoFin">Hasta</label>&nbsp;
                                    </div>
                                    <div class="col-3 form-inline">
                                        <html:text property="fechaVencimientoFin" styleClass="form-control" styleId="fechaVencimientoFin" size="12" />&nbsp;
                                        <img id="imagen_calendario4" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3 form-inline">
                                        <label for="analista">Analista</label>&nbsp;
                                    </div>
                                    <div class="col-3 form-inline">
                                        <!--<input class="form-control" type="text" value="" id="analista">-->
                                        <html:text property="analista" styleClass="form-control" size="20" maxlength="20"></html:text>
                                    </div>   
                                    <div class="col-1 form-inline">
                                        <label for="estadoSolicitud">Estado</label>&nbsp;
                                    </div>
                                    <div class="col-3 form-inline">
                                        <html:select property="estadoSolicitud" styleClass="form-control">
                                            <html:option value="0">SELECCIONE</html:option>   
                                            <html:options collection="listEstado" property="codigoTipoEstado" labelProperty="descripcionTipoEstado"/>
                                        </html:select>
                                    </div>
                                    
                                </div>
                                    <div class="space">&nbsp;</div>
                                <div class="row">
                                    <div class="col-7">
                                        &nbsp;
                                    </div>
                                    <div class="col-1">
                                        <input type="button" value="Exportar" alt="Exportar" id="btn-export" class="btn btn-custom">
                                    </div>
                                    <div class="col-1">
                                        <input type="button" value="Guardar" alt="Guardar" id="btn-save" class="btn btn-custom">
                                    </div>  
                                    <div class="col-1">
                                        <input type="button" value="Buscar" alt="Buscar" id="btn-find" class="btn btn-custom" >
                                    </div> 
                                </div>    
                            </div>

                            <c:if test="${listSolicitud != null}" var="ok">
                            <table id="idConsulta" class="table table-striped table-bordered" style="width:100%">

                                <thead>

                                    <tr>
                                        <th scope="col">Cuspp</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Tramite</th>
                                        <th scope="col">Etapa</th>
                                        <th scope="col">Fecha Vencimiento</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Detalle</th>
                                    </tr>

                                </thead>


                                <tbody>

                                    <c:forEach var="t" items="${listSolicitud}">

                                        <tr>
                                            <td align="center"><c:out value="${t.cuspp}"/></td>
                                            <td align="center"><c:out value="${t.afiliado}"/></td>
                                            <td align="center"><c:out value="${t.plan}"/></td>
                                            <td align="center"><c:out value="${t.etapa}"/></td>
                                            <td align="center"><c:out value="${t.fechaVencimientoSolicitud}"/></td>
                                            <td align="center"><c:out value="${t.estado}"/></td>
                                            <td align="center"><a href="javascript:showModalWindow('<c:out value="${t.idSolicitud}"/>')" >
                                                               <img src="<c:out value="${pageContext.request.contextPath}"/>/images/ico_detalle.GIF" width="16" height="18" border="0" />
                                                               </a>
                                            </td>

                                        </tr>


                                    </c:forEach>



                                </tbody>

                            </table>
                            <!--</div>-->

                            </c:if>

                        </html:form>
                </div>
                    
            </div>
        </div>