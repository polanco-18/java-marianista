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
        <h3 class="text-primary"><b><i class="fas fa-door-open"></i> Horario Actual</b></h3>
    </div>
    <div class="card-body">
        <br>            
        <div class="table-responsive">
            <div id="BuscarR">
                <table class="table table-hover" style="background-color: white">
                    <thead>        
                        <tr class="text-light" style="background-image:url('Imagen/FondoM.jpg')">      
                            <th><i class="fas fa-id-card-alt"></i> </th>
                            <th><i class="fas fa-list-ol"></i> Grado</th> 
                            <th><i class="fas fa-flag"></i> Pais</th> 
                            <th><i class="fas fa-user-graduate"></i> Docente</th>  
                            <th><i class="fas fa-building"></i> Salon</th> 
                            <th><i class="fas fa-book"></i> Curso</th> 
                            <th><i class="fas fa-calendar"></i> Dia</th> 
                            <th><i class="fas fa-clock"></i> Inicio - Fin</th> 
                        </tr>           
                    </thead>
                    <tbody>             
                        <%
                            for (DatoBean obj : lista) {
                        %>      <tr class="text-primary">    
                            <td>SA<%=obj.getBDDATOHorario()%></td>                                            
                            <td><%=obj.getBDDATO1()%></td>      
                            <td><%=obj.getBDDATO2()%></td>                               
                            <td><img src="<%=request.getContextPath()%>/Imagen/Personas/<%=obj.getBDDATO3()%>"style="width: 30px; height: 30px;"/>  <%=obj.getBDDATO4()%> <%=obj.getBDDATO5()%> </td>                                                           
                            <td><%=obj.getBDDATO6()%> - <%=obj.getBDDATO7()%></td>  
                            <td><%=obj.getBDDATO8()%> </td>       
                            <% if (obj.getBDDATO9().equals("1")) {%><td>Lunes</td>                                                           
                            <% }
                                if (obj.getBDDATO9().equals("2")) {%><td>Martes</td>                                                           
                            <% }
                                if (obj.getBDDATO9().equals("3")) {%><td>Miercoles</td>                                                           
                            <% }
                                if (obj.getBDDATO9().equals("4")) {%><td>Jueves</td>                                                           
                            <% }
                                if (obj.getBDDATO9().equals("5")) {%><td>Viernes</td>                                                           
                            <% }
                                if (obj.getBDDATO9().equals("6")) {%><td>Sabado</td>                                                           
                            <% }
                                if (obj.getBDDATO9().equals("7")) {%><td>Domingo</td>                                                           
                            <% }%>      
                            <td><%=obj.getBDDATO10()%> - <%=obj.getBDDATO11()%></td>
                        </tr>
                        <% }%>                              
                    </tbody>
                </table>
            </div>    
        </div>    
    </div>    
</div>    
<br>