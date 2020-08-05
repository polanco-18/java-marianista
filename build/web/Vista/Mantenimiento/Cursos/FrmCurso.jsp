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
<input type="hidden"  name="codigoCurso">
<input type="hidden" name="codigoDocente">
<input type="hidden"  name="D1">
<input type="hidden"  name="D2">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card">
    <div class="card-header">
        <h3 class="text-primary"><b><i class="fas fa-list-alt"></i> Gestion de Cursos</b></h3>
    </div>
    <div class="card-body">
        <br>    
        <input type="hidden" name="opcion" class="form-control">
        <div class="row">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-primary" onclick="CambiodePagina('<%=request.getContextPath()%>', 'CursoServlet', 2)" title="Nuevo "><i class="fas fa-plus-circle"></i> Crear Curso</button>
            </div>
            <div class="col-md-4">
            </div>
            <div class="col-md-6">
                <div class="input-group">
                    <input type="search" id="txt1"class="form-control" placeholder="Buscar" onkeyup="BuscarR('<%=request.getContextPath()%>', 'CursoServlet', 1)">      
                    <div class="input-group-prepend">
                        <div class="input-group-text"><i class="fas fa-search"></i></div>
                    </div>                  
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
                            <td class="text-danger"><%=objeto.getBDDATO1()%></td>
                            <%  }
                                if (!objeto.getBDDATO1().equals("Sin Docente")) {%>
                            <td> Con Docente </td><%}%>                               
                            <td><%=objeto.getBDDATO2()%></td>                               
                            <td><%=objeto.getBDDATO3()%></td>                               

                        </tr>
                        <% }%>                              
                    </tbody>
                </table>
            </div>    
        </div>    
    </div>    
</div>    
<br>
<br>