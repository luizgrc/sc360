
$(document).on("ready",inicio);
function inicio() {
    $("span.help-block").hide();
    $("#ingresar").click(validar);
}
function  validar() {
    var valor = document.getElementById("nickUsuario").value;
    var valorpas = document.getElementById("password").value;
    if (valor == null || valor.length == 0 || /^\s+$/.text(valor)) {
        $("#nickUsuario").parent().parent().attr("class", "form-group has-error");
        $("#nickUsuario".parent().children("span").text("Debe ingresar algun caracter").show());
        return false;
    } else if (valorpas == null || valorpas.length == 0 || /^\s+$/.text(valorpas)) {
        $("#password").parent().parent().attr("class", "form group has-error");
        return false;
    }
}


