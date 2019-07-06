$('#mostrarmodal').on('click' , function(){
    $('#modal-detalle').modal({
        backdrop: 'static', keyboard: false
    });
});
function showModalWindow(idCorreo) {
    $('#modal-detalle').data("idCorreo", idCorreo).modal({
        backdrop: 'static', keyboard: false
    });
}