<form role="form" id="step-2" class="setup-content">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Seyci</h3>
        </div>
        <div class="panel-body" style="width: auto;height: 390px;overflow-y: auto;">
            <div class="continer">
                <div class="col-lg-6">
                    <div class="col-md-6"><STRONG>SEYCI</STRONG>&nbsp;</div>
                </div>
                <div class="col-lg-6">
                    <div class="col-md-4 ">
                        <label style="padding-top: 10px;">N Solicitud&nbsp;</label>
                    </div>
                    <div class="col-md-6">
                        <input property="nroSolicitud" class="form-control input-sm" disabled="true" />
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="col-lg-6">
                    <div class="col-md-4 ">
                        <label style="padding-top: 9px;">Ejecutivo&nbsp;</label>
                    </div>
                    <div class="col-md-6">
                        <select type="text" required="required" class="form-control input-sm" style="width: 250px;" id="ejecutivo">
                            <option value="">
                                SELECCIONAR
                            </option>
                            <option value="00">
                                xxxx xxxx
                            </option>
                            <option value="01">
                                xxxx xxxx
                            </option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" id="ejecutivo">
                    </div>

                    <div class="space">&nbsp;</div>
                    <div class="col-md-4 ">
                        <label style="padding-top: 9px;">Tipo Solicitud&nbsp;</label>
                    </div>
                    <div class="col-md-6">
                        <select id="tipoSolicitud" name="tipoSolicitud"
                                requires="required" style="width: 250px;"
                                class="form-control input-sm">
                            <option value="">[SELECCIONE]</option>
                            <option value="00">Invalidez</option>
                            <option value="01">Invalidez y Cáncer</option>
                            <option value="02">Invalidez y Enfermedad Terminal
                            </option>
                        </select>

                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" id="tipoSolicitud">
                    </div>

                </div>
                <div class="col-lg-6">

                    <div class="col-md-4 ">
                        <label style="padding-top: 9px;"> Agencia&nbsp;</label>
                    </div>
                    <div class="col-md-6">
                        <select required="required"
                                class="form-control input-sm" style="width: 250px">
                            <option value="">
                                SELECCIONAR
                            </option>
                            <option value="00">
                                xxxxx xxxx
                            </option>
                            <option value="01">
                                xxxx xxxxx
                            </option>
                        </select>

                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" id="agencia">
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="col-md-4 ">
                        <label style="padding-top: 9px;"> Tipo Evaluado&nbsp;</label>
                    </div>
                    <div class="col-md-6">
                        <select id="tipoEvaluado" name="tipoEvaluado"
                                required="required" class="form-control input-sm"
                                style="width: 250px">
                            <option value="00">[SELECCIONE]</option>
                            <option value="01">Afiliado</option>
                            <option value="02">Beneficiario</option>
                        </select>

                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" id="tipoEvaluado">
                    </div>

                </div>
                <div class="col-lg-12">
                    <STRONG>Nombre del Evaluado&nbsp;</STRONG>&nbsp;
                </div>
                <div class="col-md-2">
                    <input type="text" required="required"
                           class="form-control input-sm" styleId="primerNombre"
                           style="width: 179px;" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" required="required"
                           id="primerNombreEvaluado">
                </div>
                <div class="col-md-2">
                    <input type="text" required="required"
                           class="form-control input-sm" styleId="sgundoNombre"
                           style="width: 179px;" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" required="required"
                           id="segundoNombreEvaluado">
                </div>
                <div class="col-md-2">
                    <input type="text" required="required"
                           class="form-control input-sm" styleId="primerApellido"
                           style="width: 179px;" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" required="required"
                           id="primerApellidoEvaluado">
                </div>
                <div class="col-md-2">
                    <input type="text" required="required"
                           class="form-control input-sm" styleId="segundoApellido"
                           style="width: 179px;" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" required="required"
                           id="segundoApellidoEvaluado">
                </div>

                <div class="space">&nbsp;</div>
                <div class="col-lg-4">

                    <div class="col-md-3">
                        <label style="padding-top: 9px;">Parentesco&nbsp;</label>
                    </div>
                    <div class="col-md-7">

                        <select id="parentesco" name="parentesco" required="required"
                                style="width: 190px;" class="form-control input-sm">

                            <option value="">[SELECCIONE]</option>
                            <option value="01">Titular</option>
                            <option value="02">Conyugue</option>
                            <option value="03">Hijos</option>
                            <option value="04">Padres</option>
                        </select>

                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" id="parentesco">
                    </div>

                </div>
                <!---->
                <div class="col-md-4">

                    <div class="col-md-3">
                        <label style="padding-top: 9px;">Fecha Nac&nbsp;</label>
                    </div>

                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input type="text"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required"
                               id="fechaNacimientoSeyci">
                    </div>

                </div>
                <div class="col-md-4">

                    <div class="col-md-3">
                        <label style="padding-top: 9px;">Act Riesgo&nbsp;</label>
                    </div>
                    <div class="col-md-7">
                        <select id="actRiesgo" name="actRiesgo" required="required"
                                required="required" style="width: 190px;"
                                class="form-control input-sm">
                            <option value="">
                                SELECCIONAR
                            </option>

                            <option value="00">
                                Maculino
                            </option>
                            <option value="01">
                                Femenino
                            </option>
                            <option value="00">[NO]</option>
                            <option value="01">[SI]</option>
                        </select>

                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" id="actRiesgo">
                    </div>

                </div>
                <div class="space">&nbsp;</div>
                <!---->
                <div class="col-md-4">

                    <div class="col-md-3">
                        <label style="margin: 4px">Resultados Evaluacion&nbsp;</label>
                    </div>
                    <div class="col-md-7">
                        <select id="resultadoEvaluacion" name="resultadoEvaluacion"
                                required="required" class="form-control input-sm"
                                style="width: 190px;">
                            <option value="">
                                SELECCIONAR
                            </option>

                            </option>
                            <option value="00">[PROCEDE]</option>
                            <option value="00">[RECHAZADO]</option>
                            <option value="00">[SUSPENDIDO]</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required"
                               id="resultadoEvaluacion">
                    </div>

                </div>

                <div class="row">

                </div>
                <div class="space">&nbsp;</div>
                <div class="col-md-4">
                    <div class="col-md-3">
                        <label style="padding-top: 9px;">Fecha Sec I&nbsp;</label>
                    </div>
                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" id="fechaSeccionI">
                    </div>

                </div>
                <div class="col-md-4 col-md-offset-4">
                    <div class="col-md-3" style="padding-right: 0px;">
                        <label style="
                               margin-bottom: 9px;
                               ">Fecha Ingreso Benef&nbsp;</label>
                    </div>
                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required"
                               id="fechaIngresoBenef">
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <!---->
                <div class="col-md-4">

                    <div class="col-md-3">
                        <label style="padding-top: 5px;">Fecha Firma
                            Medico&nbsp;</label>
                    </div>
                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required"
                               id="fechaFirmaMedico">
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="col-md-3">
                        <label style="margin: 4px"> DJ de no Beneficiarios&nbsp;</label>
                    </div>
                    <div class="col-md-7">

                        <select id="djBenef" name="djBenef" required="required"
                                style="width: 190px;" class="form-control input-sm">
                            <option value="">
                                SELECCIONAR
                            </option>

                            <option value="01">[SI]</option>
                            <option value="02">[NO]</option>
                        </select>

                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" id="djBenef">
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="col-md-3">
                        <label style="padding-top: 2px;">Fecha Envio
                            COMAFP&nbsp;</label>
                    </div>
                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required"
                               id="fechaRecepcionComafp">
                    </div>

                </div>
                <div class="space">&nbsp;</div>
                <div class="col-md-4">
                    <div class="col-md-3" style="padding-right: 0px;">
                        <label style="padding-top: 5px;"> Fecha Recep
                            COMAFP&nbsp;</label>
                    </div>
                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required"
                               id="fechaRecepcionComafp">
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="col-md-3" style="padding-right: 0px;">
                        <label style="margin: 4px">Fecha Envio DIS&nbsp;</label>
                    </div>
                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" id="fechaEnvioDis">
                    </div>

                </div>
                <div class="col-md-4">

                    <div class="col-md-3 " style="padding-right: 0px;">
                        <label style="margin: 4px">Fecha Recep DIS&nbsp;</label>
                    </div>
                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required"
                               id="fechaRecepcionDis">
                    </div>

                </div>
                <div class="space">&nbsp;</div>
                <div class="col-md-4">
                    <div class="col-md-3" style="padding-right: 0px;">
                        <label style="margin: 4px">Nombre Archivo ok Dis&nbsp;</label>
                    </div>
                    <div class="col-md-7">
                        <input type="text" required="required"
                               class="form-control input-sm" style="width: 190px;"
                               styleId="nombreArchivoOKDis" />
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="col-md-3">
                        <label style="margin: 4px">Fecha Conclusion&nbsp;</label>
                    </div>
                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" id="fechaConclusion">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="col-md-3">
                        <label style="padding-top: 9px;">Analista&nbsp;</label>
                    </div>
                    <div class="col-md-7">
                        <input type="text" required="required"
                               style="width: 190px;" class="form-control input-sm"
                               styleId="analista" />
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="col-md-12">
                    <div>
                        Observaciones SEYCI&nbsp;
                    </div>
                    <div class="space">&nbsp;</div>
                    <div>
                        <div class="col-xs-12">
                            <textarea type="text" cols="120"
                                      rows="2" class="form-control input-sm"
                                      property="observacionesSEYCI"
                                      readonly="false"></textarea>
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                </div>
            </div>
        </div>
    </div>
    <button class="btn btn-custom nextBtn pull-right" type="submit">Siguiente</button>
</form>