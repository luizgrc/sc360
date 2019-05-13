<%-- 
    Document   : dictamen
    Created on : 17/04/2019, 09:04:57 PM
    Author     : Elgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>DICTAMEN</title>
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/css/bootstrap.min.css">
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/3.3.1/jquery.min.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/bootstrap.min.js"></script>
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/main.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/style.css">
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-1.12.4.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/ajax.js"></script>
        <script src="../scripts/jquery.js"></script>
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/layout-default.css">
        
        <script>

            $(function () {
                $("#fecRecAFP").datepicker();
                $("#fecEmision").datepicker();
                $("#fecInicial").datepicker();
                $("#fecFinal").datepicker();
                $("#fecOcurrencia").datepicker();
                $("#fecNotificacion").datepicker();
                $("#proximaEvaluacion").datepicker();
                $("#fecRecNotificacion").datepicker();

            });
            
            function myCheck(idNroTraslado){
                              
                 var i 
                 for (i=0;i<document.frmDictamen.chkid.length;i++){ 
                 if (document.frmDictamen.chkid[i].checked) 
                     break; 
                 } 
                 
                 var form = document.frmDictamen;
                 var url = 'Dictamen.do?method=mostrarDictamen&idNroTraslado='+idNroTraslado;
                 //form.action="ConsultaDocumentos.do?metodo=actualizacionDocumento&codigo="+codigo+"&coddestinatario="+coddestinatario;
                 var form = document.forms(0);
                 form.action = url;
                 form.method = "post";
                 form.submit();
              //}
             
         }

            function irReevaluacion() {
                var form = document.frmDictamen;
                var url = "Reevaluacion.do?method=inicioReevaluacion";
                var form = document.forms(0);
                form.action = url;
                form.method = "post";
                form.submit();
            }

            function irApelacion() {
                var form = document.frmDictamen;
                var numeroExp = form.nroSeyci.value;
                var url = 'Apelacion.do?method=inicioApelacion&numeroExp='+numeroExp;
                //var url = "Apelacion.do?method=inicioApelacion";
                var form = document.forms(0);
                form.action = url;
                form.method = "post";
                form.submit();
            }

            function fncGuardarDictamen() {
                var form = document.getElementById("frmDictamen");
                form.action = "Dictamen.do?method=guardarDictamen";
                form.method = "post";
                form.submit();
            }


        </script>
    </head>
    <body style="text-align: center ">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link" href="javascript:irDetalle()">Detalle Consulta</a></li>
                <li class="nav-item"><a class="nav-link" href="#">SEYCI</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irTraslado()">TRASLADO</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irReevaluacion()">REEVALUACION</a></li>
                <li class="nav-item active"><a class="nav-link" href="#">DICTAMEN</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irApelacion()">APELACION</a></li>
            </ul>
        </div>
        <html:form action="Dictamen.do" styleId="frmDictamen" >
            
            <div class="form-group div-align-l dv-align-2030">
                <div class="row">
                    <div class="col-6 form-inline">
                        <STRONG>DICTAMEN</STRONG>&nbsp;
                        <html:hidden property="nroSeyci"></html:hidden>
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Fecha Recepción AFP&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                    <html:text property="fecRecAFP" styleClass="form-control" styleId="fecRecAFP" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        &nbsp;
                        <input type="checkbox" id="fecRecAFP" >
                    </div>
                    <div class="col-2 form-inline">
                        Fecha de Emisión&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fecEmision" styleClass="form-control" styleId="fecEmision" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        &nbsp;
                        <input type="checkbox" id="fecEmision" >
                    </div>
                    <div class="col-2 form-inline">
                        Emite Dictamen&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="instancia" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="instancia" >
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Nro de Evaluacion&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="nroEvaluacion" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="nroEvaluacion" >
                    </div>
                    <div class="col-2 form-inline">
                        N° Dictamen&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="nroDictamen" styleClass="form-control" size="12" maxlength="12" />
                         &nbsp;
                        <input type="checkbox" id="nroDictamen" >
                    </div>
                </div>
                    
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Porcentaje Menoscabo&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="porcMenoscabio" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="nroDictamen" >
                    </div>
                    <div class="col-2 form-inline">
                        Califica&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <select id="califica" name="califica" class="form-control" >
                        <option value="00">[SELECCIONE]</option>
                        <option value="02">[SI CALIFICA]</option>
                        <option value="03">[NO CALIFICA]</option>
                        </select>
                        &nbsp;
                        <input type="checkbox" id="califica" >
                    </div>
                    <div class="col-2 form-inline">
                        Indicador Enfermedad Terminal o Cancer&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="indEnf" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="indEnf" >
                    </div>
                </div>
                    
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Definitivo&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="definitivo" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="definitivo" >
                    </div>
                    <div class="col-2 form-inline">
                        Grado&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="grado" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="grado" >
                    </div>
                    <div class="col-2 form-inline">
                        Naturaleza&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="naturaleza" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="naturaleza" >
                    </div>
                </div>
                    
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Meses de Vigencia&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="meses" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="meses" >
                    </div>
                    <div class="col-2 form-inline">
                        Fecha Inicial de Vigencia&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fecInicial" styleClass="form-control" styleId="fecInicial" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        &nbsp;
                        <input type="checkbox" id="fecInicial" >
                    </div>
                    <div class="col-2 form-inline">
                        Fecha Termino de Vigencia&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fecFinal" styleClass="form-control" styleId="fecFinal" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        &nbsp;
                        <input type="checkbox" id="fecFinal" >
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-2 form-inline">
                        Fecha Ocurrencia&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fecOcurrencia" styleClass="form-control" styleId="fecOcurrencia" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        &nbsp;
                        <input type="checkbox" id="fecOcurrencia" >
                    </div>
                    <div class="col-2 form-inline">
                        Proxima Evaluacion&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="proximaEvaluacion" styleClass="form-control" styleId="proximaEvaluacion" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        &nbsp;
                        <input type="checkbox" id="proximaEvaluacion" >
                    </div>
                    <div class="col-2 form-inline">
                        Fecha Notificacion al Afiliado&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fecNotificacion" styleClass="form-control" styleId="fecNotificacion" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        &nbsp;
                        <input type="checkbox" id="fecNotificacion" >
                    </div>
                </div>
                    
                <div class="row">
                    <div class="col-2 form-inline">
                        Fecha Recep. Notificacion&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fecRecNotificacion" styleClass="form-control" styleId="fecRecNotificacion" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        &nbsp;
                        <input type="checkbox" id="fecRecNotificacion" >
                    </div>
                    <div class="col-2 form-inline">
                        Edad Fec. vig. Dict.&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="edad" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="edad" >
                    </div>
                    <div class="col-2 form-inline">
                        Analista&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="analista" styleClass="form-control" size="12" maxlength="12" />
                        &nbsp;
                        <input type="checkbox" id="analista" >
                    </div>
                </div>
                    
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Observaciones&nbsp;
                    </div>
                    <div class="col-7 form-inline">
                        <html:textarea cols="120" rows="2" styleClass="form-control" property="observaciones" readonly="false" />
                    </div>
                </div>
                    
                <div class="space">&nbsp;</div>
                
                <div class="row">
                    <div class="col-12 form-inline">
                        <table id="idConsulta" class="table table-striped table-bordered" style="width:100%">

                                <thead>

                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">N° Dictamen</th>
                                        <th scope="col">Recepción AFP</th>
                                        <th scope="col">Fecha Emisión</th>
                                        <th scope="col">Emite</th>
                                        <th scope="col">N° Eval</th>
                                        <th scope="col">Porcentaje</th>
                                        <th scope="col">N° Apelación</th>
                                    </tr>

                                </thead>
                                
                                <tbody>

                                    <c:forEach var="t" items="${listaDictamen}">

                                        <tr>
                                            <td align="center"><input name=chkid id=chkid type=radio value="<c:out value="${t.nroDictamen}"/>" onclick="myCheck('<c:out value="${t.nroDictamen}"/>'"></td>
                                            <td align="center"><c:out value="${t.nroDictamen}"/></td>
                                            <td align="center"><c:out value="${t.fecRecAFP}"/></td>
                                            <td align="center"><c:out value="${t.fecEmision}"/></td>
                                            <td align="center"><c:out value="${t.instancia}"/></td>
                                            <td align="center"><c:out value="${t.nroEvaluacion}"/></td>
                                            <td align="center"><c:out value="${t.porcMenoscabio}"/></td>
                                            <td align="center"></td>
                                        </tr>


                                      </c:forEach>



                                </tbody>
                                
                        </table>
                    </div>
                </div>    
                    
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-10 form-inline">
                        &nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <a href="javascript:fncGuardarDictamen()">
                        <input type="button" value="Guardar" alt="Guardar" class="btn btn-custom">
                        </a>
                    </div>
                </div>
                    
            </div>
            
        </html:form>
    </body>
</html>
