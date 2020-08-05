<%@page    import="java.util.ArrayList"  %>
<%@page    import="Modelo.Bean.DatoBean"  %>
<%!
    ArrayList<DatoBean> lista = null;
    int i;
%>
<%
    lista = (ArrayList<DatoBean>) request.getAttribute("Horario");
%>  
<input type="hidden"  name="op"> 
<input type="hidden"  name="codigo"> 
<input type="hidden"  name="txt1"> 
<%--- ---------------------------------------------------------------------------  ---%>
<% if (request.getAttribute("Mensaje") != null) {%>  
<div class="alert alert-primary alert-dismissible fade show text-primary" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    <strong><%=(String) request.getAttribute("Mensaje")%></strong>
</div>  
<br>
<% }%> 
<div class="card">
    <div class="card-header">
        <h3 class="text-primary"><b><i class="fas fa-calendar"></i> Horario</b></h3>
    </div>
    <div class="card-body">
        <br>
        <div class="table-responsive">
            <table class="table table-hover" style="background-color: white">
                <thead>        
                    <tr class="text-light" style="background-image:url('Imagen/FondoM.jpg')">     
                        <th><i class="fas fa-book"></i> Curso</th> 
                        <th><i class="fas fa-graduation-cap"></i> Docente</th> 
                        <th><i class="fas fa-calendar"></i> Dia</th> 
                        <th><i class="fas fa-calendar"></i> Hora</th> 
                        <th style="width: 100px;"><i class="fas fa-edit"></i> Quitar</th> 
                    </tr>           
                </thead>
                <tbody>             
                    <%
                        for (DatoBean objeto : lista) {
                    %>      
                    <tr class="text-primary">                                                
                        <td>SA<%=objeto.getBDDATOHorario()%> - <%=objeto.getBDDATO5()%></td>                                   
                        <td><img src="<%=request.getContextPath()%>/Imagen/Personas/<%=objeto.getBDDATO1()%>"style="width: 30px; height: 30px;"/> <%=objeto.getBDDATO2()%> <%=objeto.getBDDATO3()%> <%=objeto.getBDDATO4()%></td>      
                        <% if (objeto.getBDDATO6().equals("1")) {%><td>Lunes</td>                                                           
                        <% }
                            if (objeto.getBDDATO6().equals("2")) {%><td>Martes</td>                                                           
                        <% }
                            if (objeto.getBDDATO6().equals("3")) {%><td>Miercoles</td>                                                           
                        <% }
                            if (objeto.getBDDATO6().equals("4")) {%><td>Jueves</td>                                                           
                        <% }
                            if (objeto.getBDDATO6().equals("5")) {%><td>Viernes</td>                                                           
                        <% }
                            if (objeto.getBDDATO6().equals("6")) {%><td>Sabado</td>                                                           
                        <% }
                            if (objeto.getBDDATO6().equals("7")) {%><td>Domingo</td>                                                           
                        <% }%>
                        <td>- Inicio : <%=objeto.getBDDATO7()%> - Fin : <%=objeto.getBDDATO8()%></td>                                                           
                        <td><button class="btn btn-outline-danger" onclick="EliminarSeccion('<%=request.getContextPath()%>', 'HorarioServlet', 5, '<%=objeto.getBDDATOHorario()%>', '<%=objeto.getBDDATO8()%>')" ><i class="fas fa-trash-alt"></i></button></td>                                                           
                    </tr>
                    <% }%>                              
                </tbody>
            </table>
        </div>    
    </div>    
</div>    
<br>