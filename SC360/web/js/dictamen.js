function AjaxdictamenInicio(nroExp) {
    $.ajax({
        url: "Dictamen.do?method=inicioDictamen",
        type: 'POST',
        cache: false,
        dataType: 'JSON',
        data: {nroExp: nroExp}
    }).done(function (response) {
        console.log(response);
        $.each(response, function (index, item) {

            $('#fechaRecepcion').val(item.FecRecAFP);
            $('#fechaEmision').val(item.FecEmision);
            $('#txtInstancia').val(item.Instancia);
            $('#txtNroEvaluacion').val(item.NroEvaluacion);
            $('#txtNroDictamen').val(item.NroDictamen);
            $('#txtProcentajeMenoC').val(item.PorcMenoscabio);
            $('#txtCalifica').val(item.Califica);
            $('#txtInvalidez').val(item.IndEnf);
            $('#txtDefinitivo').val(item.Definitivo);
            $('#txtGrado').val(item.Grado);
            $('#txtNaturaleza').val(item.Naturaleza);
            $('#txtMeses').val(item.Meses);
            $('#fechaIniVigencia').val(item.FecInicial);
            $('#fechaFinVigencia').val(item.FecFinal);
            $('#fechaOcurrencia').val(item.FecOcurrencia);
            $('#fechaProxEvaluacion').val(item.ProximaEvaluacion);
            $('#fechaNotificacionAfi').val(item.FecNotificacion)
            $('#fechaRecpNoti').val(item.FecRecNotificacion)
            $('#txtAnalista').val(item.Analista)
            $('#tblDictamen').find('tbody tr').remove();
            $('#tblDictamen').find('tbody td').remove();

            $('#tblDictamen').find('tbody').append('<tr></tr>');
            $('#tblDictamen').find('tbody').find('tr:last').append('<td><input type="radio" value="' + item.nroSeyci + '"></td>' +
                    '<td>' + item.NroDictamen + '</td>' +
                    '<td>' + item.FecRecAFP + '</td>' +
                    '<td>' + item.FecEmision + '</td>' +
                    '<td></td>' + //Emite sin map
                    '<td>' + item.NroEvaluacion + '</td>' +
                    '<td>' + item.PorcMenoscabio + '</td>' +
                    '<td></td>').find("input[type='radio']").on('click', function () {
                console.log($(this).val());
            });

        });
    });
}

