<%@page import="Modelo.Bean.DatoBean"%>
<%!
    DatoBean objBean;
%>
<%
    objBean = (DatoBean) request.getAttribute("Datos");
%>   
<input type="hidden"  name="op">    
<input type="hidden"  name="codigo1" id="codigo" value="<%=objBean.getBDDATOPersona()%>">
<input type="hidden"  name="codigo2" id="codigo2" value="<%=objBean.getBDDATOUsuario()%>">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card text-primary">
    <div class="card-header">
        <div class="row">
            <div class="col">
                <br>
                <br>
                <h4><b><i class="fas fa-edit"></i> Modificando Persona : </b></h4>
            </div>
            <div class="col">
                <br>
                <br>
                <center><h4><i class="fas fa-user"></i> <%=objBean.getBDDATO2()%> <%=objBean.getBDDATO2()%></h4></center>
            </div>
            <div class="col">
                <center><img src="<%=request.getContextPath()%>/Imagen/Personas/<%=objBean.getBDDATO1()%>" style="width: 100px; height: 100px;"/></center>
                <a class="btn btn-outline-danger"  href="JavaScript:Datos('<%=request.getContextPath()%>','PersonaServlet',7,'<%="&txtcod=" + objBean.getBDDATOPersona() + "&txttip=" + objBean.getBDDATO1()%>')">Borrar Img</a>
            </div>        
            <div class="col">
                <label for="Nombre" class="col control-label"><i class="fas fa-image"></i> Imagen</label>
                <button type="button" class="btn-block btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-search"></i> Subir Imagaen</button>

            </div>        
        </div>        
    </div>
    <div class="card-body  text-primary">
        <div class="form-row">
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-address-card"></i> Nombre </label>
                <input type="text" id="txt1" value="<%=objBean.getBDDATO2()%>" class="form-control" required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-address-card"></i> Apellido Paterno </label>
                <input type="text" id="txt2" value="<%=objBean.getBDDATO3()%>" class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-address-card"></i> Apellido Materno </label>
                <input type="text" id="txt3" value="<%=objBean.getBDDATO4()%>" class="form-control" required="required">
            </div>
            <div class="form-group col-md-1">
                <label for="Nombre" class="col control-label"><i class="fas fa-birthday-cake"></i> Edad </label>
                <input type="number" value="<%=objBean.getBDDATO5()%>" class="form-control" disabled>
            </div>
            <div class="form-group col-md-2">
                <label for="Nombre" class="col control-label"><i class="fas fa-calendar-alt"></i> F. nacimiento</label>
                <input type="date" value="<%=objBean.getBDDATO6()%>" class="form-control" disabled>
            </div>             
        </div>
        <hr>
        <div class="form-row">
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-id-badge"></i> Dni </label>
                <input type="text" value="<%=objBean.getBDDATO7()%>" class="form-control" disabled>
            </div>
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-venus"></i> Sexo </label>
                <select class="form-control" disabled>
                    <%  if (objBean.getBDDATO8().equals("1")) { %>
                    <option value="1" class="text-primary">Masculino</option>
                    <option value="0" class="text-danger">Femenino</option>
                    <%} else {%>
                    <option value="0" class="text-danger">Femenino</option>
                    <option value="1" class="text-primary">Masculino</option>
                    <% }%>
                </select>
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-envelope"></i> Correo </label>
                <input type="email" id="txt4" value="<%=objBean.getBDDATO9()%>"    class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-phone"></i> Telefono</label>
                <input type="number" id="txt5" maxlength="9" value="<%=objBean.getBDDATO10()%>" class="form-control" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required="required">
            </div>   
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-chevron-circle-right"></i> Estado Civil</label>
                <select  id="txt6" class="form-control">
                    <%  if (objBean.getBDDATO11().equals("Soltero")) { %>
                    <option value="Soltero" class="text-primary">Soltero</option>
                    <option value="Viudo" class="text-primary">Viudo</option>
                    <option value="Casado" class="text-primary">Casado</option>
                    <% }
                        if (objBean.getBDDATO11().equals("Viudo")) { %>
                    <option value="Viudo" class="text-primary">Viudo</option>
                    <option value="Soltero" class="text-primary">Soltero</option>
                    <option value="Casado" class="text-primary">Casado</option>
                    <%}
                        if (objBean.getBDDATO11().equals("Casado")) {%>
                    <option value="Casado" class="text-primary">Casado</option>
                    <option value="Viudo" class="text-primary">Viudo</option>
                    <option value="Soltero" class="text-primary">Soltero</option>
                    <% }%>
                </select>
            </div>  
        </div>
        <hr>
        <div class="form-row">            
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-home"></i> Direccion</label>
                <input type="text" id="txt7" value="<%=objBean.getBDDATO12()%>" class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-home"></i> Distrito</label>
                <select class="form-control text-primary" id="txt8">
                    <option><%=objBean.getBDDATO13()%> </option>
                    <option>--- Otro Distritos ---</option>
                    <option value="Ancon">Ancón</option>
                    <option value="Ate">Ate</option>
                    <option value="Barranco">Barranco</option>
                    <option value="Breña">Breña</option>
                    <option value="Carabayllo">Carabayllo</option>
                    <option value="Chaclacayo">Chaclacayo</option>
                    <option value="Chorrillos">Chorrillos</option>
                    <option value="Cieneguilla">Cieneguilla</option>
                    <option value="Comas">Comas</option>
                    <option value="El Agustino">El Agustino</option>
                    <option value="Independencia">Independencia</option>
                    <option value="Jesús María">Jesús María</option>
                    <option value="La Molina">La Molina</option>
                    <option value="La Victoria">La Victoria</option>
                    <option value="Lima">Lima</option>
                    <option value="Lince">Lince</option>
                    <option value="Los Olivos">Los Olivos</option>
                    <option value="Lurigancho">Lurigancho</option>
                    <option value="Lurín">Lurín</option>
                    <option value="Magdalena del Mar">Magdalena del Mar</option>
                    <option value="Miraflores">Miraflores</option>
                    <option value="Pachacamac">Pachacamac</option>
                    <option value="Pucusana">Pucusana</option>
                    <option value="Pueblo Libre">Pueblo Libre</option>
                    <option value="Puente Piedra">Puente Piedra</option>
                    <option value="Punta Hermosa">Punta Hermosa</option>
                    <option value="Punta Negra">Punta Negra</option>
                    <option value="Rímac">Rímac</option>
                    <option value="San Borja">San Borja</option>
                    <option value="San Isidro">San Isidro</option>
                    <option value="San Juan de Lurigancho">San Juan de Lurigancho</option>
                    <option value="San Juan de Miraflores">San Juan de Miraflores</option>
                    <option value="San Luis">San Luis</option>
                    <option value="San Martín de Porres">San Martín de Porres</option>
                    <option value="San Miguel">San Miguel</option>
                    <option value="Santa Anita">Santa Anita</option>
                    <option value="Santa Maria del Mar">Santa María del Mar</option>
                    <option value="Santa Rosa">Santa Rosa</option>
                    <option value="Santiago de Surco">Santiago de Surco</option>
                    <option value="Surquillo">Surquillo</option>
                    <option value="Villa El Salvador">Villa El Salvador</option>
                    <option value="Villa María del Triunfo">Villa María del Triunfo</option>
                </select>
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-home"></i> Provincia </label>
                <input type="text" id="txt9" value="<%=objBean.getBDDATO14()%>" class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-home"></i> Departamento </label>
                <input type="text" id="txt10" value="<%=objBean.getBDDATO15()%>" class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-home"></i> Fecha Creada </label>
                <input type="datetime" value="<%=objBean.getBDDATO16()%>" class="form-control"  disabled>
            </div>   
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-venus"></i> Estado de Cuenta </label>
                <select class="form-control" id="txt11">
                    <%  if (objBean.getBDDATO17().equals("Activado")) { %>
                    <option value="Activado" class="text-primary">Activado</option>
                    <option value="Desactivado" class="text-danger">Desactivado</option>
                    <%} else {%>
                    <option value="Desactivado" class="text-danger">Desactivado</option>
                    <option value="Activado" class="text-primary">Activado</option>
                    <% }%>
                </select>
            </div>  
        </div>
        <div class="form-row">
            <div class="col">
                <label for="codigo" class="col form-label"><i class="fas fa-venus"></i> Tipo de Cuenta </label>
                <select class="form-control" id="txt12">
                    <%  if (objBean.getBDDATO18().equals("1")) { %>
                    <option value="1" class="text-primary">Director</option>
                    <option value="2" class="text-primary">Subdirector</option>
                    <option value="3" class="text-primary">Secretaria</option>
                    <option value="4" class="text-primary">Docente</option>
                    <option value="5" class="text-primary">Alumno</option>
                    <%} else if (objBean.getBDDATO18().equals("2")) { %>
                    <option value="2" class="text-primary">Subdirector</option>
                    <option value="1" class="text-primary">Director</option>
                    <option value="3" class="text-primary">Secretaria</option>
                    <option value="4" class="text-primary">Docente</option>
                    <option value="5" class="text-primary">Alumno</option>
                    <%} else if (objBean.getBDDATO18().equals("3")) { %>
                    <option value="3" class="text-primary">Secretaria</option>
                    <option value="2" class="text-primary">Subdirector</option>
                    <option value="1" class="text-primary">Director</option>
                    <option value="4" class="text-primary">Docente</option>
                    <option value="5" class="text-primary">Alumno</option>
                    <%} else if (objBean.getBDDATO18().equals("4")) { %>
                    <option value="4" class="text-primary">Docente</option>
                    <option value="3" class="text-primary">Secretaria</option>
                    <option value="2" class="text-primary">Subdirector</option>
                    <option value="1" class="text-primary">Director</option>
                    <option value="5" class="text-primary">Alumno</option>
                    <%} else {%>
                    <option value="5" class="text-primary">Alumno</option>
                    <option value="4" class="text-primary">Docente</option>
                    <option value="3" class="text-primary">Secretaria</option>
                    <option value="2" class="text-primary">Subdirector</option>
                    <option value="1" class="text-primary">Director</option>
                    <% }%>
                </select>
            </div>
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-home"></i> Usuario</label>
                <input type="text" id="txt13" value="<%=objBean.getBDDATO19()%>" class="form-control"  required="required">
            </div> 
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-home"></i> Clave</label>
                <input type="text" id="txt14" value="<%=objBean.getBDDATO20()%>" class="form-control"  required="required">
            </div> 
        </div>
    </div>  
    <div class="card-footer">
        <div class="form-row text-center ">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-warning" onclick="CambiodePagina('<%=request.getContextPath()%>', 'PersonaServlet', 0)" ><i class="fas fa-long-arrow-alt-left"></i> Regresar</button>
            </div>
            <div class="col-md-8">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-success" onclick="ActualizarPer('<%=request.getContextPath()%>', 'PersonaServlet', 5)" ><i class="far fa-save"></i> Modificar</button>
            </div>        
        </div>
    </div>	
</div>
<br>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Subir Imagen</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ImagenEditar" method="post" enctype="multipart/form-data" target="_blank">
                    <input type="hidden"  name="codigo1" id="codigo1" value="<%=objBean.getBDDATOPersona()%>">
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="file" name="file">
                            <label class="custom-file-label" >Seleccione Archivo</label>
                        </div>
                        <div class="input-group-append">
                            <input class="btn btn-outline-secondary" type="submit"value="Guardar">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>  