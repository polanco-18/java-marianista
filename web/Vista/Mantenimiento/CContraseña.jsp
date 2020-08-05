<%@page import="Modelo.Bean.DatoBean"%>
<%!
    DatoBean objDatoBean;
%>
<%
    objDatoBean = (DatoBean) request.getAttribute("Usuario");
%> 
<form  name="form">
    <input type="hidden" name="op">
    <input type="hidden"  id="codigo" value="<%= objDatoBean.getBDDATOPersona()%>">
    <div class="card">
        <div class="card-header">
            <h4 class="text-primary"><i class="fas fa-key"></i> Cambiar Contraseña : </h4>
        </div>
        <div class="card-body">
            <% if (request.getAttribute("mensaje") != null) {%>  
            <div class="alert alert-dark alert-dismissible fade show text-primary" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <strong><%=(String) request.getAttribute("mensaje")%></strong>
            </div>  
            <br>
            <% }%>  
            <div class="row">
                <div class="col">
                    <label for="codigo" class="col-form-label text-primary"><i class="fas fa-address-card"></i> Nombre :</label>
                    <input type="text" disabled="false" value="<%= objDatoBean.getBDDATO1()%>" class="form-control" >
                </div>
                <div class="col">
                    <label for="codigo" class="col-form-label text-primary"><i class="fas fa-address-card"></i> Apellidos :</label>
                    <input type="text" disabled="false" value="<%= objDatoBean.getBDDATO2()%> <%= objDatoBean.getBDDATO3()%>" class="form-control" >
                </div>
            </div>
            <label for="inputCity" class="col-form-label text-primary"><i class="fas fa-unlock"></i> Conseña Actual :</label>
            <input type="password" class="form-control" id="txt1" required="required">
            <label for="inputCity" class="col-form-label text-primary"><i class="fas fa-unlock"></i> Conseña nueva :</label>
            <input type="password" class="form-control" id="txt2" required="required">
            <br>
        </div>
        <div class="card-footer">
            <center><button type="button" class="btn btn-outline-success" onclick="ActualizarUsuario('<%=request.getContextPath()%>', 'UsuarioServlet', 4)" ><i class="fas fa-sync-alt"></i> Modificar</button></center>
        </div>
    </div>
</form>