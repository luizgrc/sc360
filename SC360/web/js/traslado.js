$(function () {
    $('#sltOpcionT').change(function () {
        var idOpcionT = $(this).val();
        var nroexp;
        console.log(idOpcionT);
        switch (idOpcionT) {
            case "01" :
                $(this).closest('.container').find('#mostrar').css('display', 'none');
                break;
            case "00" :
                $(this).closest('.container').find('#mostrar').removeAttr('style');
                nroexp = $(this).closest('.container').find('#nroExpT').val();
                AjaxTrasladoInicio(nroexp);

        }
    });
    $('#btn-addBody').on('click', function () {

        var count = $('#tblMov').children('.row').toArray().length;
        //console.log(count);
        if (count > 3) {
            return;
        }
        var espace = '<div class="space">&nbsp;</div>'
        var row = $(this).closest('.row').clone().find('#btn-addBody').on('click', function () {
            // console.log($(this).closest('.row').next());
            //console.log($(this).closest('.space'));

            $(this).closest('.row').next().remove();
            $(this).closest('.row').remove();
        }).end().find('span').attr('class', 'glyphicon glyphicon-chevron-up').end();
        //console.log(row);
        $(this).closest('.row').after(row);
        $(this).closest('.row').after(espace);


    })

});

function AjaxTrasladoInicio(numeroExp) {
    $.ajax({
        type: 'POST',
        url: 'Traslado.do?method=inicioTraslado',
        cache: false,        
        data: {numeroExp: numeroExp},
        dataType: 'JSON'
        
    }
    ).done( function(response){
        console.log(response);
    }).fail(function (jqXHR, textStatus, errorThrown ){
        console.log(jqXHR);
        console.log(textStatus);
        console.log(errorThrown);
    });

}