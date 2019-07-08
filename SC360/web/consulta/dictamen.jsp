<!-- DICTAMEN -->
<form role="form" id="step-5" class="setup-content">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Dictamen</h3>
        </div>
        <div class="panel-body " style="width: auto;height: 390px;overflow-y: auto;">
            <div class="container">
                <!-- row1 -->
                <div class="row">
                    <div class="col-lg-12">
                        <STRONG>DICTAMEN </STRONG>&nbsp;
                    </div>
                </div>
                <!--/. row1 -->
                <div class="space">&nbsp;</div>
                <!-- row2 -->
                <input type="hidden" id="nroExpD" name="nroExpD">
                <input type="hidden" class="user" id="nickUsuario" name="nickUsuario">
                <div class="row">
                    <div class="col-lg-1" style="padding-right: 0px;" >
                        <label style="margin: 4px">Fecha Recepción AFP</label>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group date fechaModal">
                            <input id="fechaRecepcion" name="fechaRecepcion" type="text" required="required" class="form-control input-sm"/>
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-offset-1 col-lg-1" style="padding-right: 0px;">
                        <label style="margin: 4px">Fecha de Emisión</label>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group date fechaModal">
                            <input id="fechaEmision" name="fechaEmision" type="text" required="required" class="form-control input-sm "/>
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-offset-1 col-lg-1">
                        <label style="margin: 4px">Emite Dictamen</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtInstancia" name="txtInstancia" type="text" required="required" class="form-control input-sm"/>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required" id="instancia"/>
                    </div>
                </div>
                <!-- /.row2 -->
                <div class="space">&nbsp;</div>
                <!-- row3 -->
                <div class="row">
                    <div class="col-lg-offset-4 col-lg-1" style="padding-right: 0px;">
                        <label style="margin: 4px">Nro de Evaluacion</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtNroEvaluacion" name="txtNroEvaluacion" type="text" required="required" class="form-control input-sm"/>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required" id="nroEvaluacion"/>
                    </div>  
                    <div class="col-lg-1" style="padding-right: 0px;padding-top: 5px;">
                        <label >N° Dictamen</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtNroDictamen" name="txtNroDictamen" type="text" required="required" class="form-control input-sm" style="width: 163px;"/>                       </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required" id="nroDictamen"/>
                    </div>

                </div>
                <!-- /.row3 -->
                <div class="space">&nbsp;</div>
                <!-- row4 -->
                <div class="row">
                    <div class="col-lg-1" style="padding-right: 0px;">
                        <label style="margin: 4px">Porcentaje Menoscabo</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtProcentajeMenoC" name="txtProcentajeMenoC" type="text" required="required" class="form-control input-sm"/>
                    </div>
                    <div class="col-md-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="nroDictamen"/>
                    </div>
                    <div class="col-lg-1" style="padding-top : 5px">
                        <label style="margin: 4px">Califica&nbsp;</label>
                    </div>
                    <div class="col-lg-2">
                        <select id="txtCalifica" name="txtCalifica" type="text" required="required" class="form-control input-sm">
                            <option value="">[SELECCIONE]</option>
                            <option value="[SI CALIFICA]">[SI CALIFICA]</option>
                            <option value="[NO CALIFICA]">[NO CALIFICA]</option>
                        </select>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required"/>
                    </div>
                    <div class="col-lg-1" style="padding-right: 0px">
                        <label style="margin: 0px">Indicador Enfermedad Terminal o Cancer</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtInvalidez" name="txtInvalidez" type="text" required="required" class="form-control input-sm"/>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required"/>
                    </div> 
                </div>
                <!-- /.row4 -->
                <div class="space">&nbsp;</div>
                <!-- row5 -->
                <div class="row">
                    <div class="col-lg-1" style="padding-right: 0px;padding-top: 5px;">
                        <label style="margin: 4px">Definitivo</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtDefinitivo" name="txtDefinitivo" type="text" required="required" class="form-control input-sm"/>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="definitivo"/>
                    </div>
                    <div class="col-lg-1" style="padding-right: 0px;padding-top: 5px;">
                        <label>Grado</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtGrado" name="txtGrado" type="text" required="required" class="form-control input-sm"/>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="grado"/>
                    </div>
                    <div class="col-lg-1" style="padding-right: 0px;padding-top: 6px;">
                        <label>Naturaleza</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtNaturaleza" name="txtNaturaleza" type="text" required="required" class="form-control input-sm"/>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="naturaleza"/>
                    </div>
                </div>
                <!-- /.row5 -->
                <div class="space">&nbsp;</div>
                <!-- row6 -->
                <div class="row">
                    <div class="col-lg-1" style="padding-right: 0px;">
                        <label>Meses de Vigencia</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtMeses" name="txtMeses" type="text" required="required" class="form-control input-sm"/>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="meses"/>
                    </div>
                    <div class="col-lg-1" style="padding-right: 0px;">
                        <label>Fecha Inicial de Vigencia</label>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group date fechaModal">
                            <input id="fechaIniVigencia" name="fechaIniVigencia" type="text" required="required" class="form-control input-sm "/>
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="fecInicial"/>
                    </div>
                    <div class="col-lg-1" style="padding-right: 0px;">
                        <label>Fecha Termino de Vigencia</label>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group date fechaModal">
                            <input id="fechaFinVigencia" name="fechaFinVigencia" type="text" required="required" class="form-control input-sm"/>
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="fecFinal"/>
                    </div>
                </div>
                <!-- /.row6 -->
                <div class="space">&nbsp;</div>
                <!-- row7 -->
                <div class="row">
                    <div class="col-lg-1" style="padding-right: 0px;">
                        <label >Fecha Ocurrencia</label>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group date fechaModal">
                            <input id="fechaOcurrencia" name="fechaOcurrencia" type="text" required="required" class="form-control input-sm "/>
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="fecOcurrencia"/>
                    </div>
                    <div class="col-lg-1" style="padding-right: 0px;">
                        <label>Proxima Evaluacion</label>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group date fechaModal">
                            <input id="fechaProxEvaluacion" name="fechaProxEvaluacion" type="text" required="required" class="form-control input-sm"/>
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>                        
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="proximaEvaluacion"/>
                    </div>
                    <div class="col-lg-1" style="padding-right: 0px;">
                        <label>Fecha Notificacion al Afiliado</label>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group date fechaModal">
                            <input id="fechaNotificacionAfi" name="fechaNotificacionAfi" type="text" required="required" class="form-control input-sm "/>
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="fecNotificacion"/>
                    </div>
                </div>
                <!-- /.row7 -->
                <div class="space">&nbsp;</div>
                <!-- row8 -->
                <div class="row">
                    <div class="col-lg-1" style="padding-right: 0px;">
                        <label>Fecha Recep. Notificacion</label>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group date fechaModal">
                            <input  id="fechaRecpNoti" name="fechaRecpNoti" type="text" required="required" class="form-control input-sm "/>
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="fecRecNotificacion"/>
                    </div>
                    <div class="col-lg-1" style="padding-right: 0px;">
                        <label>Edad Fec. vig. Dict.</label>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group date fechaModal">
                            <input id="edad" type="text" required="required" class="form-control input-sm"/>
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="edad"/>
                    </div>
                    <div class="col-lg-1" style="padding-right: 0px;padding-top: 5px;">
                        <label>Analista</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtAnalista" name="txtAnalista" type="text" required="required" class="form-control input-sm"/>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px">
                        <input type="checkbox" required="required" id="analista"/>
                    </div>

                </div>
                <!-- /.row8 -->
                <div class="space">&nbsp;</div>
                <!-- row9 -->
                <div class="row">
                    <div class="col-lg-12">
                        <label>Observaciones</label>
                    </div>
                </div>
                <!-- /.row9 -->
                <!-- row10 -->
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-lg-11">
                        <table id="tblDictamen" class="table table-striped table-bordered">
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
                                <tr style="text-align: center;">
                                    <td></td>
                                    <td colspan="8" style="text-align: left;">No se Encontro Información</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.row10 -->
            </div>
        </div>
    </div>
    <button class="btn btn-custom nextBtn pull-right" type="submit">
        Siguiente
    </button>
</form>
<!-- /.DICTAMEN -->