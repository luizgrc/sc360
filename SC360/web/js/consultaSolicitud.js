
$(function () {

    $("#btn-find").click(function () {
        var x = $('#tipoDocumento').val();
        if (x == "0") {
            alert("Debe seleccionar un tipo de Documento");
            $('#tipoDocumento').focus();
            return;
        }
        if ($('#frmConsulta').length) {
            $('#frmConsulta').attr({
                action: 'Consulta.do?method=buscarSolicitud',
                method: 'POST'
            });

            $('#frmConsulta').submit();
        }
    });
    $('#departamento').change(function () {
        var codigodep = $(this).val();
        //console.log(codigodep);
        $.ajax({
            type: 'POST',
            url: 'Consulta.do?method=provinciasXdepa',
            data: {codigodep: codigodep},
            dataType: 'JSON',
            success: function (response) {
                $('#provincia').empty();
                $('#distrito').empty();
                $("<option/>").attr("value", "00").text("[PROVINCIA]").appendTo('#provincia');
                $("<option/>").attr("value", "00").text("[DISTRITO]").appendTo('#distrito');
                $.each(response, function (index, item) {
                    $("<option/>").attr("value", item.codigo).text(item.descripcion).appendTo('#provincia');
                });
            },
            error: function () {
                alert('Hubo un error en #departamento Ajax');
            }

        });


    });
    $('#provincia').change(function () {
        var idProvincia = $(this).val();
        //console.log(idProvincia);
        $.ajax({
            type: 'POST',
            url: 'Consulta.do?method=distritoXprovincia',
            data: {idProvincia: idProvincia},
            dataType: 'JSON',
            success: function (response) {
                $('#distrito').empty();
                $("<option/>").attr("value", "00").text("[DISTRITO]").appendTo('#distrito');
                $.each(response, function (index, item) {
                    $("<option/>").attr("value", item.codigo).text(item.descripcion).appendTo('#distrito');
                });
            },
            error: function () {
                alert('Hubo un error en ajax #provincia');
            }

        });
    });
    $(document).on('submit', '.setup-content', function () {
        return false;
    });
    $('#dataTables-example').dataTable();
    /** Date Time Picker Fecha Seccion */
    $('#fechaSeccionIni').datetimepicker({
        format: "DD/MM/YYYY"
    });
    $('#fechaSeccionFin').datetimepicker({
        format: "DD/MM/YYYY",
        useCurrent: false //Important! See issue #1075
    });
    $("#fechaSeccionIni").on("dp.change", function (e) {
        $('#fechaSeccionFin').data("DateTimePicker").minDate(e.date);
    });
    $("#fechaSeccionFin").on("dp.change", function (e) {
        $('#fechaSeccionIni').data("DateTimePicker").maxDate(e.date);
    });

    /** Date Time Picker Fecha Asignación*/

    $('#fechaAsignacionIni').datetimepicker({
        format: "DD/MM/YYYY"
    });
    $('#fechaAsignacionFin').datetimepicker({
        format: "DD/MM/YYYY",
        useCurrent: false //Important! See issue #1075
    });
    $("#fechaAsignacionIni").on("dp.change", function (e) {
        $('#fechaAsignacionFin').data("DateTimePicker").minDate(e.date);
    });
    $("#fechaAsignacionFin").on("dp.change", function (e) {
        $('#fechaAsignacionIni').data("DateTimePicker").maxDate(e.date);
    });

    /** Date Time Picker Fecha Vencimiento*/

    $('#fechaVencimientoIni').datetimepicker({
        format: "DD/MM/YYYY"
    });
    $('#fechaVencimientoFin').datetimepicker({
        format: "DD/MM/YYYY",
        useCurrent: false //Important! See issue #1075
    });
    $("#fechaVencimientoIni").on("dp.change", function (e) {
        $('#fechaVencimientoFin').data("DateTimePicker").minDate(e.date);
    });
    $("#fechaVencimientoFin").on("dp.change", function (e) {
        $('#fechaVencimientoIni').data("DateTimePicker").maxDate(e.date);
    });

    /** Date Time Picker Fecha Del Modal*/

    $('.fechaModal').datetimepicker({
        format: 'DD/MM/YYYY'

    });
    $('form').attr({
        role: 'form'
    });



});
/** traslado -- desactivar y activar el contenido */
function onChangeMostar() {
    var form = document.getElementById("frmTraslado");
    var opc = document.getElementById("opcion").value;

    if (opc == '00') {

        window.document.getElementById("mostrar").style.display = 'block';
    }

    if (opc == '01') {

        window.document.getElementById("mostrar").style.display = 'none';
    }
}

function showModalWindow(idSolicitud) {
    $('#modal-detalle').modal({
        backdrop: 'static', keyboard: false
    });
    $("#modal-detalle").on('shown.bs.modal', function () {
        //debugger;
        $.ajax({
            type: 'POST',
            url: 'Consulta.do?method=verDetalleDocumento',
            data: {idSolicitud: idSolicitud},
            dataType: 'JSON',
            success: function (response) {
                $.each(response, function (index, item) {
                    $('#txtExp').val(item.exp);
                    $('#txtCuspp').val(item.cuspp);
                    $('#txtpNom').val(item.primerNombre);
                    $('#txtsNom').val(item.segundoNombre);
                    $('#txtpApe').val(item.primerApellido);
                    $('#txtsApe').val(item.segundoApellido);
                    $('#txtfecNac').val(item.fechaNacimiento);
                    $('#txtcorreo').val(item.correo);
                    switch (item.sexo.toUpperCase()) {
                        case "MASCULINO" :
                            $('#txtSexo').val("1");
                            break;
                        case "FEMENINO" :
                            $('#txtSexo').val("2");
                            break;
                        default :
                            $('#txtSexo').val("0");
                            break;
                    }
                    $('#txtTelefono').val(item.telefono);
                    //$('#txtEstCivil').val() por determinar
                    $('#txtDireccion').val(item.direccion);
                    //$('#departamento').val(item.nombreDepartamento);

                });
            },
            error: function (e) {
                //alert('Error: ' + e);
            }

        });


        var navListItems = $('div.setup-panel div a'),
                allWells = $('.setup-content'),
                allNextBtn = $('.nextBtn');

        allWells.hide();

        navListItems.click(function (e) {
            e.preventDefault();
            var $target = $($(this).attr('href')),
                    $item = $(this);

            if (!$item.hasClass("disabled")) {
                navListItems.removeClass('btn-warning').addClass('btn-default');
                $item.addClass('btn-warning');
                allWells.hide();
                $target.show();
                $target.find('input:eq(0)').focus();
            }
        });

        allNextBtn.click(function () {

            var curStep = $(this).closest(".setup-content"),
                    curStepBtn = curStep.attr("id"),
                    nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
                    curInputs = curStep.find("input[type='text'],input[type='url'],input[type='checkbox'],select"),
                    isValid = true;

            $(".form-group").removeClass("has-error");

            for (var i = 0; i < curInputs.length; i++) {
                if (!curInputs[i].validity.valid) {

                    isValid = false;
                    $(curInputs[i]).closest(".form-group").addClass("has-error");

                }
            }

            if (isValid)
                nextStepWizard.removeClass('disabled').trigger('click');

        });


        $('div.setup-panel div a.btn-warning').trigger('click');


    });


}



