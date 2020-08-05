<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Bean.DatoBean"%>
<%!
    String codigo, codigoCurso, D1, D2;
%>
<%!
    ArrayList<DatoBean> lista = null;
    int i;
%>
<%
    lista = (ArrayList<DatoBean>) request.getAttribute("Listar");
%>  
<%
    codigo = (String) request.getAttribute("codigoDocente");
    codigoCurso = (String) request.getAttribute("codigoCurso");
    D1 = (String) request.getAttribute("D1");
    D2 = (String) request.getAttribute("D2");
%>
<input type="hidden"  name="op">    
<input type="hidden"  name="codigo" id="codigo" value="<%=codigoCurso%>">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card">
    <div class="card-header">
        <h3 class="text-primary"><b><i class="fas fa-edit"></i>  Modificando Curso <%=D1%></b></h3>
    </div>
    <div class="card-body text-primary">
        <br>
        <div class="form-row">
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-list-alt"></i> Nombre </label>
                <input type="text" id="txt1" value="<%=D1%>"  class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <label for="Nombre" class="col control-label"><i class="fas fa-info-circle"></i> Detalle </label>
                <input type="text" id="txt2" value="<%=D2%>"    class="form-control"  required="required">
            </div>   
            <div class="form-group col">
                <% if (codigo.equals("Sin Docente")) {%>                               
                <label for="codigo" class="col form-label text-danger"><i class="fas fa-user"></i> Seleccione Docente a Dictar Curso </label>
                <option class="text-danger">Seleccion un docente</option>
                    
                <%  }
                    if (!codigo.equals("Sin Docente")) {%>
                <label for="codigo" class="col form-label"><i class="fas fa-user"></i> Docente Actual</label>
                <%}%>
                <select class="form-control" id="txt3">
                    <%    for (DatoBean objeto : lista) {%>
                    <option value="<%=objeto.getBDDATODocente()%>" class="text-primary"><%=objeto.getBDDATO1()%> <%=objeto.getBDDATO2()%></option> 
                    <% }%> 
                </select>
            </div>   
        </div>
    </div>
    <div class="card-footer">
        <div class="form-row text-center ">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-warning" onclick="CambiodePagina('<%=request.getContextPath()%>', 'CursoServlet', 0)" ><i class="fas fa-long-arrow-alt-left"></i> Regresar</button>
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-success" onclick="ActualizarCurso('<%=request.getContextPath()%>', 'CursoServlet', 5)" ><i class="far fa-save"></i> Modificar</button>
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-danger"  onclick="Eliminar('<%=request.getContextPath()%>', 'CursoServlet', 6)" ><i class="fas fa-trash-alt"></i> Eliminar</button>
            </div>
        </div>
    </div>	       	       
</div>	       	       
<br>
<br>