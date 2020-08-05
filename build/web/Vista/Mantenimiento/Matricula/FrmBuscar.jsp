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
<% if (request.getAttribute("Mensaje") != null) {%>  
<div class="alert alert-dark alert-dismissible fade show text-primary" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    <strong><%=(String) request.getAttribute("Mensaje")%></strong>
</div>  
<br>
<% }%> 