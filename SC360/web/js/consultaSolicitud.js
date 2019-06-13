
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
    $('#txtdepartamento').change(function () {
        var codigodep = $(this).val();
        //console.log(codigodep);
        $.ajax({
            type: 'POST',
            url: 'Consulta.do?method=provinciasXdepa',
            data: {codigodep: codigodep},
            dataType: 'JSON',
            async: false,
            success: function (response) {
                $('#txtprovincia').empty();
                $('#txtdistrito').empty();
                $("<option/>").attr("value", "00").text("[PROVINCIA]").appendTo('#txtprovincia');
                $("<option/>").attr("value", "00").text("[DISTRITO]").appendTo('#txtdistrito');
                $.each(response, function (index, item) {
                    $("<option/>").attr("value", item.codigo).text(item.descripcion).appendTo('#txtprovincia');
                });
            },
            error: function () {
                alert('Hubo un error en #departamento Ajax');
            }

        });


    });
    $('#txtprovincia').change(function () {
        var idProvincia = $(this).val();
        console.log('change #txtprovincia' + idProvincia);
        $.ajax({
            type: 'POST',
            url: 'Consulta.do?method=distritoXprovincia',
            data: {idProvincia: idProvincia},
            dataType: 'JSON',
            async: false,
            success: function (response) {
                $('#txtdistrito').empty();
                $("<option/>").attr("value", "00").text("[DISTRITO]").appendTo('#txtdistrito');
                $.each(response, function (index, item) {
                    $("<option/>").attr("value", item.codigo).text(item.descripcion).appendTo('#txtdistrito');
                });
            },
            error: function () {
                alert('Hubo un error en ajax #txtprovincia');
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
});
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
                console.log(response);
                $.each(response, function (index, item) {
                    console.log('departamento: ' + item.departamento);
                    console.log('provincia: ' + item.provincia);
                    console.log('distrito: ' + item.distrito);
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
                    $('#txtdepartamento').val(item.departamento).trigger('change');
                    console.log('Departamento Val Modal: ' + $('#txtdepartamento').val());
                    $('#txtprovincia').val(item.provincia).trigger('change');
                    console.log('txtprovincia Val Modal: ' + $('#txtprovincia'));
                    $('#txtdistrito').val(item.distrito);
                    console.log('txtdistrito Val Modal: ' + $('#txtdistrito').val());

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
                    $item = $(this),
                    $targethrefVal = $(this).attr('href');
            console.log($target);
            if (!$item.hasClass("disabled")) {
                navListItems.removeClass('btn-warning').addClass('btn-default');
                $item.addClass('btn-warning');
                allWells.hide();
                $target.show();
                $target.find('input:eq(0)').focus();
            }
            switch ($targethrefVal) {
                case "#step-1":
                    break;
                    //-------SEYCI-----------
                case "#step-2":
                    console.log($targethrefVal);
                    listarEjecutivos();
                    listarAgencias();
                    AjaxSeyciInicio($('#txtExp').val());

                    break;
                    //-------TRASLADO-----------
                case "#step-3":
                    $('#nroExpT').val($('#txtExp').val());
                    $('#sltOpcionT').trigger('change');
                    break;
                case "#step-4":
                    break;
                case "#step-5":
                    break;
                case "#step-6":
                    break;
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

            if (isValid) {

                nextStepWizard.removeClass('disabled').trigger('click');
            }

        });


        $('div.setup-panel div a.btn-warning').trigger('click');


    });


}



