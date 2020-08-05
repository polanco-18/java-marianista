<%@page    import="java.util.ArrayList"  %>
<%@page    import="Modelo.Bean.DatoBean"  %>
<%!
    ArrayList<DatoBean> lista = null;
    int i;
%>
<%
    lista = (ArrayList<DatoBean>) request.getAttribute("Listar");
%>  
<input type="hidden"  name="op">    
<%--- ---------------------------------------------------------------------------  ---%> 
<div class="card">
    <div class="card-header">
        <div class="row">
            <div class="col">
                <h3 class="text-primary"><b><i class="fas fa-plus-square"></i> Agregando Nuevo Curso </b></h3>
            </div>
        </div>        
    </div>
    <div class="card-body text-primary">
        <div class="form-row">
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-book"></i> Nombre de Curso</label>
                <input type="text" id="txt1" placeholder="Ingrese Nombre" class="form-control" required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-clipboard-list"></i> Detalle del Curso</label>
                <input type="text" id="txt2" placeholder="Ingrese Detalle del Curso" class="form-control" required="required">
            </div> 
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-user"></i> Docente</label>
                <select class="form-control" id="txt3">
                    <option class="text-danger">Seleccion un docente</option>
                    <%    for (DatoBean objeto : lista) {%>
                    <option value="<%=objeto.getBDDATODocente()%>">
                        <%=objeto.getBDDATO2()%> <%=objeto.getBDDATO3()%>
                    </option> 
                    <% }%> 
                </select>
                <small class="form-text text-muted">*Opcional.</small>
            </div>   
        </div>
    </div>        
    <div class="card-footer">
        <div class="form-row text-center">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-warning" onclick="CambiodePagina('<%=request.getContextPath()%>', 'CursoServlet', 0)" ><i class="fas fa-long-arrow-alt-left"></i> Regresar</button>
            </div>
            <div class="col-md-8">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-success" onclick="GrabarCurso('<%=request.getContextPath()%>', 'CursoServlet', 3)"><i class="far fa-save"></i> Grabar</button>
            </div>
        </div>
    </div>
</div>
