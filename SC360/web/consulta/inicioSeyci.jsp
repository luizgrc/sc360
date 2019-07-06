<form role="form" id="step-2" class="setup-content">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Seyci</h3>
        </div>
        <div class="panel-body" style="width: auto;height: 390px;overflow-y: auto;">
            <div class="container">
                <div class="col-lg-6">
                    <div class="col-md-6"><STRONG>SEYCI</STRONG>&nbsp;
                    <input type="checkbox" id="selectAll"/>
                    </div>
                    <input type="hidden" id="nroExpS" name="nroExpS">
                </div>
                <div class="col-lg-6">
                    <input type="hidden" class="user" id="nickUsuario" name="nickUsuario">
                    <div class="col-md-4 ">
                        <label style="padding-top: 10px;">N Solicitud&nbsp;</label>
                    </div>
                    <div class="col-md-6">
                        <input class="form-control input-sm" disabled="true" id="txtNroSolS" name ="txtNroSolS"/>
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="col-lg-6">
                    <div class="col-md-4 ">
                        <label style="padding-top: 9px;">Ejecutivo&nbsp;</label>
                    </div>
                    <div class="col-md-6">
                        <select type="text" required="required" class="form-control input-sm" style="width: 250px;" id="sltEjecutivo" name="sltEjecutivo">
                            <option value="0">[EJECUTIVO]</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" >
                    </div>

                    <div class="space">&nbsp;</div>
                    <div class="col-md-4 ">
                        <label style="padding-top: 9px;">Tipo Solicitud&nbsp;</label>
                    </div>
                    <div class="col-md-6">
                        <select id="slttipoSolicitud" name="slttipoSolicitud" required="required" style="width: 250px;" class="form-control input-sm">
                            <option value="">[SELECCIONE]</option>
                            <option value="01">Invalidez</option>
                            <option value="02">Invalidez y Cáncer</option>
                            <option value="03">Invalidez y Enfermedad Terminal</option>
                        </select>

                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" >
                    </div>

                </div>
                <div class="col-lg-6">

                    <div class="col-md-4 ">
                        <label style="padding-top: 9px;"> Agencia&nbsp;</label>
                    </div>
                    <div class="col-md-6">
                        <select required="required" class="form-control input-sm" style="width: 250px" id="sltAgencia" name="sltAgencia">
                            <option value="0">[AGENCIA]</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" >
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="col-md-4 ">
                        <label style="padding-top: 9px;"> Tipo Evaluado&nbsp;</label>
                    </div>
                    <div class="col-md-6">
                        <select id="slttipoEvaluado" name="slttipoEvaluado" required="required" class="form-control input-sm" style="width: 250px">
                            <option value="">[SELECCIONE]</option>
                            <option value="01">Afiliado</option>
                            <option value="02">Beneficiario</option>
                        </select>

                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required">
                    </div>

                </div>
                <div class="col-lg-12">
                    <STRONG>Nombre del Evaluado&nbsp;</STRONG>&nbsp;
                </div>
                <div class="col-md-2">
                    <input type="text" required="required"
                           class="form-control input-sm" id="txtpnomS" name="txtpnomS"
                           style="width: 179px;" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" required="required"/>
                </div>
                <div class="col-md-2">
                    <input type="text" required="required" class="form-control input-sm" id="txtsnomS" name="txtsnomS" style="width: 179px;" />
                </div>
                <div class="col-md-1">
                    <input type="checkbox" required="required" />
                </div>
                <div class="col-md-2">
                    <input type="text" required="required" class="form-control input-sm" id="txtpapeS" name="txtpapeS" style="width: 179px;" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" required="required" />
                </div>
                <div class="col-md-2">
                    <input type="text" required="required" class="form-control input-sm" id="txtsapeS" name="txtsapeS" style="width: 179px;" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" required="required" />
                </div>

                <div class="space">&nbsp;</div>
                <div class="col-lg-4">

                    <div class="col-md-3">
                        <label style="padding-top: 9px;">Parentesco&nbsp;</label>
                    </div>
                    <div class="col-md-7">

                        <select id="sltparentesco" name="sltparentesco" required="required"
                                style="width: 190px;" class="form-control input-sm">
                            <option value="00">[SELECCIONE]</option>
                            <option value="01">Titular</option>
                            <option value="02">Conyugue</option>
                            <option value="03">Hijos</option>
                            <option value="04">Padres</option>
                        </select>

                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required">
                    </div>

                </div>
                <!---->
                <div class="col-md-4">

                    <div class="col-md-3">
                        <label style="padding-top: 9px;">Fecha Nac&nbsp;</label>
                    </div>

                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input id="txtfecNacS" name="txtfecNacS" type="text" class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" />
                    </div>

                </div>
                <div class="col-md-4">

                    <div class="col-md-3">
                        <label style="padding-top: 9px;">Act Riesgo&nbsp;</label>
                    </div>
                    <div class="col-md-7">
                        <select id="sltactRiesgoS" name="actRiesgo" required="required" style="width: 190px;" class="form-control input-sm">
                            <option value="00">[NO]</option>
                            <option value="01">[SI]</option>
                        </select>

                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" >
                    </div>

                </div>
                <div class="space">&nbsp;</div>
                <!---->
                <div class="col-md-4">

                    <div class="col-md-3">
                        <label style="margin: 4px">Resultados Evaluacion&nbsp;</label>
                    </div>
                    <div class="col-md-7">
                        <select id="sltresultadoEvaluacionS" name="resultadoEvaluacion" required="required" class="form-control input-sm" style="width: 190px;">
                            <option value="00">[PROCEDE]</option>
                            <option value="00">[RECHAZADO]</option>
                            <option value="00">[SUSPENDIDO]</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required"/>
                              
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
                            <input type="text" required="required" id="txtFecSecIS" name="txtFecSecIS" class="form-control input-sm" style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required">
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
                            <input id="txtFecIngrS" type="text" required="required" class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" />
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
                            <input id="txtfecFirmMedS" type="text" required="required" class="form-control input-sm" style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" />
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="col-md-3">
                        <label style="margin: 4px"> DJ de no Beneficiarios&nbsp;</label>
                    </div>
                    <div class="col-md-7">

                        <select id="sltdjBenefS" name="djBenef" required="required"
                                style="width: 190px;" class="form-control input-sm">
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
                            <input id="txtFecEnvCOMAFPS" name="txtFecEnvCOMAFPS" type="text" required="required" class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" />
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
                            <input id="txtFecRecpCOMAFPS" type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" />
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="col-md-3" style="padding-right: 0px;">
                        <label style="margin: 4px">Fecha Envio DIS&nbsp;</label>
                    </div>
                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input id="txtFecEnvDISS" type="text" required="required" class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" />
                    </div>

                </div>
                <div class="col-md-4">

                    <div class="col-md-3 " style="padding-right: 0px;">
                        <label style="margin: 4px">Fecha Recep DIS&nbsp;</label>
                    </div>
                    <div class="col-md-7 form-inline">
                        <div class="input-group date fechaModal">
                            <input id="txtFecRecpDISS" type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" />
                    </div>

                </div>
                <div class="space">&nbsp;</div>
                <div class="col-md-4">
                    <div class="col-md-3" style="padding-right: 0px;">
                        <label style="margin: 4px">Nombre Archivo ok Dis&nbsp;</label>
                    </div>
                    <div class="col-md-7">
                        <input id="txtNomArchOKS" type="text" required="required"
                               class="form-control input-sm" style="width: 190px;" />
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
                            <input id="txtFecConclusionS" type="text" required="required"
                                   class="form-control input-sm " style="width: 153px;" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-md-2">
                        <input type="checkbox" required="required" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="col-md-3">
                        <label style="padding-top: 9px;">Analista&nbsp;</label>
                    </div>
                    <div class="col-md-7">
                        <input type="text" required="required" style="width: 190px;" class="form-control input-sm" id="txtAnalistaS" />
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
                            <textarea id="txtObsSeyci" name="txtObsSeyci" style="min-height: 50px; max-height: 80px; resize: vertical;" type="text" cols="120" rows="2" class="form-control input-sm" >
                                
                            </textarea>
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                </div>
            </div>
        </div>
    </div>
    <button class="btn btn-custom nextBtn pull-right" type="submit">Siguiente</button>
</form>