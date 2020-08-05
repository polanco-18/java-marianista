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
<input type="hidden"  name="D1">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card">
    <div class="card-header">
        <h3 class="text-primary"><b><i class="fas fa-clipboard-list"></i> Matricula</b></h3>
    </div>
    <div class="card-body">
        <br>    
        <input type="hidden" name="opcion" class="form-control">
        <div class="row">
            <div class="col-md-2">
                <button id="btnGroupDrop1" type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Matricula</button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <a class="dropdown-item text-primary" href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','MatriculaServlet',2)"><i class="fas fa-plus-square"></i> Nueva Matricula</a>
                    <a class="dropdown-item text-primary" href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','MatriculaServlet',4)"><i class="fas fa-sync"></i> Actualizar Matricula</a>
                </div>
            </div>
            <div class="col-md-4">
            </div>
            <div class="col-md-6">
                <div class="input-group">
                    <input type="search" id="txt1"class="form-control" placeholder="Buscar" onkeyup="BuscarR('<%=request.getContextPath()%>', 'MatriculaServlet', 1)">      
                    <div class="input-group-prepend">
                        <div class="input-group-text"><i class="fas fa-search"></i></div>
                    </div>                  
                </div>
            </div>
        </div>
        <br>
        <% if (request.getAttribute("Mensaje") != null) {%>  
        <div class="alert alert-dark alert-dismissible fade show text-primary" role="alert">
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
                        <tr class="bg-primary text-light"  style="background-image:url('Imagen/FondoM.jpg')" >      
                            <th><i class="fas fa-id-card-alt"></i> </th>  
                            <th><i class="fas fa-camera"></i> </th>
                            <th><i class="fas fa-address-card"></i> Nombres</th>
                            <th><i class="fas fa-birthday-cake"></i> Edad</th>
                            <th><i class="fas fa-phone"></i> Telefono</th>
                            <th><i class="fas fa-graduation-cap"></i> Grado</th>
                            <th><i class="fas fa-user-shield"></i> Apoderado</th>
                            <th><i class="fas fa-phone"></i> Telefono</th>
                            <th><i class="fas fa-calendar-alt"></i> Fecha</th>
                        </tr>           
                    </thead>
                    <tbody>             
                        <% for (DatoBean objeto : lista) {%>  
                        <tr class="text-primary">  
                            <td>MT00<%=objeto.getBDDATOMatricula()%></td>
                            <td><img src="<%=request.getContextPath()%>/Imagen/Personas/<%=objeto.getBDDATO4()%>"style="width: 30px; height: 30px;"/></td>
                            <td><%=objeto.getBDDATO1()%> <%=objeto.getBDDATO2()%> <%=objeto.getBDDATO3()%></td>          
                            <td><%=objeto.getBDDATO5()%></td>        
                            <td><%=objeto.getBDDATO6()%></td>        
                            <td><%=objeto.getBDDATO7()%></td>        
                            <td><%=objeto.getBDDATO8()%>, <%=objeto.getBDDATO9()%></td>        
                            <td><%=objeto.getBDDATO10()%></td>        
                            <td><%=objeto.getBDDATO11()%></td>     
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