<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--TRASLADO-->
<form role="form" id="step-3" class="setup-content">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Traslado</h3>
        </div>
        <div class="panel-body" style="width: auto; height: 390px; overflow-y: auto;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-offset-1 col-md-1 form-inline">
                        <label for="sltOpcionT"><STRONG>TRASLADO</STRONG></label>
                    </div>
                    <div class="col-md-2">
                        <select type="text" required="required" id="sltOpcionT"
                                class="form-control input-sm">
                            <option value="00">[SI]</option>
                            <option value="01">[NO]</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input id="nroExpT" disabled="true"
                               class="form-control input-sm" />
                    </div>


                </div>
                <div class="space">&nbsp;</div>
                <!--grid terminado-->
                <!--segundo grid-->
                <div id="mostrar">
                    <div class="row">
                        <div class="col-md-1">
                            <label style="margin-bottom: 0;margin-top: 5px;">Fecha de
                                Cita</label>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group date fechaModal">
                                <input id="txtFecCitaT" type="text" required="required"
                                       class="form-control input-sm " />
                                <span class="input-group-addon">
                                    <span class="fa fa-calendar"></span>
                                </span></div>
                        </div>

                        <div class="col-md-offset-1 col-md-1">
                            <label
                                style="margin-bottom: 0;margin-top: 5px;">Acompa&ntilde;ante</label>
                        </div>
                        <div class="col-md-2">
                            <select id="txtAcomT" required="required"
                                    class="form-control input-sm">
                                <option value="00">[SI]</option>
                                <option value="01">[NO]</option>
                            </select>
                        </div>
                        <div class="col-md-offset-1 col-md-1">
                            <label style="margin-bottom: 0;margin-top: 5px;">N
                                Traslado</label>
                        </div>
                        <div class="col-md-2">
                            <input type="text" required="required"
                                   class="form-control input-sm" id="txtnroTrasladoT"
                                   size="12" maxlength="20" />

                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="row">
                        <div class="col-md-1">
                            <label for="txtTipoTrasladoT"
                                   style="margin-bottom: 0;margin-top: 5px;">Tipo de
                                Traslado</label>
                        </div>
                        <div class="col-md-2">
                            <select id="txtTipoTrasladoT" name="tipo" type="text"
                                    required="required" class="form-control input-sm">
                                <option value="01">[PROVINCIA-PROVINCIA]</option>
                                <option value="02">[PROVINCIA-LIMA]</option>
                                <option value="03">[LIMA-LIMA]</option>
                            </select>
                        </div>

                        <div class="col-md-offset-1 col-md-1">
                            <label style="padding-top: 9px;">Origen&nbsp;</label>
                        </div>

                        <div class="col-md-2">
                            <select type="text" required="required"
                                    class="form-control input-sm" id="sltOrigenT">

                                <c:forEach var="f" items="${listDepartamento}">
                                    <option value="<c:out value="${f.codigo}"/>"><c:out value="${f.descripcion}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-offset-1 col-md-1">
                            <label style="padding-top: 9px;">Destino&nbsp;</label>
                        </div>

                        <div class="col-md-2">
                            <select type="text" required="required"
                                    class="form-control input-sm" id="sltDestinoT">
                            
                            <c:forEach var="f" items="${listDepartamento}">
                                <option value="<c:out value="${f.codigo}"/>"><c:out value="${f.descripcion}"/></option>
                            </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="row">
                        <div class="col-md-1" style="padding-right: 0px;">
                            <label style="padding-top: 9px;">Fecha
                                Aprobacion&nbsp;</label>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group date fechaModal">
                                <input id="txtFecAprobT" type="text" required="required"
                                       class="form-control input-sm " />
                                <span class="input-group-addon">
                                    <span class="fa fa-calendar"></span>
                                </span></div>
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div id="tblMov">
                        <div class="row">
                            <div class="col-md-1">
                                <label style="padding-top: 9px;">Moneda&nbsp;</label>
                            </div>
                            <div class="col-md-2">
                                <select id="sltMonedaMovT" type="text" required="required"
                                        class="form-control input-sm">
                                    <option value="00">[SOLES]</option>
                                    <option value="01">[DOLARES]</option>
                                </select>
                            </div>
                            <div class="col-md-1">
                                <label style="padding-top: 9px;">Tipo
                                    Movilidad&nbsp;</label>
                            </div>
                            <div class="col-md-3">
                                <select id="slttipoMovilidadT" name="tipoMovilidad"
                                        type="text" required="required"
                                        class="form-control input-sm">
                                    <option value="01">[PASAJES AVION]</option>
                                    <option value="02">[PASAJES TIERRA]</option>
                                    <option value="03">[MOVILIDAD INTERNA]</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label style="padding-top: 9px;">Monto
                                    Movilidad&nbsp;</label>
                            </div>
                            <div class="col-md-2">
                                <input type="text" required="required"
                                       class="form-control input-sm" styleId="txtMontoMovT"
                                       size="12" maxlength="20" />
                            </div>
                            <div class="col-md-1" id="movilidad">
                                <button type="button" class="btn btn-warning "
                                        aria-label="Left Align" id="btn-addBody">
                                    <span class="glyphicon glyphicon-chevron-down"
                                          aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                        <div class="space">&nbsp;</div>
                    </div>
                    <div class="row ">
                        <div class="col-md-1">
                            <label style="padding-top: 9px;">Moneda&nbsp;</label>
                        </div>
                        <div class="col-md-2">
                            <select id="sltMonedaAlimT" name="moneda1" type="text"
                                    required="required" class="form-control input-sm">
                                <option value="00">[SOLES]</option>
                                <option value="01">[DOLARES]</option>
                            </select>
                        </div>
                        <div class="col-md-1" style="padding-right: 0px;">
                            <label style="padding-top: 9px;">Dias de
                                Alimentacion&nbsp;</label>
                        </div>
                        <div class="col-md-3">
                            <input type="text" required="required"
                                   class="form-control input-sm" id="txtDiasAlimenT"
                                   size="12" maxlength="20" />

                        </div>
                        <div class="col-md-2">
                            <label style="padding-top: 9px;">Monto
                                Alimentacion&nbsp;</label>
                        </div>
                        <div class="col-md-2">
                            <input type="text" required="required"
                                   class="form-control input-sm" id="txtMontoAlimenT"
                                   size="12" maxlength="20" />

                        </div>
                    </div>

                    <div class="space">&nbsp;</div>
                    <div class="row">
                        <div class="col-md-1">
                            <label style="padding-top: 9px;">Moneda&nbsp;</label>
                        </div>
                        <div class="col-md-2">
                            <select id="sltMonedaAlojT" type="text" required="required"
                                    class="form-control input-sm">
                                <option value="00">[SOLES]</option>
                                <option value="01">[DOLARES]</option>
                            </select>
                        </div>
                        <div class="col-md-1" style="padding-right: 0px;">
                            <label style="padding-top: 9px;">Dias de
                                Alojamiento&nbsp;</label>
                        </div>
                        <div class="col-md-3">
                            <input type="text" required="required"
                                   class="form-control input-sm" id="txtDiasAlojT"
                                   size="12" maxlength="20" />
                        </div>
                        <div class="col-md-2">
                            <label style="padding-top: 9px;">Monto de
                                Alojamiento&nbsp;</label>
                        </div>
                        <div class="col-md-2">
                            <input type="text" required="required"
                                   class="form-control input-sm" styleId="txtMontoAloT"
                                   size="12" maxlength="20" />
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="row">
                        <div class="col-md-2 col-lg-offset-7">
                            <label style="padding-top: 9px;">Monto Exa
                                Medicos&nbsp;</label>
                        </div>

                        <div class="col-md-2">
                            <input type="text" required="required"
                                   class="form-control input-sm" id="txtMontoMedicoT"
                                   size="12" maxlength="20" />
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="row">
                        <div class="col-md-2 col-lg-offset-7">
                            <label style="padding-top: 9px;">Total Gasto&nbsp;</label>
                        </div>
                        <div class="col-md-2">
                            <input type="text" required="required"
                                   class="form-control input-sm" id="txtTotalGastoT"
                                   size="12" maxlength="20" />

                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="row">
                        <div class="col-md-1">
                            <label style="padding-top: 9px;">Ejecutiva&nbsp;</label>
                        </div>
                        <div class="col-md-2">
                            <input type="text" required="required"
                                   class="form-control input-sm" id="txtEjecutivoT"
                                   size="12" maxlength="20" />
                        </div>
                        <div class="col-md-1">
                            <label style="padding-top: 9px;">Analista&nbsp;</label>
                        </div>
                        <div class="col-md-3">
                            <input type="text" required="required"
                                   class="form-control input-sm" id="txtanalistaT"
                                   size="12" maxlength="20" />
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="row">

                        <div class="col-12 form-inline">
                            <table id="idConsulta"
                                   class="table table-striped table-bordered"
                                   style="width:100%">

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
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                </div>
            </div>
        </div>
    </div>
    <button class="btn btn-custom nextBtn pull-right" type="submit">Siguiente</button>
</form>

<!--/.TRASLADO-->