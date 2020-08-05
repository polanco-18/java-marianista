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
<input type="hidden" name="codigoS">
<input type="hidden" name="codigoSA">
<input type="hidden"  name="D1">
<input type="hidden"  name="D2">
<input type="hidden"  name="D3">
<input type="hidden"  name="D4">
<input type="hidden"  name="D5">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card">
    <div class="card-header">
        <h3 class="text-primary"><b><i class="fas fa-align-right"></i> Gestion Secciones </b></h3>
    </div>
    <div class="card-body">
        <br>    
        <input type="hidden" name="opcion" class="form-control">
        <div class="row">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-primary" onclick="CambiodePagina('<%=request.getContextPath()%>', 'SeccionServlet', 2)" title="Nuevo "><i class="fas fa-plus-circle"></i> Crear Seccion</button>
            </div>
            <div class="col-md-4">
            </div>
            <div class="col-md-6">
                <div class="input-group">
                    <select class="form-control text-primary" onclick="BuscarR('<%=request.getContextPath()%>', 'SeccionServlet', 1)"  id="txt1">
                        <option value="0">Selecione un Grado</option>
                        <option value="1">Inicial</option>
                        <option value="2">Primaria</option>
                        <option value="3">Secundaria</option>
                    </select>                        
                </div>
            </div>
        </div>
        <br>
        <% if (request.getAttribute("Mensaje") != null) {%>  
        <div class="alert alert-primary alert-dismissible fade show text-primary" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong><%=(String) request.getAttribute("Mensaje")%></strong>
        </div>  
        <br>
        <% }%> 
        <div class="table-responsive">
            <div id="BuscarR">
                <table class="table table-hover" style="background-color: white">
                    <thead>        
                        <tr class="text-light" style="background-image:url('Imagen/FondoM.jpg')">      
                            <th><i class="fas fa-id-card-alt"></i> </th>
                            <th><i class="fas fa-graduation-cap"></i> Grado </th>
                            <th><i class="fas fa-flag"></i> Pais </th> 
                            <th><i class="fas fa-male"></i> Foro Actual</th>
                            <th><i class="fas fa-list-ol"></i> S. Numero</th> 
                            <th><i class="fas fa-building"></i> Edificio</th> 
                            <th><i class="fas fa-male"></i> Foro</th> 
                            <th><i class="fas fa-chalkboard-teacher"></i> Docente</th>                             
                        </tr>           
                    </thead>
                    <tbody>      
                        <%
                            for (DatoBean objeto : lista) {
                        %>      <tr class="text-primary" title="Modificar" onclick="ModificarSeccion('<%=request.getContextPath()%>',
                                        'SeccionServlet', 4,
                                        '<%=objeto.getBDDATOSeccion()%>',
                                        '<%=objeto.getBDDATOSalon()%>',
                                        '<%=objeto.getBDDATO1()%>',
                                        '<%=objeto.getBDDATO2()%>',
                                        '<%=objeto.getBDDATO4()%>',
                                        '<%=objeto.getBDDATO5()%>',
                                        '<%=objeto.getBDDATO6()%>',
                                        '<%=objeto.getBDDATO7()%>')" >    
                            <td>SS00<%=objeto.getBDDATOSeccion()%></td>                           
                            <td><%=objeto.getBDDATO1()%></td>                               
                            <td><%=objeto.getBDDATO2()%></td>                               
                            <td><%=objeto.getBDDATO3()%></td>                         
                            <td><%=objeto.getBDDATO4()%></td>                         
                            <td><%=objeto.getBDDATO5()%></td>                         
                            <td><%=objeto.getBDDATO6()%></td>                         
                            <% if (objeto.getBDDATO7().equals("Sin docente")) {%>                               
                            <td class="text-danger"><%=objeto.getBDDATO7()%></td>
                            <%  }
                                if (!objeto.getBDDATO7().equals("Sin docente")) {%>
                            <td> Con Docente </td><%} %>                                                       
                        </tr>
                        <% }%>                              
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>
<br>
<br>