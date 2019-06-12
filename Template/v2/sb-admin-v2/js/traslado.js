$(function () {
    showModalWindow();
    /*var step3 = $($('#modal-detalle').find('div.setup-panel div a').get(2));
    console.log(step3);
    step3.click();*/

    $('#sltOpcionT').change(function () {
        var idOpcionT = $(this).val();
        var nroexp = "";
        console.log(idOpcionT);
        switch (idOpcionT) {
            case "01":
                $(this).closest('.container').find('#mostrar').css('display', 'none');
                break;
            case "00":
                $(this).closest('.container').find('#mostrar').removeAttr('style');
                nroexp = $(this).closest('.container').find('#nroExpT').val();
                console.log(nroexp);

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