<%@page import="java.util.Calendar"%>
<%@page    import="java.util.ArrayList"  %>
<%@page    import="Modelo.Bean.DatoBean"  %>
<%!
    ArrayList<DatoBean> lista = null;
    int i;
%>
<%
    lista = (ArrayList<DatoBean>) request.getAttribute("Listar");
%>  
<%
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
%> 
<%!
    ArrayList<DatoBean> Seccion = null;
%>
<%
    Seccion = (ArrayList<DatoBean>) request.getAttribute("Seccion");
%>
<input type="hidden"  name="op">    
<%--- ---------------------------------------------------------------------------  ---%> 
<br>
<br>
<div class="card">
    <div class="card-header">
        <center><h1 class="text-primary"><b> Actualizacion de Matricula</b></h1></center>
    </div>
    <div class="card-body text-primary">
        <br>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="codigo" class="col form-label"><i class="fas fa-graduation-cap"></i> Alumno</label>
                <select class="form-control" id="txt1" onclick="InsertarCurso('<%=request.getContextPath()%>', 'MatriculaServlet', 5)">
                    <option class="text-danger">Seleccion un Alumno</option>
                    <%    for (DatoBean objeto : lista) {%>
                    <option value="<%=objeto.getBDDATOAlumno()%>">
                        <%=objeto.getBDDATO2()%> <%=objeto.getBDDATO3()%>
                    </option> 
                    <% }%> 
                </select>
                <br>                
                <br>                
            </div>
                <div class="col-md-8">
                    <div id="Curso">
                        
                    </div>
                </div>
        </div>   
        <div class="row">
            <div class="col-md-2"><i class="fa fa-info-circle"></i> Datos de Matricula</div>
            <div class="col-md-10"><hr></div>
        </div>
        <div class="form-row">
            <div class="form-group col"> 
                <label for="codigo" class="col form-label"><i class="fas fa-list-alt"></i> Seleccione Seccion</label>
                <select class="form-control text-primary" id="txtSeccion" >
                    <option>  Seleccione Seccion</option>
                    <%    for (DatoBean objeto : Seccion) {%>
                    <option value="<%=objeto.getBDDATOSeccion()%>"><%=objeto.getBDDATO1()%> <%=objeto.getBDDATO2()%> - <%=objeto.getBDDATO3()%></option> 
                    <% }%> 
                </select>
            </div>   
            <div class="form-group col-md-2">
                <label class="col form-label"><i class="fas fa-list-alt"></i> Categoria</label>
                <select class="form-control text-primary" id="txtCategoria">
                    <option>Seleccione Categoria</option>
                    <option value="1">Normal - S./320</option>
                    <option value="2">Padre Policia - S./250</option>
                    <option value="3">Deportista - S./280</option>                        
                    <option value="4">Familiar - S./280</option>                        
                </select>
            </div>
            <div class="form-group col-md-2">
                <label for="Nombre" class="col control-label"><i class="fas fa-calendar-alt"></i> Año de Matricula</label>
                <input type="text" id="txt14" maxlength="4" value="<%=year%>" class="form-control"  required="required">
            </div>   
        </div>   
        <div class="row">
            <div class="col-md-2"><i class="fa fa-info-circle"></i> Datos de Apoderado</div>
            <div class="col-md-10"><hr></div>
        </div>
        <div class="form-row">
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-user"></i> Nombre</label>
                <input type="text" id="txt15"   placeholder="Ingrese Nombre"  class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-user"></i> Apellido</label>
                <input type="text" id="txt16"  placeholder="Ingrese Apellido"  class="form-control"  required="required">
            </div>
            <div class="form-group col-md-2">
                <label for="Nombre" class="col control-label"><i class="fas fa-id-badge"></i> Dni </label>
                <input type="number" maxlength="8"  id="txt17" placeholder="Ingrese DNI"  class="form-control"  oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"  required="required">
            </div>
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-phone"></i> Telefono</label>
                <input type="text" id="txt18" minlength="9" maxlength="9" placeholder="Telefono" class="form-control" required="required">
            </div>   
        </div>
    </div>
    <div class="card-footer">
        <div class="form-row text-center">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-warning" onclick="CambiodePagina('<%=request.getContextPath()%>', 'MatriculaServlet', 0)" ><i class="fas fa-long-arrow-alt-left"></i> Regresar</button>
            </div>
            <div class="col-md-8">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-success" onclick="GrabarActualizacion('<%=request.getContextPath()%>', 'MatriculaServlet', 4)" ><i class="far fa-save"></i> Grabar</button>
            </div>
        </div>
    </div>
</div>
<br>
<br>