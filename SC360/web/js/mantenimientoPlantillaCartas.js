  
  
  $(document).on('click', '.delete', function() {
    $(this).parents('tr').remove();
  
  });
  $('#mostrarmodal').on('click' , function(){
    $('#modal-detalle').modal({
        backdrop: 'static', keyboard: false
    });
});
function showModalWindow(idTramite) {
    $('#modal-detalle').data("idTramite", idTramite).modal({
        backdrop: 'static', keyboard: false
    });
}