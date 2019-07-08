function AjaxReevaluacionInicio(nroExp) {
    console.log('Valor de Funcion ' + nroExp);
    $.ajax({
        type: 'POST',
        data: {nroExp: nroExp},
        url: 'Reevaluacion.do?method=inicioReevaluacion',
        async: false,
        cache: false,
        dataType: 'JSON'
    }).done(function (response) {
        console.log(response);
        $.each(response, function (index, item) {
            //$('#nroExpR').val(item.numeroSeyci);
            $('#txtFechaIngresoBen').val(item.fechaIngresoBeneficios);
            $('#sltipoDoc').val(item.tipoDocumento);
            $('#fechaEvaluacion').val(item.fechaEvaluacion);
            $('#txtAnalista').val(item.analista);
            $('#fechaNotificacion').val(item.fechaNotificacion);
            $('#txtResponsable').val(item.responsable);
            $('#txtObservaciones').val(item.observaciones);
        });
    });

}


function listarTipoDocumento(){
        $.ajax({
        type: 'POST',
        url: 'Reevaluacion.do?method=listarDocumento',
        cache: false,
        async: false,
        dataType: 'JSON'
    }).done(function (response) {

        $('#sltipoDoc').empty();
        $("<option/>").attr("value", "").text("[SELECCIONAR]").appendTo('#sltipoDoc');
        $.each(response, function (index, item) {
            $("<option/>").attr("value", item.codigoTipoDocumento).text(item.descripcionTipoDocumento).appendTo('#sltipoDoc');
        });
    });
}