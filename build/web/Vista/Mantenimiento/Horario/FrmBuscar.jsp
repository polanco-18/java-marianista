<%@page    import="java.util.ArrayList"  %>
<%@page    import="Modelo.Bean.DatoBean"  %>
<%!
    ArrayList<DatoBean> lista = null;
    int i;
%>
<%
    lista = (ArrayList<DatoBean>) request.getAttribute("Listar");
%>  
<table class="table table-hover" style="background-color: white">
    <thead>        
        <tr class="text-light" style="background-image:url('Imagen/FondoM.jpg')">      
            <th><i class="fas fa-id-card-alt"></i> </th>
            <th><i class="fas fa-list-ol"></i> Grado</th> 
            <th><i class="fas fa-flag"></i> Pais</th> 
            <th><i class="fas fa-male"></i> Foro Actual</th> 
            <th><i class="fas fa-building"></i> Salon</th> 
            <th><i class="fas fa-male"></i> Foro</th> 
            <th><i class="fas fa-user-graduate"></i> Docente</th> 
            <th><i class="fas fa-envelope"></i> Correo</th> 
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
            <td><%=obj.getBDDATO3()%></td>                                                           
            <td><%=obj.getBDDATO4()%> <%=obj.getBDDATO5()%> </td>                                                           
            <td><%=obj.getBDDATO6()%> </td>                                                           
            <td><img src="<%=request.getContextPath()%>/Imagen/Personas/<%=obj.getBDDATO7()%>"style="width: 30px; height: 30px;"/>  <%=obj.getBDDATO8()%> <%=obj.getBDDATO9()%> <%=obj.getBDDATO10()%> </td>                                                           
            <td><%=obj.getBDDATO11()%> </td>       
            <td><%=obj.getBDDATO12()%> </td>       
            <% if (obj.getBDDATO13().equals("1")) {%><td>Lunes</td>                                                           
            <% }
                if (obj.getBDDATO13().equals("2")) {%><td>Martes</td>                                                           
            <% }
                if (obj.getBDDATO13().equals("3")) {%><td>Miercoles</td>                                                           
            <% }
                if (obj.getBDDATO13().equals("4")) {%><td>Jueves</td>                                                           
            <% }
                if (obj.getBDDATO13().equals("5")) {%><td>Viernes</td>                                                           
            <% }
                if (obj.getBDDATO13().equals("6")) {%><td>Sabado</td>                                                           
            <% }
                if (obj.getBDDATO13().equals("7")) {%><td>Domingo</td>                                                           
            <% }%>      
            <td><%=obj.getBDDATO14()%> - <%=obj.getBDDATO15()%></td>       
        </tr>
        <% }%>                              
    </tbody>
</table>
<% if (request.getAttribute("Mensaje") != null) {%>  
<div class="alert alert-primary alert-dismissible fade show text-primary" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    <strong><%=(String) request.getAttribute("Mensaje")%></strong>
</div>  
<br>
<% }%> 