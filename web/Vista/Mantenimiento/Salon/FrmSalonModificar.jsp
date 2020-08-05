<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Bean.DatoBean"%>
<%!
    String codigo, D3, D1, D2;
%>
<%
    codigo = (String) request.getAttribute("codigo");
    D1 = (String) request.getAttribute("D1");
    D2 = (String) request.getAttribute("D2");
    D3 = (String) request.getAttribute("D3");
%>
<input type="hidden"  name="op">    
<input type="hidden"  name="codigo" id="codigo" value="<%=codigo%>">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card">
    <div class="card-header">
        <h3 class="text-primary"><b><i class="fas fa-edit"></i> Modificando Salon <%=D1%></b></h3>
    </div>
    <div class="card-body text-primary">
        <br>
        <div class="form-row">
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-list-ol"></i> Numero del Salon</label>
                <input type="text" id="txt1" value="<%=D1%>" class="form-control" required="required">
            </div>   
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-building"></i> Edificio</label>
                <select  id="txt2" class="form-control">
                    <%if (D2.equals("Primaria")) {%>
                    <option value="Primaria" class="text-primary">Primaria</option>
                    <option value="Secundaria" class="text-primary">Secundaria</option>
                    <%}
                        if (D2.equals("Secundaria")) {%>
                    <option value="Secundaria" class="text-primary">Secundaria</option>
                    <option value="Primaria" class="text-primary">Primaria</option>
                    <%}%>
                </select>
            </div>
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-male"></i> Foro</label>
                <select  id="txt3" class="form-control">
                    <option class="<%=D3%>"><%=D3%></option>
                    <option class="text-primary">Seleccione otro Foro</option>
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
        <div class="form-row text-center ">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-warning" onclick="CambiodePagina('<%=request.getContextPath()%>', 'SalonServlet', 0)" ><i class="fas fa-long-arrow-alt-left"></i> Regresar</button>
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-success" onclick="ActualizarCurso('<%=request.getContextPath()%>', 'SalonServlet', 5)" ><i class="far fa-save"></i> Modificar</button>
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-danger"  onclick="Eliminar('<%=request.getContextPath()%>', 'SalonServlet', 6)" ><i class="fas fa-trash-alt"></i> Eliminar</button>
            </div>
        </div>
    </div>	       	       
</div>	       	       
<br>
<br>