<%-- 
    Document   : traslado
    Created on : 07/04/2019, 10:02:21 PM
    Author     : Elgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TRASLADO</title>
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
            $("#fechaCita").datepicker();
            $("#fechaAprobacion").datepicker();


            $("#btn-addBody").click(function (event) {
                var textoInput = '<div class="space">&nbsp;</div><div class="col-md-1">Moneda&nbsp;</div>'
                var linea1 = '<div class="col-md-2"><select id="moneda" name="moneda" class="form-control" ><option value="00">[SOLES]</option><option value="01">[DOLARES]</option></select></div>'
                var linea2 = '<div class="col-md-1">Tipo Movilidad&nbsp;</div>'
                var linea3 = '<div class="col-md-3"><select id="tipoMovilidad" name="tipoMovilidad" class="form-control" ><option value="01">[PASAJES AVION]</option><option value="02">[PASAJES TIERRA]</option><option value="03">[MOVILIDAD INTERNA]</option></select></div>'
                var linea4 = '<div class="col-md-2">Monto Movilidad&nbsp;</div>'
                var linea5 = '<div class="col-md-2"><input type="text" id="montoMovilidad" name="montoMovilidad" class="form-control" size="12" maxlength="20"></div>'
                var fin = '<div class="col-md-2"></div>'

                var nuevoTexto = textoInput + linea1 + linea2 + linea3 + linea4 + linea5 + fin;
                $("#movilidad").after(nuevoTexto);
            });

        });



        function onChangeMostar(campo) {
            var form = document.getElementById("frmTraslado");
            var opc = document.getElementById("opcion").value;

            if (opc == '00') {

                window.document.getElementById("mostrar").style.display = 'block';
            }

            if (opc == '01') {

                window.document.getElementById("mostrar").style.display = 'none';
            }
        }

        function myCheck(idNroTraslado, numExpediente) {

            //var checkBox = document.getElementById("chkid").checked;

            //alert(checkBox);

            //document.getElementById("red").checked = true;

            //if (checkBox.checked === true){

            //alert("checked");

            var i
            for (i = 0; i < document.frmTraslado.chkid.length; i++) {
                if (document.frmTraslado.chkid[i].checked)
                    break;
            }

            var form = document.frmTraslado;
            var url = 'Traslado.do?method=mostrarTraslado&idNroTraslado=' + idNroTraslado + "&numeroExp=" + numExpediente;
            //form.action="ConsultaDocumentos.do?metodo=actualizacionDocumento&codigo="+codigo+"&coddestinatario="+coddestinatario;
            var form = document.forms(0);
            form.action = url;
            form.method = "post";
            form.submit();
            //}

        }

        function irSeyci() {
            var form = document.frmTraslado;
            var url = "Seyci.do?method=inicioSeyci";
            var form = document.forms(0);
            form.action = url;
            form.method = "post";
            form.submit();
        }
        ;

        function irReevaluacion() {
            var form = document.frmTraslado;
            var numeroExp = form.nroExpSeyci.value;
            var url = 'Reevaluacion.do?method=inicioReevaluacion&numeroExp=' + numeroExp;
            var form = document.forms(0);
            form.action = url;
            form.method = "post";
            form.submit();
        }
        ;

        function fncGuardarTraslado() {

            var form = document.getElementById("frmTraslado");
            form.action = "Traslado.do?method=guardarTraslado";
            form.method = "post";
            form.submit();

        }


    </script>
</head>
<body style="background-color:#FFFFFF;">
    <div class="container">

        <ul class="nav nav-tabs">
            <li class="nav-item"><a class="nav-link" href="javascript:irDetalle()">Detalle Consulta</a></li>
            <li class="nav-item"><a class="nav-link" href="javascript:irSeyci()">SEYCI</a></li>
            <li class="nav-item active"><a class="nav-link" href="#">TRASLADO</a></li>
            <li class="nav-item"><a class="nav-link" href="javascript:irReevaluacion()">REEVALUACION</a></li>
            <li class="nav-item"><a class="nav-link" href="#">DICTAMEN</a></li>
            <li class="nav-item"><a class="nav-link" href="#">APELACION</a></li>
        </ul>
    </div>

    <html:form action="Traslado.do" styleId="frmTraslado" >
        <div class="form-group div-align-l dv-align-2030">
            <!--primer grid-->
            <div class="row show-grid">

                <div class="col-md-6">


                    <div class="col-md-4">
                        <STRONG>TRASLADO</STRONG>&nbsp;
                    </div>
                    <div class="col-md-4">

                        <select id="opcion" name="opcion" class="form-control input-sm" onchange="onChangeMostar(this)" >
                            <option value="00">[SI]</option>
                            <option value="01">[NO]</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        &nbsp;<html:text property="nroExpSeyci" disabled="true">

                        </html:text>

                    </div>


                </div>
            </div>
            <!--grid terminado-->
            <!--segundo grid-->
            <div id="mostrar">
                <div class="space">&nbsp;</div>
                <div class="row show-grid">
                    <div class="col-md-12">

                        <div class="row show-grid">
                            <div class="col-md-2">
                                Fecha de Cita
                            </div>
                            <div class="col-md-2">
                                <html:text property="fechaCita" styleClass="form-control input-sm" styleId="fechaCita" size="12"></html:text>
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario">
                            </div>
                            <div class="col-md-2">
                                Acompa&ntilde;ante&nbsp;
                            </div>
                            <div class="col-md-2">
                                <select id="acompanante" name="acompanante" class="form-control input-sm" >
                                    <option value="00">[SI]</option>
                                    <option value="01">[NO]</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                N Traslado&nbsp;
                            </div>
                            <div class="col-md-2">
                                <html:text property="nroTraslado" styleClass="form-control input-sm" styleId="nroTraslado" size="12" maxlength="20" />

                            </div>
                        </div>
                        <div class="row show-grid">
                            <div class="col-md-2">
                                Tipo de Traslado&nbsp;
                            </div>
                            <div class="col-md-2">
                                <select id="tipo" name="tipo" class="form-control input-sm" >
                                    <option value="01">[PROVINCIA-PROVINCIA]</option>
                                    <option value="02">[PROVINCIA-LIMA]</option>
                                    <option value="03">[LIMA-LIMA]</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                Origen&nbsp;
                            </div>

                            <div class="col-md-2">
                                <html:select property="origen" styleClass="form-control input-sm" styleId="origen"  >
                                    <html:options collection="listDepartamento" property="codigo" labelProperty="descripcion"/>
                                </html:select>
                            </div>
                            <div class="col-md-2">
                                Destino&nbsp;
                            </div>

                            <div class="col-md-2">
                                <html:select property="destino" styleClass="form-control input-sm" styleId="destino"  >
                                    <html:options collection="listDepartamento" property="codigo" labelProperty="descripcion"/>
                                </html:select>
                            </div>
                        </div>
                        <div class="space">&nbsp;</div>

                        <div class="col-md-2">
                            Fecha Aprobacion&nbsp;
                        </div>
                        <div class="col-md-2 form-group row">
                            <html:text property="fechaAprobacion" styleClass="form-control input-sm" styleId="fechaAprobacion" size="12">
                            </html:text>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario">

                        </div>
                        <div class="space">&nbsp;</div>

                        <div class="col-md-1">
                            Moneda&nbsp;
                        </div>
                        <div class="col-md-2">
                            <select id="moneda" name="moneda" class="form-control input-sm" >
                                <option value="00">[SOLES]</option>
                                <option value="01">[DOLARES]</option>
                            </select>
                        </div>
                        <div class="col-md-1">
                            Tipo Movilidad&nbsp;
                        </div>
                        <div class="col-md-3">
                            <select id="tipoMovilidad" name="tipoMovilidad" class="form-control input-sm" >
                                <option value="01">[PASAJES AVION]</option>
                                <option value="02">[PASAJES TIERRA]</option>
                                <option value="03">[MOVILIDAD INTERNA]</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            Monto Movilidad&nbsp;
                        </div>
                        <div class="col-md-2">
                            <html:text property="montoMovilidad" styleClass="form-control input-sm" styleId="montoMovilidad" size="12" maxlength="20" />
                        </div>
                        <div class="col-md-1" id="movilidad">
                            <input type="button" value="+"  id="btn-addBody" class="btn btn-warning">

                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-md-1">
                            Moneda&nbsp;
                        </div>
                        <div class="col-md-2">
                            <select id="moneda1" name="moneda1" class="form-control input-sm">
                                <option value="00">[SOLES]</option>
                                <option value="01">[DOLARES]</option>
                            </select>
                        </div>
                        <div class="col-md-1">
                            Dias de Alimentacion&nbsp;
                        </div>
                        <div class="col-md-3">
                            <html:text property="diasAlimentacion" styleClass="form-control input-sm" styleId="diasAlimentacion" size="12" maxlength="20" />

                        </div>
                        <div class="col-md-2">
                            Monto Alimentacion&nbsp;
                        </div>
                        <div class="col-md-2">
                            <html:text property="montoAlimentacion" styleClass="form-control input-sm" styleId="montoAlimentacion" size="12" maxlength="20" />

                        </div>
                        <div class="col-md-1">
                        </div>

                        <div class="space">&nbsp;</div>
                        <div class="col-md-1">
                            Moneda&nbsp;
                        </div>
                        <div class="col-md-2">
                            <select id="moneda2" name="moneda2" class="form-control input-sm">
                                <option value="00">[SOLES]</option>
                                <option value="01">[DOLARES]</option>
                            </select>
                        </div>
                        <div class="col-md-1">
                            Dias de Alojamiento&nbsp;
                        </div>
                        <div class="col-md-3">
                            <html:text property="diasAlojamiento" styleClass="form-control input-sm" styleId="diasAlojamiento" size="12" maxlength="20" />

                        </div>
                        <div class="col-md-2">
                            Monto de Alojamiento&nbsp;
                        </div>
                        <div class="col-md-2">
                            <html:text property="montoAlojamiento" styleClass="form-control input-sm" styleId="montoAlojamiento" size="12" maxlength="20" />

                        </div>
                        <div class="col-md-1">
                        </div>
                        <div class="space">&nbsp;</div>
                        <!-- para los montos y totales-->


                        <div class="col-md-1">

                        </div>
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class="col-md-3">

                        </div>



                        <div class="col-md-2">
                            Monto Exa Medicos&nbsp;
                        </div>
                        <div class="col-md-2">
                            <html:text property="montoMedico" styleClass="form-control input-sm" styleId="montoMedico" size="12" maxlength="20" />

                        </div>
                        <div class="space">&nbsp;</div>
                        <!-- para los montos y totales-->
                        <div class="col-md-1">

                        </div>
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class="col-md-3">

                        </div>
                        <div class="col-md-2">
                            Total Gasto&nbsp;
                        </div>
                        <div class="col-md-2">
                            <html:text property="totalGasto" styleClass="form-control input-sm" styleId="totalGasto" size="12" maxlength="20" />

                        </div>
                        <div class="col-md-2">

                        </div>
                        <div class="space">&nbsp;</div>
                        <!-- Fin de montos y totales-->
                        <div class="col-md-1">
                            Ejecutiva&nbsp;
                        </div>
                        <div class="col-md-2">
                            <html:text property="ejecutivo" styleClass="form-control input-sm" styleId="ejecutivo" size="12" maxlength="20" />

                        </div>

                        <div class="col-md-1">
                            Analista&nbsp;
                        </div>
                        <div class="col-md-3">
                            <html:text property="analista" styleClass="form-control input-sm" styleId="analista" size="12" maxlength="20" />

                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="row">
                        <div class="col-12 form-inline">
                            <table id="idConsulta" class="table table-striped table-bordered" style="width:100%">

                                <thead>

                                    <tr>
                                        <th scope="col">Nro</th>
                                        <th scope="col">Cita</th>
                                        <th scope="col">Tipo de Traslado</th>
                                        <th scope="col">Origen</th>
                                        <th scope="col">Destino</th>
                                        <th scope="col">Tipo de Movilidad</th>
                                        <th scope="col">Fecha Aprobacion</th>
                                        <th scope="col">Total de Gastos</th>
                                    </tr>

                                </thead>

                                <tbody>

                                    <c:forEach var="t" items="${listaTraslado}">

                                        <tr>
                                            <td align="center"><input name=chkid id=chkid type=radio value="<c:out value="${t.idTraslado}"/>" onclick="myCheck('<c:out value="${t.idTraslado}"/>', '<c:out value="${t.nroExpSeyci}"/>')"></td>
                                            <td align="center"><c:out value="${t.fechaCita}"/></td>
                                            <td align="center"><c:out value="${t.tipo}"/></td>
                                            <td align="center"><c:out value="${t.origen}"/></td>
                                            <td align="center"><c:out value="${t.destino}"/></td>
                                            <td align="center"><c:out value="${t.tipoMovilidad}"/></td>
                                            <td align="center"><c:out value="${t.fechaAprobacion}"/></td>
                                            <td align="center"><c:out value="${t.totalGasto}"/></td>
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
                            <a href="javascript:fncGuardarTraslado()">
                                <div style="text-align: center"><input type="button" value="Guardar" alt="Guardar" class="btn btn-custom"></div>

                            </a>
                        </div>
                        <div class="space">&nbsp;</div>
                    </div>
                </div>
            </div>
        </div>
    </html:form>

</body>
</html>
