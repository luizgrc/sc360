<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--DATOS GENERALES-->
<form role="form" id="step-1" class="setup-content">
    <div class="panel panel-primary ">
        <!--Titulo-->
        <div class="panel-heading">
            <h3 class="panel-title">Consulta detalle</h3>
        </div>
        <!--/.Titulo-->
        <div class="panel-body" style="width: auto;height: 400px;overflow-y: auto;">
            <div class="container">
                <div>
                    <STRONG>DATOS GENERALES</STRONG>&nbsp;
                </div>
                <div class="space">&nbsp;</div>
                <div class="col-md-12">
                    <div class="col-md-2">
                        <label style="margin: 4px">Exp &nbsp;</label>
                    </div>
                    <div class="col-md-2">
                        <input id="txtExp" name="txtExp" class="form-control input-sm "
                               size="12" maxlength="12" readonly="true"/></div>
                </div>
                <div class="space">&nbsp;</div>
                <div>
                    <div class="col-lg-6">
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">CUSPP&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <input readonly="true" id="txtCuspp" name="txtCuspp" type="text" required="" class="input-sm form-control"
                                   style="width: 167px;" />
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="">
                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Primer
                                nombre&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <input id="txtpNom" name="txtpNom" type="text" required="" class="input-sm"
                                   style="width: 167px;" />
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Segundo
                                Nombre&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <input id="txtsNom" name="txtsNom" type="text" required="required" class="input-sm"
                                   style="width: 167px;" />
                        </div>
                        <div class="col-md-4 ">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Primer
                                Apellido&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <input id="txtpApe" name="txtpApe" type="text" required="required" class=" input-sm"
                                    style="width: 167px;" />

                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <!---->
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Segundo
                                Apellido&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <input id="txtsApe" name="txtsApe" type="text" required="required" class="input-sm"
                                    style="width: 167px;" />

                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-lg-4" style="height: 20px">
                            <label style="padding-top: 10px;">Fecha
                                Nacimiento&nbsp;</label>
                        </div>
                        <div class="col-md-4 form-inline">
                            <div class="input-group date fechaModal">
                                <input id="txtfecNac" name="txtfecNac" type="text" required="required"
                                       class="form-control input-sm "
                                       style="width: 130px;" />
                                <span class="input-group-addon">
                                    <span class="fa fa-calendar"></span>
                                </span></div>
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Correo&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <input id="txtcorreo" name="txtcorreo" type="text" required="required"
                                   class="input-sm" style="width: 167px;">
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="col-md-4" style="height: 20px ">
                            <label style="padding-top: 10px;"> Sexo&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <select id="txtSexo" name="txtSexo" required="required" style="width: 168px;"
                                    class="input-sm">
                                <option value="">
                                    [SEXO]
                                </option>
                                <option value="1">
                                    MASCULINO
                                </option>
                                <option value="2">
                                    FEMENINO
                                </option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <!---->
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Telefono&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <input id="txtTelefono" name="txtTelefono" required="required" class=" input-sm" 
                                   style="width: 167px;" />

                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Estado Civil&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <select id="txtEstCivil" name="txtEstCivil" required="required" style="width: 168px;"
                                    class="input-sm">
                                <option value="">
                                    [ESTADO CIVIL]
                                </option>
                                <option value="1">
                                    SOLTERO
                                </option>
                                <option value="2">
                                    CASADO
                                </option>
                                <option value="3">
                                    VIUDO
                                </option>
                                <option value="4">
                                    DIVORCIADO
                                </option>                                
                            </select>
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <!---->
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Direccion&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <input id="txtDireccion" name="txtDireccion" required="required" class="input-sm" 
                                   size="20" maxlength="20" />

                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <!---->
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Departamento&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <select id="txtdepartamento" name="txtdepartamento" required="required" class=" input-sm" style="width: 168px;" >
                                <option value="">[DEPARTAMENTO]</option>
                                <c:forEach var="f" items="${listDepartamento}">
                                    <option value="<c:out value="${f.codigo}"/>"><c:out value="${f.descripcion}"/></option>
                                </c:forEach>

                            </select>
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <!---->
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Provincia&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <select id="txtprovincia" name="txtprovincia" required="required" class="input-sm" style="width: 168px;" >
                                <option value="">[PROVINCIA]</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                        <div class="space">&nbsp;</div>
                        <!---->
                        <div class="col-md-4" style="height: 20px">
                            <label style="padding-top: 10px;">Distrito&nbsp;</label>
                        </div>
                        <div class="col-md-4">
                            <select id="txtdistrito" name="distrito" style="width: 168px;"
                                    required="required" class="input-sm" >
                                <option value="">
                                    [DISTRITO]
                                </option>

                            </select>
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" required="required">
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="container col-9 form-inline">
                        <input type="checkbox" required="required">&nbsp;<label style="padding-top: 10px;">Tiene
                            Apoderado</label>
                    </div>
                </div>

            </div>
        </div>
    </div>
    
        
    <button class="btn btn-custom nextBtn pull-right" type="submit" id="btndetConsulta">Siguiente</button>
</form>

<!--/.DATOS GENERALES-->