
$(function() {

          $( "#btn-export" ).click(function() {
//            alert( "btn-export" );
          });
          
          $( "#btn-save" ).click(function() {
//            alert( "btn-save" );
          });
          
          $( "#btn-find" ).click(function() {
            var form=document.getElementById("frmConsulta");
            var tipoDocumento       = document.getElementById('tipoDocumento');
            
            var x = form.tipoDocumento.value;
            
            var numeroDocumento     = document.getElementById("numeroDocumento");
            var fechaSeccionIni     = document.getElementById("fechaSeccionIni");
            var fechaSeccionFin     = document.getElementById("fechaSeccionFin");
            var fechaAsignacionIni  = document.getElementById("fechaAsignacionIni");
            var fechaAsignacionFin  = document.getElementById("fechaAsignacionFin");
            var fechaVencimientoIni = document.getElementById("fechaVencimientoIni");
            var fechaVencimientoFin = document.getElementById("fechaVencimientoFin");
            var analista            = document.getElementById("analista");
            var estadoSolicitud     = document.getElementById("estadoSolicitud");
            if(x=="0")
                    {
                      alert("Debe seleccionar un tipo de Documento");
                      form.tipoDocumento.focus();
                      return;
                    }
                    
            //form.action="Consulta.do?method=buscarSolicitud&numDocumento="+numeroDocumento;
            form.action="Consulta.do?method=buscarSolicitud";
            form.method="post";
            form.submit(); 
          });
              

        
       /*function fncBuscarSolicitud(){
            var form=document.getElementById("frmConsulta");
            var tipoDocumento       = document.getElementById('tipoDocumento');
            
            var x = form.tipoDocumento.value;
            
            var numeroDocumento     = document.getElementById("numeroDocumento");
            var fechaSeccionIni     = document.getElementById("fechaSeccionIni");
            var fechaSeccionFin     = document.getElementById("fechaSeccionFin");
            var fechaAsignacionIni  = document.getElementById("fechaAsignacionIni");
            var fechaAsignacionFin  = document.getElementById("fechaAsignacionFin");
            var fechaVencimientoIni = document.getElementById("fechaVencimientoIni");
            var fechaVencimientoFin = document.getElementById("fechaVencimientoFin");
            var analista            = document.getElementById("analista");
            var estadoSolicitud     = document.getElementById("estadoSolicitud");
            if(x=="0")
                    {
                      alert("Debe seleccionar un tipo de Documento");
                      form.tipoDocumento.focus();
                      return;
                    }
                    
            //form.action="Consulta.do?method=buscarSolicitud&numDocumento="+numeroDocumento;
            form.action="Consulta.do?method=buscarSolicitud";
            form.method="post";
            form.submit(); 
          }
        */
// DataTable Init
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

});
       function showModalWindow(codigo){
//        window.open('Consulta.do?method=verDetalleDocumento&codigo='+codigo,'window','height: 300px, width: 900px'); 
        window.open("Consulta.do?method=verDetalleDocumento&codigo="+codigo, "window", "scrollbars=yes,width=1000,height=560");
       }