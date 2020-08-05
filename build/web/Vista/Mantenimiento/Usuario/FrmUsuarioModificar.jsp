<%!
    String codigo, D1, D2, D3, D4, D5, D6, D7, D8;
%>
<%
    codigo = (String) request.getAttribute("codigo");
    D1 = (String) request.getAttribute("D1");
    D2 = (String) request.getAttribute("D2");
    D3 = (String) request.getAttribute("D3");
    D4 = (String) request.getAttribute("D4");
    D5 = (String) request.getAttribute("D5");
    D6 = (String) request.getAttribute("D6");
    D7 = (String) request.getAttribute("D7");
    D8 = (String) request.getAttribute("D8");
%>
<input type="hidden"  name="op">    
<input type="hidden"  name="codigo" id="codigo" value="<%=codigo%>">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card">
    <div class="card-header">
        <div class="row">
            <div class="col">
                <br>
                <br>
                <h4 class="text-primary"><b><i class="fas fa-edit"></i> Modificando Usuario : </b></h4>
            </div>
            <div class="col">
                <br>
                <br>
                <center><h4 class="text-primary"><i class="fas fa-user"></i> <%=D5%> <%=D6%></h4></center>
            </div>
            <div class="col">
                <center><img src="<%=request.getContextPath()%>/Imagen/Personas/<%= D8%>" style="width: 100px; height: 100px;"/></center>
            </div>        
        </div>        
    </div>
    <div class="card-body">
        <div class="form-row">
            <div class="form-group col">
                <label for="Nombre" class="col control-label text-primary"><i class="fas fa-user"></i> Usuario  </label>
                <input type="text" id="txt1"   name="txt1"    value="<%=D1%>"  class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label text-primary"><i class="fas fa-lock"></i> Contraseña</label>
                <input type="text" id="txt2"   name="txt2"    value="<%=D2%>"    class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label text-primary"><i class="fas fa-users-cog"></i> Tipo de Usuario</label>
                <% if (D3.equals("1")) { %> <input type="text"disabled="false" class="form-control" value="Director"><% } %>
                <% if (D3.equals("2")) { %> <input type="text"disabled="false" class="form-control" value="Sub - Director"><% }%>
                <% if (D3.equals("3")) { %> <input type="text"disabled="false" class="form-control" value="Secretaria"><% } %>
                <% if (D3.equals("4")) { %> <input type="text"disabled="false" class="form-control" value="Profesor"><% } %>
                <% if (D3.equals("5")) { %> <input type="text"disabled="false" class="form-control" value="Alumno"><% }%>
            </div>   
        </div>
        <hr>
        <div class="form-row text-primary">
            <input type="hidden" disabled="false"  value="<%=D4%>"   class="form-control">
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-address-card"></i> Nombre </label>
                <input type="text" disabled="false"  value="<%=D5%>"    class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-address-card"></i> Apellido </label>
                <input type="text" disabled="false" value="<%=D6%>"    class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-address-card"></i> Apellido Materno</label>
                <input type="text" disabled="false" value="<%=D7%>"    class="form-control"  required="required">
            </div>   
        </div>   
    </div>
    <div class="card-footer">
        <div class="form-row text-center ">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-warning" onclick="CambiodePagina('<%=request.getContextPath()%>', 'UsuarioServlet', 10)" ><i class="fas fa-long-arrow-alt-left"></i> Regresar</button>
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-success" onclick="ActualizarUsuario('<%=request.getContextPath()%>', 'UsuarioServlet', 15)" ><i class="far fa-save"></i> Modificar</button>
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-danger"  onclick="Eliminar('<%=request.getContextPath()%>', 'UsuarioServlet', 16)" ><i class="fas fa-trash-alt"></i> Eliminar</button>
            </div>
        </div>
    </div>
</div>	
