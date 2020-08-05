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
<input type="hidden"  name="D1">
<input type="hidden"  name="D2">
<input type="hidden"  name="D3">
<input type="hidden"  name="D4">
<input type="hidden"  name="D5">
<input type="hidden"  name="D6">
<input type="hidden"  name="D7">
<input type="hidden"  name="D8">
<input type="hidden"  name="D9">
<input type="hidden"  name="D10">
<input type="hidden"  name="D11">
<input type="hidden"  name="D12">
<input type="hidden"  name="D13">
<input type="hidden"  name="D14">
<input type="hidden"  name="D15">

<table class="table table-hover" style="background-color: white">
    <thead>        
        <tr class=" text-light" style="background-image:url('Imagen/FondoM.jpg')">      
            <th><i class="fas fa-id-card-alt"></i> </th>
            <th><i class="fas fa-camera"></i> </th> 
            <th><i class="fas fa-address-card"></i> Nombre y Apellidos</th> 
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
        </tr>           
    </thead>
    <tbody>             
        <%
            for (DatoBean objeto : lista) {
        %>      <tr class="text-primary" title="Modificar"  onclick="ModificarPersona('<%=request.getContextPath()%>',
                        'PersonaServlet', 4,
                        '<%=objeto.getBDDATOPersona()%>',
                        '<%=objeto.getBDDATO1()%>',
                        '<%=objeto.getBDDATO2()%>',
                        '<%=objeto.getBDDATO3()%>',
                        '<%=objeto.getBDDATO4()%>',
                        '<%=objeto.getBDDATO5()%>',
                        '<%=objeto.getBDDATO6()%>',
                        '<%=objeto.getBDDATO7()%>',
                        '<%=objeto.getBDDATO8()%>',
                        '<%=objeto.getBDDATO9()%>',
                        '<%=objeto.getBDDATO10()%>',
                        '<%=objeto.getBDDATO11()%>',
                        '<%=objeto.getBDDATO12()%>',
                        '<%=objeto.getBDDATO13()%>',
                        '<%=objeto.getBDDATO14()%>',
                        '<%=objeto.getBDDATO15()%>')" >    
            <td>PE00<%=objeto.getBDDATOPersona()%></td>                               
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