<input type="hidden"  name="op">    
<input type="hidden"  id="txt4">    
<%--- ---------------------------------------------------------------------------  ---%> 
<div class="card">
    <div class="card-header">
        <div class="row">
            <div class="col">
                <h3 class="text-primary"><b><i class="fas fa-plus-square"></i> Agregando Nuevo Salon</b></h3>
            </div>
        </div>        
    </div>
    <div class="card-body text-primary">
        <div class="form-row">
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-list-ol"></i> Numero del Salon</label>
                <input type="text" id="txt1" placeholder="Ingrese Numero" class="form-control" required="required">
            </div>   
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-building"></i> Edificio</label>
                <select  id="txt2" class="form-control">
                    <option class="text-primary">Seleccione Edificio</option>
                    <option value="Primaria" class="text-primary">Primaria</option>
                    <option value="Secundaria" class="text-primary">Secundaria</option>
                </select>
            </div>
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-male"></i> Foro</label>
                <select  id="txt3" class="form-control">
                    <option class="text-primary">Seleccione Foro</option>
                    <option value="10" class="text-primary">10</option>
                    <option value="15" class="text-primary">15</option>
                    <option value="20" class="text-primary">20</option>
                    <option value="25" class="text-primary">25</option>
                    <option value="30" class="text-primary">30</option>
                    <option value="35" class="text-primary">35</option>
                    <option value="40" class="text-primary">40</option>
                    <option value="45" class="text-primary">45</option>
                    <option value="50" class="text-primary">50</option>
                </select>
            </div>              
        </div>
    </div>        
    <div class="card-footer">
        <div class="form-row text-center">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-warning" onclick="CambiodePagina('<%=request.getContextPath()%>', 'SalonServlet', 0)" ><i class="fas fa-long-arrow-alt-left"></i> Regresar</button>
            </div>
            <div class="col-md-8">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-success" onclick="GrabarSalon('<%=request.getContextPath()%>', 'SalonServlet', 3)"><i class="far fa-save"></i> Grabar</button>
            </div>
        </div>
    </div>
</div>
