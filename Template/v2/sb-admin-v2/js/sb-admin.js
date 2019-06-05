$(function () {

    //---------------------------------------------------------------
    $('#side-menu').metisMenu();
    $(window).bind("load resize", function () {
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    })
    /* $('#datetimepicker6').datetimepicker();
     $('#datetimepicker7').datetimepicker({
         useCurrent: false //Important! See issue #1075
     });
     $("#datetimepicker6").on("dp.change", function (e) {
         $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
     });
     $("#datetimepicker7").on("dp.change", function (e) {
         $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
     });*/

});

function MuestraAlerta(titulo, bodymensaje, callback) {
    // Crear Modal
    var ModalFade = document.createElement("div");
    // Agregando clases al elemento
    ModalFade.classList.add("modal");
    ModalFade.classList.add("fade");
    // Agregando id
    ModalFade.setAttribute("id", "Alertadm");
    // Agregando atributos al elemento
    ModalFade.setAttribute("tabindex", "-1");
    ModalFade.setAttribute("role", "dialog");
    //----------------------------------------------------------------
    var ModalDialog = document.createElement("div");
    ModalDialog.classList.add("modal-dialog");
    ModalDialog.classList.add("modal-sm");
    ModalDialog.setAttribute("role", "document");
    //----------------------------------------------------------------
    var ModalContent = document.createElement("div");
    ModalContent.classList.add("modal-content");
    //----------------------------------------------------------------
    var ModalHeader = document.createElement("div");
    ModalHeader.classList.add("modal-header");
    //----------------------------------------------------------------
    var ModalbtnX = document.createElement("button");
    ModalbtnX.setAttribute("type", "button");
    ModalbtnX.classList.add("close");
    ModalbtnX.setAttribute("data-dismiss", "modal");
    ModalbtnX.setAttribute("aria-label", "Close");
    //----------------------------------------------------------------
    var ModalbtnXSpan = document.createElement("span");
    ModalbtnXSpan.setAttribute("aria-hidden", "true");
    ModalbtnXSpan.innerHTML = "&times;";

    //----------------------------------------------------------------

    var ModalTitle = document.createElement("h4");
    ModalTitle.classList.add("modal-title");
    // Agregando Contenido al elemento
    ModalTitle.textContent = titulo;
    //----------------------------------------------------------------
    var ModalBody = document.createElement("div");
    ModalBody.classList.add("modal-body");
    //----------------------------------------------------------------
    var msjBody = document.createElement("p");
    msjBody.textContent = bodymensaje;
    //----------------------------------------------------------------
    var ModalFooter = document.createElement("div");
    ModalFooter.classList.add("modal-footer");
    //----------------------------------------------------------------
    var btnCerrar = document.createElement("button");
    btnCerrar.setAttribute("type", "button");
    btnCerrar.classList.add("btn");
    btnCerrar.classList.add("btn-default");
    btnCerrar.setAttribute("data-dismiss", "modal");
    btnCerrar.textContent = "Cerrar";
    //----------------------------------------------------------------
    var btnGuardar = document.createElement("button");
    btnGuardar.setAttribute("type", "button");
    btnGuardar.classList.add("btn");
    btnGuardar.classList.add("btn-custom");
    btnGuardar.setAttribute("data-dismiss", "modal");
    btnGuardar.textContent = "Guardar";
    btnGuardar.onclick = callback;
    //----------------------------------------------------------------
    ModalbtnX.appendChild(ModalbtnXSpan);
    ModalHeader.appendChild(ModalbtnX);
    ModalHeader.appendChild(ModalTitle);

    ModalBody.appendChild(msjBody);

    ModalFooter.appendChild(btnCerrar);
    ModalFooter.appendChild(btnGuardar);

    ModalContent.appendChild(ModalHeader);
    ModalContent.appendChild(ModalBody);
    ModalContent.appendChild(ModalFooter);

    ModalDialog.appendChild(ModalContent);

    ModalFade.appendChild(ModalDialog);
    //--------------------

    if (!$('#Alertadm').length) {
        document.body.appendChild(ModalFade)
    }

    $('#Alertadm').modal({
        backdrop: 'static',
        keyboard: false
    });

}

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
/*
$("#botModal").on("click", function () {
    $('#modal-date').modal();
});*/
/*
$('.fj-date').datetimepicker({
    format: "dd/mm/yyyy"
});*/