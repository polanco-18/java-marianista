<%@page    import="java.util.ArrayList"  %>
<%@page    import="Modelo.Bean.DatoBean"  %>
<%!
    ArrayList<DatoBean> Curso = null;
    ArrayList<DatoBean> Seccion = null;
    int i;
%>
<%
    Curso = (ArrayList<DatoBean>) request.getAttribute("Curso");
    Seccion = (ArrayList<DatoBean>) request.getAttribute("Seccion");
%> 
<input type="hidden"  name="op">     
<%--- ---------------------------------------------------------------------------  ---%> 
<div class="card">
    <div class="card-header">
        <div class="row">
            <div class="col">
                <h3 class="text-primary"><b><i class="fas fa-plus-square"></i> Agregando Nuevo Horario</b></h3>
            </div>
        </div>        
    </div>
    <div class="card-body text-primary">
        <div class="form-row">
            <div class="form-group col"> 
                <label for="codigo" class="col form-label"><i class="fas fa-list-alt"></i> Seleccione Seccion</label>
                <select class="form-control text-primary" id="txt1" onclick="InsertarCurso('<%=request.getContextPath()%>', 'HorarioServlet', 3)">
                    <option>  Seleccione Seccion</option>
                    <%    for (DatoBean objeto : Seccion) {%>
                    <option value="<%=objeto.getBDDATOSeccion()%>"><%=objeto.getBDDATO1()%> <%=objeto.getBDDATO2()%> - <%=objeto.getBDDATO3()%></option> 
                    <% }%> 
                </select>
            </div>   
            <div class="form-group col"> 
                <label for="codigo" class="col form-label"><i class="fas fa-book"></i> Seleccione Curso</label>
                <select class="form-control text-primary" id="txt2">
                    <option>  Seleccione Curso</option>
                    <%    for (DatoBean objeto : Curso) {%>
                    <option value="<%=objeto.getBDDATOCurso()%>"><%=objeto.getBDDATO4()%> - <%=objeto.getBDDATO1()%> <%=objeto.getBDDATO2()%> </option> 
                    <% }%> 
                </select>
            </div>   
            <div class="form-group col"> 
                <label for="codigo" class="col form-label"><i class="fas fa-calendar"></i> Dia</label>
                <select class="form-control text-primary" id="txt3">
                    <option value="1"> Lunes</option>
                    <option value="2"> Martes</option>
                    <option value="3"> Miercoles</option>
                    <option value="4"> Jueves</option>
                    <option value="5"> Viernes</option>
                    <option value="6"> Sabado</option>
                    <option value="7"> Domingo</option>
                </select>
            </div>   
            <div class="form-group col"> 
                <label for="codigo" class="col form-label"><i class="fas fa-clock"></i> Hora de Inicio</label>
                <input type="time" id="txt4" class="form-control" required="required">
            </div>   
            <div class="form-group col"> 
                <label for="codigo" class="col form-label"><i class="fas fa-clock"></i> Hora de Fin</label>
                <input type="time" id="txt5" class="form-control" required="required">
            </div>   
        </div>
    </div>        
    <div class="card-footer">
        <div class="form-row text-center">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-danger" onclick="CambiodePagina('<%=request.getContextPath()%>', 'HorarioServlet', 0)" ><i class="fas fa-long-arrow-alt-left"></i> Salir</button>
            </div>
            <div class="col-md-8">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-success" onclick="GrabarHorario('<%=request.getContextPath()%>', 'HorarioServlet', 4)"><i class="far fa-plus-square"></i> Agregar</button>
            </div>
        </div>
    </div>
</div>
<br>
<div id="Curso">

</div>
