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
            $('#fecRecAFP').val(item.FecRecAFP);
            $('#fecEmision').val(item.FecEmision);
            $('#instancia').val(item.Instancia);
            $('#nroEvaluacion').val(item.NroEvaluacion);
            $('#nroDictamen').val(item.NroDictamen);
            $('#porcMenoscabio').val(item.PorcMenoscabio);
            $('#indEnf').val(item.IndEnf);
            $('#definitivo').val(item.Definitivo);
            $('#grado').val(item.Grado);
            $('#naturaleza').val(item.Naturaleza);
            $('#meses').val(item.Meses);
            $('#fecInicial').val(item.FecInicial);
            $('#fecFinal').val(item.FecFinal);
            $('#fecOcurrencia').val(item.FecOcurrencia);
            $('#proximaEvaluacion').val(item.ProximaEvaluacion);
            //$('#fecNotificacion').val(item.fecNotificacion)
            $('#edad').val(item.Edad);
            $('#tblDictamen').find('tbody tr').remove();
            $('#tblDictamen').find('tbody td').remove();

            $('#tblDictamen').find('tbody').append('<tr></tr>');
            $('#tblDictamen').find('tbody').find('tr:last').append('<td><input type="radio" value="' + item.nroSeyci + '"></td>').find('input').on('click', function () {
                console.log($(this).val());
            });
            
        });
    });
}

