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
<input type="hidden"  name="codigoCurso">
<input type="hidden" name="codigoDocente">
<input type="hidden"  name="D1">
<input type="hidden"  name="D2">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card">
    <div class="card-header">
        <h3 class="text-primary"><b><i class="fas fa-door-open"></i> Gestion de Salones</b></h3>
    </div>
    <div class="card-body">
        <br>    
        <div class="row">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-primary" onclick="CambiodePagina('<%=request.getContextPath()%>', 'SalonServlet', 2)" title="Nuevo "><i class="fas fa-plus-circle"></i> Crear Salon</button>
            </div>
            <div class="col-md-4">
            </div>
            <div class="col-md-6">
                <div class="input-group">
                    <input type="search" id="txt1"class="form-control" placeholder="Buscar" onkeyup="BuscarR('<%=request.getContextPath()%>', 'SalonServlet', 1)">      
                    <div class="input-group-prepend">
                        <div class="input-group-text"><i class="fas fa-search"></i></div>
                    </div>                  
                </div>
            </div>
        </div>
        <br>
        <% if (request.getAttribute("mensaje") != null) {%>  
        <div class="alert alert-dark alert-dismissible fade show text-primary" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong><%=(String) request.getAttribute("mensaje")%></strong>
        </div>  
        <br>
        <% }%>  
        <div class="table-responsive">
            <div id="BuscarR">
                <table class="table table-hover" style="background-color: white">
                    <thead>        
                        <tr class="text-light" style="background-image:url('Imagen/FondoM.jpg')">      
                            <th><i class="fas fa-id-card-alt"></i> </th>
                            <th><i class="fas fa-list-ol"></i> Numero</th> 
                            <th><i class="fas fa-building"></i> Edificio</th> 
                            <th><i class="fas fa-male"></i> Foro</th> 
                        </tr>           
                    </thead>
                    <tbody>             
                        <%
                            for (DatoBean objeto : lista) {
                        %>      <tr class="text-primary" title="Modificar" onclick="ModificarSalon('<%=request.getContextPath()%>',
                                        'SalonServlet', 4,
                                        '<%=objeto.getBDDATOSalon()%>',
                                        '<%=objeto.getBDDATO1()%>',
                                        '<%=objeto.getBDDATO2()%>',
                                        '<%=objeto.getBDDATO3()%>')" >    
                            <td>SA<%=objeto.getBDDATOSalon()%></td>                                            
                            <td><%=objeto.getBDDATO1()%></td>      
                            <td><%=objeto.getBDDATO2()%></td>                               
                            <td><%=objeto.getBDDATO3()%></td>                                                           
                        </tr>
                        <% }%>                              
                    </tbody>
                </table>
            </div>    
        </div>    
    </div>    
</div>    
<br>