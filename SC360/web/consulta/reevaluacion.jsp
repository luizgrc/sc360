<form role="form" id="step-4" class="setup-content">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Reevaluacion</h3>
        </div>
        <div
            class="panel-body"
            style="width: auto;height: 390px;overflow-y: auto;"
            >
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <STRONG>REEVALUACION</STRONG>
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <input type="hidden" id="nroExpR" name="nroExpR">
                <input type="hidden" class="user" id="nickUsuario" name="nickUsuario">
                <!-- row -->
                <div class="row">
                    <div class="col-lg-offset-1 col-lg-1">
                        <label style="padding-top: 5px;"
                               >Fec. Ingreso Beneficios</label
                        >
                    </div>
                    <div class="col-lg-3">
                        <div class="input-group date fechaModal">
                            <input
                                id="txtFechaIngresoBen"
                                name="txtFechaIngresoBen"
                                type="text"
                                required="required"
                                class="form-control input-sm "
                                />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-offset-1 col-lg-1">
                        <label style="padding-top: 5px;"
                               >Tipo Documento</label
                        >
                    </div>
                    <div class="col-lg-3">
                        <select
                            id="sltipoDoc"
                            name="sltipoDoc"
                            type="text"
                            required="required"
                            class="form-control input-sm"
                            >
                            <option value="">[SELECCIONAR]</option>
                        </select>
                    </div>
                </div>
                <!-- row -->
                <div class="space">&nbsp;</div>
                <!-- row 2 -->
                <div class="row">
                    <div class="col-lg-offset-1 col-lg-1">
                        <label style="padding-top: 3px;"
                               >Fecha de Evaluacion Doc</label
                        >
                    </div>
                    <div class="col-lg-3">
                        <div class="input-group date fechaModal">
                            <input
                                id="fechaEvaluacion"
                                name="fechaEvaluacion"
                                type="text"
                                required="required"
                                class="form-control input-sm "
                                />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-offset-1 col-lg-1">
                        <label style="padding-top: 9px;">Analista</label>
                    </div>
                    <div class="col-lg-3">
                        <input
                            id="txtAnalista"
                            name="txtAnalista"
                            type="text"
                            required="required"
                            class="form-control input-sm"
                            />
                    </div>
                </div>
                <!-- /.row2 -->
                <div class="space">&nbsp;</div>
                <!-- row3 -->
                <div class="row">
                    <div class="col-lg-offset-1 col-lg-1">
                        <label style="padding-top: 9px;"
                               >Fecha de Notificacion</label
                        >
                    </div>
                    <div class="col-lg-3">
                        <div class="input-group date fechaModal">
                            <input
                                id="fechaNotificacion"
                                name="fechaNotificacion"
                                type="text"
                                required="required"
                                class="form-control input-sm "
                                />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-offset-1 col-lg-1">
                        <label style="padding-top: 9px;">Responsable</label>
                    </div>
                    <div class="col-lg-3">
                        <input
                            id="txtResponsable"
                            name="txtResponsable"
                            type="text"
                            required="required"
                            class="form-control input-sm"
                            />
                    </div>
                </div>
                <!-- /.row3 -->
                <div class="space">&nbsp;</div>
                <div class="space">&nbsp;</div>
                <div class="space">&nbsp;</div>
                <div class="space">&nbsp;</div>
                <!-- row4 -->
                <div class="row">
                    <div class="col-lg-12">
                        <label>Observaciones Reevaluacion</label>
                    </div>
                </div>
                <!-- /.row4 -->
                <!-- row5 -->
                <div class="row">
                    <div class="col-lg-12">
                        <textarea
                            id="txtObservaciones"
                            name="txtObservaciones"
                            cols="80"
                            rows="4"
                            class="form-control input-sm"
                            style="min-height: 50px; max-height: 80px; resize: vertical;"
                            ></textarea>
                    </div>
                </div>
                <!-- /.row5 -->
            </div>
        </div>
    </div>
    <button class="btn btn-custom nextBtn pull-right" type="submit">
        Siguiente
    </button>
</form>

<!--/.REEVALUACION-->