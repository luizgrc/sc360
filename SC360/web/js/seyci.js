function AjaxSeyciInicio(idExp) {
    console.log('Valor de Funcion ' + idExp);
    $.ajax({
        type: 'POST',
        data: {idExp: idExp},
        url: 'Seyci.do?method=inicioSeyci',
        cache: false,
        dataType: 'JSON'
    }).done(function (response) {
        console.log(response);
        $.each(response, function (index, item) {
            $('#txtNroSolS').val(item.numeroSolicitud);
            switch (item.tipoSolicitud.trim()) {
                case "Invalidez":
                    $('#slttipoSolicitud').val("01")
                    break;
                case "Invalidez y Cáncer":
                    $('#slttipoSolicitud').val("02")
                    break;
                case "Invalidez y Enfermedad Terminal":
                    $('#slttipoSolicitud').val("03")
                    break;
                default :
                    $('#slttipoSolicitud').val("00")
                    break;
            }
            switch (item.tipoDeEvaluado.trim()) {
                case "Afiliado":
                    $('#slttipoEvaluado').val("01")
                    break;
                case "Beneficiario":
                    $('#slttipoEvaluado').val("02")
                    break;
                default :
                    $('#slttipoEvaluado').val("00")
                    break;
            }
            $('#txtpnomS').val(item.primerNombre);
            $('#txtsnomS').val(item.segundoNombre);
            $('#txtpapeS').val(item.primerApellido);
            $('#txtsapeS').val(item.segundoApellido);
            $('#txtfecNacS').val(item.fechaNacEvaluado);
            $('#txtFecSecIS').val(item.fechaSeccionI);
            $('#txtFecEnvCOMAFPS').val(item.fechaEnvioCOMAFP);
            $('#txtObsSeyci').val(item.observacionesSeyci);


        });
    });

}
function listarEjecutivos() {
    $.ajax({
        type: 'POST',
        url: 'Seyci.do?method=listarEjecutivos',
        cache: false,
        dataType: 'JSON'
    }).done(function (response) {

        $('#sltEjecutivo').empty();
        $("<option/>").attr("value", "0").text("[EJECUTIVO]").appendTo('#sltEjecutivo');
        $.each(response, function (index, item) {
            $("<option/>").attr("value", item.codigo).text(item.descripcion).appendTo('#sltEjecutivo');
        });
    });
}
function listarAgencias() {
    $.ajax({
        type: 'POST',
        url: 'Seyci.do?method=listarAgencias',
        cache: false,
        dataType: 'JSON'
    }).done(function (response) {
        // console.log(response);
        $('#sltAgencia').empty();
        $('<option/>').attr("value", "0").text("[AGENCIA]").appendTo('#sltAgencia');
        $.each(response, function (index, item) {
            $('<option/>').attr("value", item.codigo).text(item.descripcion).appendTo('#sltAgencia');
        });

    });

}
















