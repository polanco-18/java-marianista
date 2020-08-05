<%@page    import="java.util.ArrayList"  %>
<%@page    import="Modelo.Bean.DatoBean"  %>
<%!
    String codigo, codigoD, D1, D2, D4, D3, D5, D6;
%>
<%
    codigo = (String) request.getAttribute("codigoS");
    codigoD = (String) request.getAttribute("codigoDO");
    D1 = (String) request.getAttribute("D1");
    D2 = (String) request.getAttribute("D2");
    D3 = (String) request.getAttribute("D3");
    D4 = (String) request.getAttribute("D4");
    D5 = (String) request.getAttribute("D5");
    D6 = (String) request.getAttribute("D6");
%>
<%!
    ArrayList<DatoBean> lista = null;
    ArrayList<DatoBean> lista2 = null;
    int i;
%>
<%
    lista = (ArrayList<DatoBean>) request.getAttribute("ListarSA");
    lista2 = (ArrayList<DatoBean>) request.getAttribute("ListarDO");
%>  
<input type="hidden"  name="op">    
<input type="hidden"  name="codigo" id="codigo" value="<%=codigo%>">
<%--- ---------------------------------------------------------------------------  ---%>
<div class="card">
    <div class="card-header">
        <h3 class="text-primary"><b><i class="fas fa-edit"></i> Modificando Seccion <%=D1%> <%=D2%></b></h3>
    </div>
    <div class="card-body text-primary">
        <br>    
        <div class="form-row">            
            <div class="form-group col">
                <label for="codigo" class="col form-label"><i class="fas fa-graduation-cap"></i> Grado </label>
                <select class="form-control text-primary" id="txt1">
                    <option><%=D1%></option>
                    <option> -- Otros Grados -- </option>
                    <option value="3 a�o de Inicial">3 a�o de Inicial</option>
                    <option value="4 a�o de Inicial">4 a�o de Inicial</option>
                    <option value="5 a�o de Inicial">5 a�o de Inicial</option>
                    <option value="Primero de Primaria">Primero de Primaria</option>
                    <option value="Segundo de Primaria">Segundo de Primaria</option>
                    <option value="Tercero de Primaria">Tercero de Primaria</option>
                    <option value="Cuarto de Primaria">Cuarto de Primaria</option>
                    <option value="Quinto de Primaria">Quinto de Primaria</option>
                    <option value="Sexto de Primaria">Sexto de Primaria</option>
                    <option value="Primero de Secundaria">Primero de Secundaria</option>
                    <option value="Segundo de Secundaria">Segundo de Secundaria</option>
                    <option value="Tercero de Secundaria">Tercero de Secundaria</option>
                    <option value="Cuarto de Secundaria">Cuarto de Secundaria</option>
                    <option value="Quinto de Secundaria">Quinto de Secundaria</option>
                </select>
            </div>               
            <div class="form-group col-md-2">
                <label for="codigo" class="col form-label"><i class="fas fa-flag"></i> Pais </label>
                <select class="form-control text-primary" id="txt2">
                    <option> <%=D2%> </option>
                    <option> -- Otros Paises -- </option>
                    <option value="Alemania">Alemania</option>
                    <option value="Angola">Angola</option>
                    <option value="Arabia Saudita">Arabia Saudita</option>
                    <option value="Argentina">Argentina</option>
                    <option value="Australia">Australia</option>
                    <option value="Austria">Austria</option>
                    <option value="Bahamas">Bahamas</option>
                    <option value="Barbados">Barbados</option>
                    <option value="B�lgica">B�lgica</option>
                    <option value="Belice">Belice</option>
                    <option value="Bolivia">Bolivia</option>
                    <option value="Brasil">Brasil</option>
                    <option value="Bulgaria">Bulgaria</option>
                    <option value="But�n">But�n</option>
                    <option value="Cabo Verde">Cabo Verde</option>
                    <option value="Camboya">Camboya</option>
                    <option value="Camer�n">Camer�n</option>
                    <option value="Canad�">Canad�</option>
                    <option value="Catar">Catar</option>
                    <option value="Chile">Chile</option>
                    <option value="China">China</option>
                    <option value="Colombia">Colombia</option>
                    <option value="Corea del Norte">Corea del Norte</option>
                    <option value="Corea del Sur">Corea del Sur</option>
                    <option value="Costa de Marfil">Costa de Marfil</option>
                    <option value="Costa Rica">Costa Rica</option>
                    <option value="Croacia">Croacia</option>
                    <option value="Cuba">Cuba</option>
                    <option value="Dinamarca">Dinamarca</option>
                    <option value="Dominica">Dominica</option>
                    <option value="Ecuador">Ecuador</option>
                    <option value="Egipto">Egipto</option>
                    <option value="El Salvador">El Salvador</option>
                    <option value="Emiratos Arabes Unidos">Emiratos Arabes Unidos</option>
                    <option value="Eslovaquia">Eslovaquia</option>
                    <option value="Eslovenia">Eslovenia</option>
                    <option value="Espa�a">Espa�a</option>
                    <option value="Estados Unidos">Estados Unidos</option>
                    <option value="Estonia">Estonia</option>
                    <option value="Filipinas">Filipinas</option>
                    <option value="Finlandia">Finlandia</option>
                    <option value="Francia">Francia</option>
                    <option value="Georgia">Georgia</option>
                    <option value="Ghana">Ghana</option>
                    <option value="Grecia">Grecia</option>
                    <option value="Guatemala">Guatemala</option>
                    <option value="Guyana">Guyana</option>
                    <option value="Haiti">Haiti</option>
                    <option value="Honduras">Honduras</option>
                    <option value="Hungr�a">Hungr�a</option>
                    <option value="India">India</option>
                    <option value="Indonesia">Indonesia</option>
                    <option value="Irak">Irak</option>
                    <option value="Iran">Iran</option>
                    <option value="Irlanda">Irlanda</option>
                    <option value="Islandia">Islandia</option>
                    <option value="Islas Marshall">Islas Marshall</option>
                    <option value="Islas Salomon">Islas Salomon</option>
                    <option value="Israel">Israel</option>
                    <option value="Italia">Italia</option>
                    <option value="Jamaica">Jamaica</option>
                    <option value="Japon">Japon</option>
                    <option value="Jordania">Jordania</option>
                    <option value="Kenia">Kenia</option>
                    <option value="Liberia">Liberia</option>
                    <option value="Libia">Libia</option>
                    <option value="Liechtenstein">Liechtenstein</option>
                    <option value="Lituania">Lituania</option>
                    <option value="Luxemburgo">Luxemburgo</option>
                    <option value="Madagascar">Madagascar</option>
                    <option value="Malasia">Malasia</option>
                    <option value="Marruecos">Marruecos</option>
                    <option value="Mauricio">Mauricio</option>
                    <option value="M�xico">M�xico</option>
                    <option value="Micronesia">Micronesia</option>
                    <option value="Moldavia">Moldavia</option>
                    <option value="M�naco">M�naco</option>
                    <option value="Mongolia">Mongolia</option>
                    <option value="Montenegro">Montenegro</option>
                    <option value="Mozambique">Mozambique</option>
                    <option value="Nepal">Nepal</option>
                    <option value="Nicaragua">Nicaragua</option>
                    <option value="Noruega">Noruega</option>
                    <option value="Nueva Zelanda">Nueva Zelanda</option>
                    <option value="Pa�ses Bajos">Pa�ses Bajos</option>
                    <option value="Panam�">Panam�</option>
                    <option value="Paraguay">Paraguay</option>
                    <option value="Per�">Per�</option>
                    <option value="Polonia">Polonia</option>
                    <option value="Portugal">Portugal</option>
                    <option value="Reino Unido">Reino Unido</option>
                    <option value="Rep�blica Centroafricana">Rep�blica Centroafricana</option>
                    <option value="Rep�blica Checa">Rep�blica Checa</option>
                    <option value="Rep�blica de Macedonia">Rep�blica de Macedonia</option>
                    <option value="Rep�blica del Congo">Rep�blica del Congo</option>
                    <option value="Rep�blica Dominicana">Rep�blica Dominicana</option>
                    <option value="Rep�blica Sudafricana">Rep�blica Sudafricana</option>
                    <option value="Ruman�a">Ruman�a</option>
                    <option value="Rusia">Rusia</option>
                    <option value="Santa Luc�a">Santa Luc�a</option>
                    <option value="Senegal">Senegal</option>
                    <option value="Serbia">Serbia</option>
                    <option value="Singapur">Singapur</option>
                    <option value="Siria">Siria</option>
                    <option value="Suecia">Suecia</option>
                    <option value="Suiza">Suiza</option>
                    <option value="Tailandia">Tailandia</option>
                    <option value="Trinidad y Tobago">Trinidad y Tobago</option>
                    <option value="T�nez">T�nez</option>
                    <option value="Turqu�a">Turqu�a</option>
                    <option value="Ucrania">Ucrania</option>
                    <option value="Uruguay">Uruguay</option>
                    <option value="Venezuela">Venezuela</option>
                    <option value="Vietnam">Vietnam</option>
                </select>
            </div>   
            <div class="form-group col"> 
                <label for="codigo" class="col form-label"><i class="fas fa-user"></i> Seleccione Salon</label>
                <select class="form-control text-primary" id="txt3">
                    <option value="<%=D6%>" class="text-primary"><%=D3%> - <%=D4%> - <%=D5%></option> 
                    <option value="" class="text-danger">-- Otros Salones --</option> 
                    <%    for (DatoBean objeto : lista) {%>
                    <option value="<%=objeto.getBDDATOSalon()%>"><%=objeto.getBDDATO1()%> - <%=objeto.getBDDATO2()%> - <%=objeto.getBDDATO3()%></option> 
                    <% }%> 
                </select>
            </div>   
            <div class="form-group col"> 
                <label for="codigo" class="col form-label"><i class="fas fa-user"></i> Seleccione Tutor de Salon</label>
                <select class="form-control" id="txt4">
                    <%if (codigoD.equals("Sin docente")) {%>
                    <option value="" class="text-danger"> Seleccione un Docente</option> 
                    <% }
                        for (DatoBean objeto : lista2) {%>
                    <option value="<%=objeto.getBDDATODocente()%>"><%=objeto.getBDDATO1()%> <%=objeto.getBDDATO2()%></option> 
                    <% }%> 
                </select>
            </div>   
        </div>    
    </div>    
    <div class="card-footer">
        <div class="form-row text-center ">
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-warning" onclick="CambiodePagina('<%=request.getContextPath()%>', 'SeccionServlet', 0)" ><i class="fas fa-long-arrow-alt-left"></i> Regresar</button>
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-success" onclick="ActualizarSeccion('<%=request.getContextPath()%>', 'SeccionServlet', 5)" ><i class="far fa-save"></i> Modificar</button>
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-outline-danger"  onclick="Eliminar('<%=request.getContextPath()%>', 'SeccionServlet', 6)" ><i class="fas fa-trash-alt"></i> Eliminar</button>
            </div>
        </div>
    </div>	
</div>
<br>
<br>