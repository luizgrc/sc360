

$('.fechaModal').datetimepicker({
        format: 'DD/MM/YYYY'

    });

$('#mostrarmodal').on('click' , function(){
    $('#modal-detalle').modal({
        backdrop: 'static', keyboard: false
    });
});
function showModalWindow(idTope) {
    $('#modal-detalle').data("idTope", idTope).modal({
        backdrop: 'static', keyboard: false
    });
}