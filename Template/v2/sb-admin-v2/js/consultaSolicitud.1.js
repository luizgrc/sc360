
$(function() {
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

function showModalWindow() {
    $('#modal-detalle').modal({
        backdrop: 'static', keyboard: false
    });
    $("#modal-detalle").on('shown.bs.modal', function(){


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

                if (isValid) nextStepWizard.removeClass('disabled').trigger('click');
                
            });
        
            
            $('div.setup-panel div a.btn-warning').trigger('click');
            

      });

      
}

// evitar refresh
$(document).ready(function() {
    $(document).on('submit', '#step-1', function() {
      return false;
     });
});

