<%-- 
    Document   : detalleConsulta
    Created on : 07/04/2019, 12:59:24 PM
    Author     : Elgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle Consulta</title>
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/main.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/style.css">
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-1.12.4.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/ajax.js"></script>
        <script>
            
            $(function() {
                $("#primerNombre").attr("placeholder", "Nombre 1");
                $("#segundoNombre").attr("placeholder", "Nombre 2");
                $("#primerApellido").attr("placeholder", "Apellido 1");
                $("#segundoApellido").attr("placeholder", "Apellido 2");
                $("#fechaNacimiento" ).datepicker();
            });
            
             function onChangeProvincia(campo,flag){
                
                var form=document.getElementById("frmconsulta");
                var dpto  = document.getElementById("departamento").value;
	        var campoaLlenar;
	        if(flag=='PR'){
		   campoaLlenar = document.getElementById("provincia");
	           limpiarCombo(campoaLlenar);
               }
	        if (campo.value!='S'){
		   ajax              = new Ajax(); 
                   ajax.clase        = "com.sc360.struts.jdbc.dao.ImpUtil";
                   ajax.metodo       = "provinciasXdepa";
                   ajax.async        = false;
                   ajax.parametros   = new Array("2",dpto," "," ");
                   ajax.cargarComboBox(campoaLlenar,"descripcion","codigo");  
               }else{
		    if(flag=='PR' && campo.value=='S'){
		       limpiarCombo(form.provincia);
                       limpiarCombo(form.distrito);
                    }
	        }
                
                
            }
            
            function onChangeDistrito(campo,flag){
                  var form=document.getElementById("frmconsulta");
                  var dpto  = document.getElementById("departamento").value;
                  var prov  = document.getElementById("provincia").value;
	          var campoaLlenar;
	          if(flag=='DI'){
		     campoaLlenar = document.getElementById("distrito");
                     limpiarCombo(campoaLlenar);
                  }
	          if (campo.value!='S'){
		          ajax              = new Ajax(); 
                          ajax.clase        = "com.sc360.struts.jdbc.dao.ImpUtil";
		          ajax.metodo       = "distritoXprovincia";
                          ajax.async        = false;
                          ajax.parametros   = new Array("3",dpto,prov," ");
		          ajax.cargarComboBox(campoaLlenar,"descripcion","codigo");  
	          }else{
                        if(flag=='DI' && campo.value=='S')
                        {
                            limpiarCombo(form.distrito);
                        }
	          }
            }
            
            function limpiarCombo(campo){

                while(campo.options.length>1){
                    campo.options.remove(1);
                }
            }
        </script>
    </head>
    <body>
        <html:form action="Consulta.do" styleId="frmConsulta" >
            
            
            <table width="600" border="0" cellpadding="0" cellspacing="0" class="Texto1">
                    <tr>
                        <td colspan="9">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="20">&nbsp;</td>
                      <td align="left">
                        <STRONG>DATOS GENERALES</STRONG>					  </td>
					  <td></td>
					  <td></td>
                      <td align="right">Exp</td>
                      <td align="left"><html:text property="numeroExpediente" styleClass="TextoCajaVerde" size="20" maxlength="20"></html:text></td>
                      <td align="right">CUSPP</td>
                      <td align="left"><html:text property="cuspp" styleClass="TextoDatosGenerales" size="20" maxlength="20"></html:text></td>
					  <td width="20">&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td align="left">&nbsp;</td>
                      <td></td>
                      <td></td>
                      <td align="right">&nbsp;</td>
                      <td align="left">&nbsp;</td>
                      <td align="right">&nbsp;</td>
                      <td align="left">&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
            </table>      
			<table width="600" border="0" cellpadding="0" cellspacing="0" class="Texto1">
			<tr>
                      <td width="20">&nbsp;</td>
                      <td width="110" style="text-align: center"><html:text property="primerNombre" styleClass="TextoDatosGenerales" styleId="primerNombre" size="20" maxlength="20" ></html:text></td>
                      <td width="40">&nbsp;</td>
                      <td width="110" align="center"><html:text property="segundoNombre" styleClass="TextoDatosGenerales" styleId="segundoNombre" size="20" maxlength="20" ></html:text></td>
                      <td width="40">&nbsp;</td>
                      <td width="110" align="center"><html:text property="primerApellido" styleClass="TextoDatosGenerales" styleId="primerApellido" size="20" maxlength="20"></html:text></td>
                      <td width="40">&nbsp;</td>
                      <td width="103" align="center"><html:text property="segundoApellido" styleClass="TextoDatosGenerales" styleId="segundoApellido" size="20" maxlength="20"></html:text></td>
					  <td width="20">&nbsp;</td>
              </tr>
			<tr>
			  <td>&nbsp;</td>
			  <td style="text-align: center">&nbsp;</td>
			  <td>&nbsp;</td>
			  <td align="center">&nbsp;</td>
			  <td>&nbsp;</td>
			  <td align="center">&nbsp;</td>
			  <td>&nbsp;</td>
			  <td align="center">&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
			</table>
			
			<table width="600" border="0" cellpadding="0" cellspacing="0" class="Texto1">
                    <tr>
					  <td width="20">&nbsp;</td>
                      <td width="100">Fecha de Nac.</td>
                      <td width="220" style="text-align: left">
                      <html:text property="fechaNacimiento" styleClass="Texto1" styleId="fechaNacimiento" size="12" />
                      <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>                      </td>
                      <td width="20">Correo</td>
                      <td width="20"><html:text property="correo" styleClass="TextoDatosGenerales"  size="20" maxlength="20"></html:text></td>
                      <td width="200">
                        <html:select property="sexo" styleClass="Texto1">
                            <html:option value="0">SEXO</html:option>   
                            <html:option value="1">MASCULINO</html:option>
                            <html:option value="2">FEMENINO</html:option>
                        </html:select>                      </td>
					  <td width="20">&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td style="text-align: left">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
            </table>
			<table width="600" border="0" cellpadding="0" cellspacing="0" class="Texto1">
                    <tr>
					    <td width="20">&nbsp;</td>
                        <td width="70" align="left">Telefono</td>
                        <td width="250" style="text-align: left">
                      <html:text property="telefono" styleClass="TextoDatosGenerales" styleId="telefono" size="20" maxlength="20" />                      </td>
                      <td width="20"></td>
                      <td width="70"></td>
                      <td width="150">
                        <html:select property="estadoCivil" styleClass="Texto1">
                            <html:option value="0">ESTADO CIVIL</html:option>   
                            <html:option value="1">SOLTERO</html:option>
                            <html:option value="2">CASADO</html:option>
                            <html:option value="3">VIUDO</html:option>
                            <html:option value="4">DIVORCIADO</html:option>
                        </html:select>					  </td>
					  <td width="20">&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td align="left">&nbsp;</td>
                      <td style="text-align: left">&nbsp;</td>
                      <td></td>
                      <td></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>        
            </table>
			
			<table width="600" border="0" cellpadding="0" cellspacing="0" class="Texto1">
                     <tr>
					     <td width="20">&nbsp;</td>
                        <td width="70" align="left">Direccion</td>
                        <td width="250" style="text-align: left">
                        <html:text property="telefono" styleClass="TextoDatosGenerales" styleId="direccion" size="40" maxlength="40" />                      </td>
                      <td width="20"></td>
                      <td width="70">Departamento</td>
                      <td width="150">
                          <select id="departamento" name="departamento" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #000000;" onchange="onChangeProvincia(this,'PR')" >
                            <option value="00">[DEPARTAMENTO]</option>
                            <c:forEach var="f" items="${listDepartamento}">
                                <option value="${f[0]}">${f[1]}</option>
                            </c:forEach>
                        </select>					  
                      </td>
					  <td width="20">&nbsp;</td>
                     </tr>
                     <tr>
                       <td>&nbsp;</td>
                       <td align="left">&nbsp;</td>
                       <td style="text-align: left">&nbsp;</td>
                       <td></td>
                       <td></td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                     </tr>
                 </table>
				 
				 <table width="600" border="0" cellpadding="0" cellspacing="0" class="Texto1">
                     <tr>
					     <td width="20">&nbsp;</td>
                         <td width="70" align="left">Provincia</td>
                         <td width="250" style="text-align: left">
                         <select name="provincia" class="Texto1" id="provincia" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #000000;" onchange="onChangeDistrito(this,'DI')">
                            <option value="00">[PROVINCIA]</option>
                            <c:forEach var="item" items="${listaProvincia}">
                                <option value="${item.codigo}" ${item.codigo == selectedProv ? 'selected="selected"' : ''}>${item.descripcion}</option>
                            </c:forEach>
                         </select>                   
			 </td>
                         <td width="20"></td>
                         <td width="70">Distrito</td>
                         <td width="150">
                            <select name="distrito" class="Texto1" id="distrito" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #000000;">
                                <option value="00">[DISTRITO]</option>
                                    <c:forEach var="item" items="${listaDistrito}">
                                        <option value="${item.codigo}" ${item.codigo == selectedDist ? 'selected="selected"' : ''}>${item.descripcion}</option>
                                    </c:forEach>
                            </select> 					  
			  </td>
					     <td width="20">&nbsp;</td>
                     </tr>
                     <tr>
                       <td>&nbsp;</td>
                       <td align="left">&nbsp;</td>
                       <td style="text-align: left">&nbsp;</td>
                       <td></td>
                       <td></td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                     </tr>
                 </table>
				 
				  <table width="600" border="0" cellpadding="0" cellspacing="0" class="Texto1">
                     <tr>
					     <td width="20">&nbsp;</td>
                         <td width="70" align="left">
						   <input type="checkbox">
						 </td>
                         <td width="250" style="text-align: left">
                             Tiene Apoderado                
						 </td>
                         <td width="20"></td>
                         <td width="70">&nbsp;</td>
                         <td width="150">
                            <div style="text-align: center"><input type="button" value="Guardar" alt="Guardar" class="button2"></div>					
						 </td>
					     <td width="20">&nbsp;</td>
                     </tr>
                     <tr>
                       <td>&nbsp;</td>
                       <td align="left">&nbsp;</td>
                       <td style="text-align: left">&nbsp;</td>
                       <td></td>
                       <td></td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                     </tr>
                 </table>
			
        </html:form>
    </body>
</html>
