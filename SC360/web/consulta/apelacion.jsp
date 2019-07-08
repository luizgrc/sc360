
<!--Apelacion-->
<form role="form" id="step-6" class="setup-content"> 
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Apelacion</h3>
        </div>

        <div class="panel-body" style="width: auto; height: 390px; overflow-y: auto;">
            <div class="container">
                <div class="row">
                    <STRONG>Apelacion</STRONG>&nbsp;

                </div>
                <div class="space">&nbsp;</div>
                <input type="hidden" id="nroExpA" name="nroExpA">
                <input type="hidden" class="user" id="nickUsuario" name="nickUsuario">
                <div class="row">
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px">Nro Dictamen
                            Apelado</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtNroDictamenApelado" name="txtNroDictamenApelado" type="text" required="required"
                               class="form-control input-sm" />
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required">
                    </div>

                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px">Persona Apela</label>
                    </div>
                    <div class="col-lg-2">

                        <input id="txtPersonaApela" name="txtPersonaApela" type="text" required="required"
                               class="form-control input-sm" />

                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required" id="personaApela">
                    </div>


                    <div class="col-lg-1" style="padding-left: 0px;">

                        <label style="margin: 4px">Fecha Apelacion</label>
                    </div>

                    <div class="col-lg-2">
                        <div class="input-group date fechaModal">
                            <input id="fechaApelacion" name="fechaApelacion" name="" type="text" required="required"
                                   class="form-control input-sm " />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required" id="fechaApelacion">
                    </div>
                </div>

                <div class="space">&nbsp;</div>
                <div class="row">                                                    

                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px">Fecha Ingreso
                            Beneficios</label>
                    </div>
                    <div class="col-lg-2" >
                        <div class="input-group date fechaModal">
                            <input id="fechaIngBeneficios" name="fechaIngBeneficios" type="text" required="required"
                                   class="form-control input-sm " />
                            <span class="input-group-addon">

                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required"
                               id="fecIngBeneficios">
                    </div>

                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px">Fecha Envio Carta</label>
                    </div>
                    <div class="col-lg-2" >
                        <div class="input-group date fechaModal">
                            <input id="fechaEnvCarta" name="fechaEnvCarta" type="text" required="required"
                                   class="form-control input-sm " />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required" id="fecEnvcarta">
                    </div>



                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px">Recepcion COMAFP</label>
                    </div>
                    <div class="col-lg-2" >

                        <input id="txtRecepCOMAFP" name="txtRecepCOMAFP"
                                type="text" required="required"
                               class="form-control input-sm" styleId="recepCOMAFP" />
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required">
                    </div>


                </div>
                <div class="space">&nbsp;</div>
                <div class="row">


                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px">Analista</label>
                    </div>
                    <div class="col-lg-2">

                        <input id="txtAnalista" name="txtAnalista"
                            type="text" required="required"
                               class="form-control input-sm"  />
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required">
                    </div>



                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px">Motivo Apelacion</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtMotivoApela" name="txtMotivoApela" type="text" required="required" class="form-control input-sm"  />
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required"
                               id="motivoApelacion">
                    </div>



                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px">Nro Dictamen
                            Apelado</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtNroDictamentApelado" name="txtNroDictamentApelado" type="text" required="required"
                               class="form-control input-sm"  />
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required">
                    </div>


                </div>

                <div class="space">&nbsp;</div>
                <div class="row">


                    <div class="col-lg-1" style="padding-left: 0px;" >
                        <label style="margin: 4px">DIS / PACIFICO</label>
                    </div>
                    <div class="col-lg-2">
                        <input id="txtDIS_PACIFICO" name="txtDIS_PACIFICO" type="text" required="required"
                               class="form-control input-sm" />
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required">
                    </div>



                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px">Fecha Dictamen</label>
                    </div>
                    <div class="col-lg-2 ">
                        <div class="input-group date fechaModal">
                            <input id="fechaDictamen" name="fechaDictamen" type="text" required="required"
                                   class="form-control input-sm " />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required" id="fecDictamen">
                    </div>



                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px"> Envio DIS</label>
                    </div>
                    <div class="col-lg-2 ">
                        <div class="input-group date fechaModal">
                            <input id="fechaEnvioDIS" name="fechaEnvioDIS" type="text" required="required"
                                   class="form-control input-sm " />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required" id="fecEnvioDis">
                    </div>


                </div>
                <div class="space">&nbsp;</div>
                <div class="row">


                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px">SOL</label>
                    </div>
                    <div class="col-lg-2">
                        <input type="text" required="required"
                               class="form-control input-sm" />
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required">
                    </div>



                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px"> Fecha Notificacion
                            Afiliado</label>
                    </div>
                    <div class="col-lg-2" >
                        <div class="input-group date fechaModal">
                            <input id="fechaNotiAfiliado" name="fechaNotiAfiliado" type="text" required="required"
                                   class="form-control input-sm " />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required"
                               id="fecNotAfiliado">
                    </div>



                    <div class="col-lg-1" style="padding-left: 0px;">
                        <label style="margin: 4px"> Notificacion COMEC</label>
                    </div>
                    <div class="col-lg-2 ">
                        <div class="input-group date fechaModal">
                            <input id="fechaNotiCOMEC" name="fechaNotiCOMEC" type="text" required="required"
                                   class="form-control input-sm " />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span></div>
                    </div>
                    <div class="col-lg-1" style="padding-left: 0px;">
                        <input type="checkbox" required="required" id="fecNotCOMEC">
                    </div>



                </div>
                <div class="space">&nbsp;

                </div>
                <div class="row">

                    <div class="col-2 form-inline">
                        Observaciones&nbsp;
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">

                    <div class="col-lg-offset-1 col-lg-10">
                        <textarea id="Observaciones" name="Observaciones" cols="80" rows="4" class="form-control input-sm"
                                  style="min-height: 50px; max-height: 80px; resize: vertical;"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <button class="btn btn-custom nextBtn pull-right" type="submit">Guardar</button>

</form>
<!--/.Apelacion-->
