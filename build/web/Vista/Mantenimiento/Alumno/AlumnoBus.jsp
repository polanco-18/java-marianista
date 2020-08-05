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
        <tr class="text-light"  style="background-image:url('Imagen/FondoM.jpg')">      
            <th><i class="fas fa-camera"></i> </th>
            <th colspan="2"><i class="fas fa-address-card"></i>  Nombre y Apellidos</th>
            <th><i class="fas fa-birthday-cake"></i> Edad</th>
            <th><i class="fas fa-phone"></i> Telefono</th>
            <th><i class="fas fa-envelope"></i> Correo</th>
        </tr>           
    </thead>
    <tbody>      
        <% for (DatoBean objeto : lista) {%>  
        <tr class="text-primary">  
            <td><img src="<%=request.getContextPath()%>/Imagen/Personas/<%=objeto.getBDDATO6()%>"style="width: 30px; height: 30px;"/></td>
            <td>AL00<%=objeto.getBDDATOAlumno()%></td>                            
            <td><%=objeto.getBDDATO1()%> <%=objeto.getBDDATO2()%> <%=objeto.getBDDATO3()%></td>    
            <td><%=objeto.getBDDATO4()%></td>        
            <td><%=objeto.getBDDATO5()%></td>        
            <td><a target="_blank" href="javascript:window.open('https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin','','width=450,height=450,left=450,top=120,toolbar=no');"><%=objeto.getBDDATO7()%></a></td>       
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