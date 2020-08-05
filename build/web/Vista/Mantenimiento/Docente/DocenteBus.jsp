<%@page    import="java.util.ArrayList"  %>
<%@page    import="Modelo.Bean.DatoBean"  %>
<%!
    ArrayList<DatoBean> lista = null;
    int i;
%>
<%
    lista = (ArrayList<DatoBean>) request.getAttribute("Listar");
%>  
<%--- ---------------------------------------------------------------------------  ---%>
<table class="table table-hover" style="background-color: white">
    <thead>        
        <tr class="text-light" style="background-image:url('Imagen/FondoM.jpg')">      
            <th><i class="fas fa-id-card-alt"></i> </th>
            <th><i class="fas fa-camera"></i> </th>
            <th><i class="fas fa-address-card"></i> Nombre y Apellidos</th> 
            <th><i class="fas fa-envelope"></i> Correo</th> 
            <th><i class="fas fa-phone"></i> Telefono</th> 
        </tr>           
    </thead>
    <tbody>             
        <%
            for (DatoBean objeto : lista) {
        %>      <tr class="text-primary" >    
            <td>DO00<%=objeto.getBDDATODocente()%></td>                               
            <td><img src="<%=request.getContextPath()%>/Imagen/Personas/<%=objeto.getBDDATO1()%>"style="width: 30px; height: 30px;"/></td>
            <td><%=objeto.getBDDATO2()%> <%=objeto.getBDDATO3()%> <%=objeto.getBDDATO4()%> </td>                                                 
            <td><%=objeto.getBDDATO5()%></td>                                                 
            <td><%=objeto.getBDDATO6()%></td>                                                 
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