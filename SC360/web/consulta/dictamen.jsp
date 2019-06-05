<%-- 
    Document   : dictamen
    Created on : 17/04/2019, 09:04:57 PM
    Author     : Elgar Eduardo Puma Cruz
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

            function myCheck(idSeyci, numDictamen) {

                var i;
                for (i = 0; i < document.frmDictamen.chkid.length; i++) {
                    if (document.frmDictamen.chkid[i].checked)
                        break;
                }

                var form = document.frmDictamen;
                var url = 'Dictamen.do?method=mostrarDictamen&idNroTraslado=' + idSeyci + "&numeroExp=" + numDictamen;
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
                var url = 'Apelacion.do?method=inicioApelacion&numeroExp=' + numeroExp;
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
    <body style="background-color:#FFFFFF;">

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
                <div class="row show-grid">


                    <STRONG>DICTAMEN
                    </STRONG>&nbsp;
                    <html:hidden property="nroSeyci"></html:hidden>
                        <div class="space">&nbsp;</div>

                        <div class="col-md-4">
                            <div class="row show-grid form-group">
                                <div class="col-md-4">
                                    Fecha Recepción AFP&nbsp;
                                </div>
                                <div class="col-md-6">
                                    <div class="col-xs-10">
                                    <html:text property="fecRecAFP" styleClass="form-control input-sm" styleId="fecRecAFP" size="12" />
                                </div>
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>

                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecRecAFP" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha de Emisión&nbsp;
                            </div>
                            <div class="col-md-6">
                                <div class="col-xs-10">
                                    <html:text property="fecEmision" styleClass="form-control input-sm" styleId="fecEmision" size="12" />
                                </div>
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>

                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecEmision" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Emite Dictamen&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="instancia" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="instancia" >
                            </div>
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <!-- -->
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Nro de Evaluacion&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="nroEvaluacion" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-1">
                                <input type="checkbox" id="nroEvaluacion" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                N° Dictamen&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="nroDictamen" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-1">
                                <input type="checkbox" id="nroDictamen" >
                            </div>
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>

                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Porcentaje Menoscabo&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="porcMenoscabio" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-1">
                                <input type="checkbox" id="nroDictamen" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Califica&nbsp;
                            </div>
                            <div class="col-md-6">
                                <select id="califica" name="califica" class="form-control input-sm" >
                                    <option value="00">[SELECCIONE]</option>
                                    <option value="02">[SI CALIFICA]</option>
                                    <option value="03">[NO CALIFICA]</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="califica" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Indicador Enfermedad Terminal o Cancer&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="indEnf" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="indEnf" >
                            </div>
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Definitivo&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="definitivo" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="definitivo" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Grado&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="grado" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="grado" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Naturaleza&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="naturaleza" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="naturaleza" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Meses de Vigencia&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="meses" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="meses" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Inicial de Vigencia&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="fecInicial" styleClass="form-control input-sm" styleId="fecInicial" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecInicial" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Termino de Vigencia&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="fecFinal" styleClass="form-control input-sm" styleId="fecFinal" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecFinal" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Ocurrencia&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="fecOcurrencia" styleClass="form-control input-sm" styleId="fecOcurrencia" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecOcurrencia" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Proxima Evaluacion&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="proximaEvaluacion" styleClass="form-control input-sm" styleId="proximaEvaluacion" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="proximaEvaluacion" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Notificacion al Afiliado&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="fecNotificacion" styleClass="form-control input-sm" styleId="fecNotificacion" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecNotificacion" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Recep. Notificacion&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="fecRecNotificacion" styleClass="form-control input-sm" styleId="fecRecNotificacion" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecRecNotificacion" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4"> 
                                Edad Fec. vig. Dict.&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="edad" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="edad" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4"> 
                                Analista&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="analista" styleClass="form-control input-sm" size="12" maxlength="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="analista" >
                            </div>
                        </div>
                    </div>

                    <div class="space">&nbsp;</div>

                    <!-- -->

                    <div class="col-2 form-inline">
                        Observaciones&nbsp;
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="col-7 form-inline">
                        <html:textarea cols="120" rows="2" styleClass="form-control input-sm" property="observaciones" readonly="false" />
                    </div>



                    <div class="space">&nbsp;</div>

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
                                        <td align="center"><input name=chkid id=chkid type=radio value="<c:out value="${t.nroDictamen}"/>" onclick="myCheck('<c:out value="${t.idSeyci}"/>','<c:out value="${t.nroSeyci}"/>')"></td>
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

            </div>

        </html:form>
    </body>
</html>
