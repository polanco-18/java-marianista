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
            <th><i class="fas fa-creative-commons-nc"></i> </th>
            <th colspan="2"><i class="fas fa-user"></i> Estudiante</th> 
            <th><i class="fas fa-user-graduate"></i> Grado</th> 
            <th><i class="fas fa-info-circle"></i> Detalle</th> 
            <th><i class="fas fa-dollar-sign"></i> Monto</th> 
            <th><i class="fas fa-times"></i> Mora</th> 
            <th><i class="fas fa-calendar"></i> Fecha Creada</th> 
            <th><i class="fas fa-calendar-times"></i> Vencimiento</th> 
            <th><i class="fas fa-hand-holding-usd"></i> Estado</th> 
        </tr>           
    </thead>
    <tbody>             
        <%
            for (DatoBean objeto : lista) {
        %>      <tr class="text-primary" >    
            <td>PG<%=objeto.getBDDATOPago()%></td>                                            
            <td><img src="<%=request.getContextPath()%>/Imagen/Personas/<%=objeto.getBDDATO1()%>"style="width: 30px; height: 30px;"/></td>                                            
            <td><%=objeto.getBDDATO2()%> <%=objeto.getBDDATO3()%> <%=objeto.getBDDATO4()%></td>      
            <td><%=objeto.getBDDATO5()%></td>                                                           
            <td><%=objeto.getBDDATO6()%></td>                                                           
            <td>S/.<%=objeto.getBDDATO7()%></td>                                                           
            <td>S/.<%=objeto.getBDDATO8()%></td>                                                           
            <td><%=objeto.getBDDATO10()%></td>                                                           
            <td><%=objeto.getBDDATO9()%></td>                                                           
            <% if (objeto.getBDDATO11().equals("Cancelado")) {%><td class="text-success"><%=objeto.getBDDATO11()%></td><%}%>                                                           
            <% if (!objeto.getBDDATO11().equals("Cancelado")) {%><td class="text-warning"><%=objeto.getBDDATO11()%></td><%}%>                                                           
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