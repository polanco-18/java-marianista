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
            <th><i class="fas fa-address-card"></i> Docente</th> 
            <th><i class="fas fa-list-alt"></i> Curso</th> 
            <th><i class="fas fa-info"></i> Detalle</th> 
        </tr>           
    </thead>
    <tbody>             
        <%
            for (DatoBean objeto : lista) {
        %>      <tr class="text-primary" title="Modificar" onclick="ModificarCur('<%=request.getContextPath()%>',
                        'CursoServlet', 4,
                        '<%=objeto.getBDDATOCurso()%>',
                        '<%=objeto.getBDDATO1()%>',
                        '<%=objeto.getBDDATO2()%>',
                        '<%=objeto.getBDDATO3()%>')" >    
            <td>CU00<%=objeto.getBDDATOCurso()%></td>                               
            <% if (objeto.getBDDATO1().equals("Sin Docente")) {%>                               
            <td><%=objeto.getBDDATO1()%></td>
            <%  }
                if (!objeto.getBDDATO1().equals("Sin Docente")) {%>
            <td> Con Docente </td><%}%>                               
            <td><%=objeto.getBDDATO2()%></td>                               
            <td><%=objeto.getBDDATO3()%></td>                               

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