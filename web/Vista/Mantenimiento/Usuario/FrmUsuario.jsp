<%@page    import="java.util.ArrayList"  %>
<%@page    import="Modelo.Bean.DatoBean"  %>
<%!
    ArrayList<DatoBean> lista = null;
    int i;
%>
<%
    lista = (ArrayList<DatoBean>) request.getAttribute("ListarUsuario");
%>  
<input type="hidden"  name="op"> 
<input type="hidden" name="codigo">
<input type="hidden"  name="D1">
<input type="hidden"  name="D2">
<input type="hidden"  name="D3">
<input type="hidden"  name="D4">
<input type="hidden"  name="D5">
<input type="hidden"  name="D6">
<input type="hidden"  name="D7">
<input type="hidden"  name="D8">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card">
    <div class="card-header">
        <h3 class="text-primary"><b><i class="fas fa-users-cog"></i> Gestion de Usuarios</b></h3>
    </div>
    <div class="card-body">
        <br>    
        <input type="hidden" name="opcion" class="form-control">
        <div class="row">
            <div class="col-md-6">
            </div>
            <div class="col-md-6">
                <div class="input-group">
                    <input type="search" id="txt1"class="form-control" placeholder="Buscar" onkeyup="BuscarR('<%=request.getContextPath()%>', 'UsuarioServlet', 11)">      
                    <div class="input-group-prepend">
                        <div class="input-group-text"><i class="fas fa-search"></i></div>
                    </div>                  
                </div>
            </div>
        </div>
        <br>
        <% if (request.getAttribute("Mensaje") != null) {%>  
        <div class="alert alert-primary alert-dismissible fade show text-primary" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong><%=(String) request.getAttribute("Mensaje")%></strong>
        </div>  
        <br>
        <% }%>   
        <div class="table-responsive">
            <div id="BuscarR">
                <table class="table table-hover" style="background-color: white">
                    <thead>        
                        <tr class=" text-light"style="background-image:url('Imagen/FondoM.jpg')">      
                            <th><i class="fas fa-id-card-alt"></i> </th>
                            <th><i class="fas fa-camera"></i> </th> 
                            <th><i class="fas fa-address-card"></i> Nombre Apellido</th> 
                            <th><i class="fas fa-user"></i> Usuario</th> 
                            <th><i class="fas fa-lock"></i> Contraseña</th> 
                            <th><i class="fas fa-users-cog"></i> Tipo de Usuario</th> 

                        </tr>           
                    </thead>
                    <tbody>             
                        <%
                            for (DatoBean objeto : lista) {
                        %>      <tr class="text-primary" title="Modificar" onclick="ModificarUsuario('<%=request.getContextPath()%>',
                                        'UsuarioServlet', 14,
                                        '<%=objeto.getBDDATOUsuario()%>',
                                        '<%=objeto.getBDDATO1()%>',
                                        '<%=objeto.getBDDATO2()%>',
                                        '<%=objeto.getBDDATO3()%>',
                                        '<%=objeto.getBDDATOPersona()%>',
                                        '<%=objeto.getBDDATO5()%>',
                                        '<%=objeto.getBDDATO6()%>',
                                        '<%=objeto.getBDDATO7()%>',
                                        '<%=objeto.getBDDATO8()%>')" >    
                            <td>US00<%=objeto.getBDDATOUsuario()%></td>
                            <td><img src="<%=request.getContextPath()%>/Imagen/Personas/<%=objeto.getBDDATO8()%>"style="width: 30px; height: 30px;"/></td>                               
                            <td><%=objeto.getBDDATO5()%> <%=objeto.getBDDATO6()%> <%=objeto.getBDDATO7()%></td>
                            <td><%=objeto.getBDDATO1()%></td>
                            <td><%=objeto.getBDDATO2()%></td>
                            <td><% if (objeto.getBDDATO3().equals("1")) { %> <p class="text-danger">Director</p><% } %>
                                <% if (objeto.getBDDATO3().equals("2")) { %> <p class="text-danger">Sub-Director</p><% } %>
                                <% if (objeto.getBDDATO3().equals("3")) { %> <p class="text-warning">Secretaria</p><% } %>
                                <% if (objeto.getBDDATO3().equals("4")) { %> <p class="text-success">Profesor</p><% } %>
                                <% if (objeto.getBDDATO3().equals("5")) { %> <p class="text-primary">Alumno</p><% }%>
                            </td>  
                        </tr>
                        <% }%>                              
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>