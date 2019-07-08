function AjaxApelacionInicio(nroExp) {
    $.ajax({
        url: "Apelacion.do?method=inicioApelacion",
        type: 'POST',
        cache: false,
        dataType: 'JSON',
        data: {nroExp: nroExp}
    }).done(function (response) {
        console.log(response);
        $.each(response, function (index, item) {
            $('#txtPersonaApela').val(item.PersonaApela);
            $('#txtMotivoApela').val(item.MotivoApelacion);
        });
    });
}