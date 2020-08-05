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
<input type="hidden" name="codigo">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card text-primary">
    <div class="card-header">
        <h3><b><i class="fas fa-users"></i> Gestion de Personal</b></h3>
    </div>
    <div class="card-body">
        <br>    
        <input type="hidden" name="opcion" class="form-control">
        <div class="row">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-primary" onclick="CambiodePagina('<%=request.getContextPath()%>', 'PersonaServlet', 2)" title="Nuevo "><i class="fas fa-plus-circle"></i> Crear Personal</button>
            </div>
            <div class="col-md-4">
            </div>
            <div class="col-md-6">
                <div class="input-group">
                    <input type="search" id="txt1"class="form-control" placeholder="Buscar" onkeyup="BuscarR('<%=request.getContextPath()%>', 'PersonaServlet', 1)">      
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
                        <tr class="text-light" style="background-image:url('Imagen/FondoM.jpg')">    
                            <th colspan="2"><i class="fas fa-address-card"></i> Nombre y Apellidos</th> 
                            <th><i class="fas fa-birthday-cake"></i> Edad</th> 
                            <th><i class="fas fa-calendar-alt"></i> Fecha</th> 
                            <th><i class="fas fa-id-badge"></i> Dni</th> 
                            <th><i class="fas fa-venus"></i> Sexo</th>                                                        
                            <th><i class="fas fa-phone"></i> Telefono</th>
                            <th><i class="fas fa-chevron-circle-right"></i> Estado C</th> 
                            <th><i class="fas fa-envelope"></i> Correo</th> 
                            <th><i class="fas fa-home"></i> Direccion</th> 
                            <th><i class="fas fa-home"></i> Distrito</th> 
                            <th><i class="fas fa-home"></i> Provincia</th> 
                            <th><i class="fas fa-home"></i> Departamento</th> 
                            <th style="width: 50px;"><i class="fas fa-edit"></i> </th> 
                        </tr>           
                    </thead>
                    <tbody>             
                        <%
                            for (DatoBean objeto : lista) {
                        %>
                        <tr class="text-primary">                                  
                            <td><img src="<%=request.getContextPath()%>/Imagen/Personas/<%=objeto.getBDDATO4()%>"style="width: 30px; height: 30px;"/></td>
                            <td><%=objeto.getBDDATO1()%> <%=objeto.getBDDATO2()%> <%=objeto.getBDDATO3()%></td>                                                              
                            <td><%=objeto.getBDDATO5()%></td>                               
                            <td><%=objeto.getBDDATO6()%></td>                               
                            <td><%=objeto.getBDDATO7()%></td>   
                            <td> <% if (objeto.getBDDATO8().equals("0")) { %> <p class="text-danger">Femenino</p><% } else {%> <p class="text-success">Masculino</p><% }%></td>                                                        
                            <td><%=objeto.getBDDATO10()%></td>                               
                            <td><%=objeto.getBDDATO11()%></td>
                            <td><%=objeto.getBDDATO9()%></td>                        
                            <td><%=objeto.getBDDATO12()%></td>                        
                            <td><%=objeto.getBDDATO13()%></td>                        
                            <td><%=objeto.getBDDATO14()%></td>                        
                            <td><%=objeto.getBDDATO15()%></td>                        
                            <td><button class="btn btn-outline-primary" onclick="Modificar('<%=request.getContextPath()%>', 'PersonaServlet', 4, '<%=objeto.getBDDATOPersona()%>')"><i class="fas fa-info-circle"></i></button></td>                        
                        </tr>
                        <% }%>                              
                    </tbody>
                </table>
            </div>
        </div>       
    </div>
</div>
<br>
<br>