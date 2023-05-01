<input type="hidden"  name="op">    
<%--- ---------------------------------------------------------------------------  ---%> 
<div class="card">
    <div class="card-header">
        <div class="row">
            <div class="col">
                <h4 class="text-primary"><b><i class="fas fa-user-plus"></i> Agregando Nueva Persona </b></h4>
            </div>
        </div>        
    </div>
    <div class="card-body  text-primary">
        <div class="row">
            <div class="col-md-2"><i class="fa fa-info-circle"></i> Datos de la Persona</div>
            <div class="col-md-10"><hr></div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label class="col control-label"><i class="fas fa-address-card"></i> Nombres </label>
                <input type="text" id="txt1" placeholder="Ingrese Nombre" class="form-control" required="required">
            </div>   
            <div class="form-group col-md-3">
                <label class="col control-label"><i class="fas fa-address-card"></i> Apellido Paterno </label>
                <input type="text" id="txt2" placeholder="Ingrese Apellido Paterno" class="form-control" required="required">
            </div>   
            <div class="form-group col-md-3">
                <label class="col control-label"><i class="fas fa-address-card"></i> Apellido Materno </label>
                <input type="text" id="txt3" placeholder="Ingrese Apellido Materno" class="form-control" required="required">
            </div>   
            <div class="form-group col-md-2">
                <label class="col control-label"><i class="fas fa-image"></i> Imagen</label>
                <button type="button" class="btn-block btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-search"></i> Subir Imagaen</button>
            </div>                
        </div>
        <hr>
        <div class="form-row">            
            <div class="form-group col-md-4">
                <label class="col control-label"><i class="fas fa-envelope"></i> Correo </label>
                <input type="email" id="txt4" placeholder="Ingrese Correo" class="form-control">
            </div>
            <div class="form-group col-md-2">
                <label class="col control-label"><i class="fas fa-calendar-alt"></i> F. nacimiento</label>
                <input type="date" id="txt5" placeholder="Ingrese F. nacimiento" class="form-control"  required="required">
            </div>  
            <div class="form-group col-md-2">
                <label class="col control-label"><i class="fas fa-id-badge"></i> Dni </label>
                <input type="number" maxlength="8"  id="txt6" placeholder="Ingrese DNI"  class="form-control"  oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"  required="required">
            </div>
            <div class="form-group col-md-2">
                <label class="col form-label"><i class="fas fa-venus"></i> Sexo </label>
                <select class="form-control" id="txt7">
                    <option>Seleccione Sexo</option>
                    <option value="1">Hombre</option>
                    <option value="0">Mujer</option>
                </select>
            </div> 
            <div class="form-group col-md-2">
                <label class="col control-label"><i class="fas fa-phone"></i> Telefono</label>
                <input type="number" id="txt8" maxlength="9"  placeholder="Ingrese Telefono"  class="form-control"  oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required="required">
            </div>  
        </div>
        <hr>
        <div class="form-row">
            <div class="form-group col-md-2">
                <label class="col form-label"><i class="fas fa-chevron-circle-right"></i> Estado Civil</label>
                <select  id="txt9" class="form-control">
                    <option class="text-primary">Seleccione Estado Civil</option>
                    <option value="Soltero" class="text-primary">Soltero</option>
                    <option value="Viudo" class="text-success">Viudo</option>
                    <option value="Casado" class="text-danger">Casado</option>
                </select>
            </div>  
            <div class="form-group col-md-4">
                <label class="col control-label"><i class="fas fa-home"></i> Direccion </label>
                <input type="text" id="txt10"  placeholder="Ingrese Direccion"  class="form-control"  required="required">
            </div> 
            <div class="form-group col-md-2">
                <label class="col form-label"><i class="fas fa-home"></i> Distrito</label>
                <select class="form-control" id="txt11">
                    <option>Seleccione Distrito</option>
                    <option value="Anc�n">Anc�n</option>
                    <option value="Ate">Ate</option>
                    <option value="Barranco">Barranco</option>
                    <option value="Bre�a">Bre�a</option>
                    <option value="Carabayllo">Carabayllo</option>
                    <option value="Chaclacayo">Chaclacayo</option>
                    <option value="Chorrillos">Chorrillos</option>
                    <option value="Cieneguilla">Cieneguilla</option>
                    <option value="Comas">Comas</option>
                    <option value="El Agustino">El Agustino</option>
                    <option value="Independencia">Independencia</option>
                    <option value="Jes�s Mar�a">Jes�s Mar�a</option>
                    <option value="La Molina">La Molina</option>
                    <option value="La Victoria">La Victoria</option>
                    <option value="Lima">Lima</option>
                    <option value="Lince">Lince</option>
                    <option value="Los Olivos">Los Olivos</option>
                    <option value="Lurigancho">Lurigancho</option>
                    <option value="Lur�n">Lur�n</option>
                    <option value="Magdalena del Mar">Magdalena del Mar</option>
                    <option value="Miraflores">Miraflores</option>
                    <option value="Pachacamac">Pachacamac</option>
                    <option value="Pucusana">Pucusana</option>
                    <option value="Pueblo Libre">Pueblo Libre</option>
                    <option value="Puente Piedra">Puente Piedra</option>
                    <option value="Punta Hermosa">Punta Hermosa</option>
                    <option value="Punta Negra">Punta Negra</option>
                    <option value="R�mac">R�mac</option>
                    <option value="San Borja">San Borja</option>
                    <option value="San Isidro">San Isidro</option>
                    <option value="San Juan de Lurigancho">San Juan de Lurigancho</option>
                    <option value="San Juan de Miraflores">San Juan de Miraflores</option>
                    <option value="San Luis">San Luis</option>
                    <option value="San Mart�n de Porres">San Mart�n de Porres</option>
                    <option value="San Miguel">San Miguel</option>
                    <option value="Santa Anita">Santa Anita</option>
                    <option value="Santa Mar�a del Mar">Santa Mar�a del Mar</option>
                    <option value="Santa Rosa">Santa Rosa</option>
                    <option value="Santiago de Surco">Santiago de Surco</option>
                    <option value="Surquillo">Surquillo</option>
                    <option value="Villa El Salvador">Villa El Salvador</option>
                    <option value="Villa Mar�a del Triunfo">Villa Mar�a del Triunfo</option>
                </select>
            </div>   
            <div class="form-group col-md-2">
                <label class="col control-label"><i class="fas fa-home"></i> Provincia</label>
                <input type="text" id="txt12" placeholder="Ingrese Provincia" class="form-control" value="Lima" required="required">
            </div>   
            <div class="form-group col-md-2">
                <label class="col control-label"><i class="fas fa-home"></i> Departamento</label>
                <input type="text" id="txt13" placeholder="Ingrese Departamento"class="form-control" value="Lima" required="required">
            </div>
        </div>
        <div class="row">
            <div class="col-md-2"><i class="fa fa-info-circle"></i> Datos de la Cuenta</div>
            <div class="col-md-10"><hr></div>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <label class="col form-label"><i class="fas fa-user-tag"></i> Tipo de Cuenta </label>
                <select class="form-control" id="txt14">
                    <option value="" class="text-primary">Seleccione tipo de Cuenta</option>
                    <option value="1" class="text-danger">Director</option>
                    <option value="2" class="text-warning">Subdirector</option>
                    <option value="3" class="text-success">Secretaria</option>
                    <option value="4" class="text-info">Docente</option>
                    <option value="5" class="text-primary">Alumno</option>
                </select>
            </div>                  
        </div>   
    </div>      
    <div class="card-footer">
        <div class="form-row text-center">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-warning" onclick="CambiodePagina('<%=request.getContextPath()%>', 'PersonaServlet', 0)" ><i class="fas fa-long-arrow-alt-left"></i> Regresar</button>
            </div>
            <div class="col-md-8">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-success" onclick="InsertarPersonal('<%=request.getContextPath()%>', 'PersonaServlet', 3)"><i class="far fa-save"></i> Grabar</button>
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
                <form action="SubirImagen" method="post" enctype="multipart/form-data" target="_blank">
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
