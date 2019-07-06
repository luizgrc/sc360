<form role="form">
    <div
        class="panel panel-primary setup-content"
        id="step-1"
        style="width: 700px;"
        >
        <div class="panel-heading">
            <h3 class="panel-title">Ingreso de Tope de Gastos de Sepelio</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label class="control-label">Periodo</label>
                <input
                    maxlength="100"
                    type="text"
                    required="required"
                    class="form-control"

                    />
            </div>
            <div class="form-group">
                <label class="control-label">Año</label>

                <div class="input-group date fechaModal">
                    <input type="text" required="required" class="form-control input-sm"/>
                    <span class="input-group-addon">
                        <span class="fa fa-calendar"></span>
                    </span>
                </div>
            </div>


            <div class="form-group">
                <label class="control-label">Tope</label>
                <input
                    maxlength="100"
                    type="text"
                    required="required"
                    class="form-control"

                    />
            </div>

            <button
                class="btn btn-primary nextBtn pull-right"
                type="button"
                >
                Next
            </button>
        </div>
    </div>
</form>