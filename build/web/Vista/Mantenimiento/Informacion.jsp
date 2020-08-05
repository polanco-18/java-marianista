<%@page import="Modelo.Bean.DatoBean"%>
<%!
    String opciones;
    DatoBean objDatoBean;
%>
<%
    opciones = (String) request.getAttribute("opciones");
    int opcion = Integer.parseInt(opciones);
    objDatoBean = (DatoBean) request.getAttribute("Usuario");
%>   
<div class="card">
    <div class="card-header">
        <div class="row">
            <div class="col">
                <br>
                <br>
                <h4 class="text-primary"><b><i class="fas fa-info-circle"></i> Acerca de mi : </b></h4>
            </div>
            <div class="col">
                <br>
                <br>
                <center><h4 class="text-primary"><i class="fas fa-user"></i> <%= objDatoBean.getBDDATO1()%> <%= objDatoBean.getBDDATO2()%> <%= objDatoBean.getBDDATO3()%></h4></center>
            </div>
            <div class="col">
                <center><img src="<%=request.getContextPath()%>/Imagen/Personas/<%= objDatoBean.getBDDATO4()%>" style="width: 100px; height: 100px;"/></center>
            </div>        
        </div>        
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col"> 
                <table class="table text-primary">
                    <tr>    
                        <td><b><i class="fas fa-id-card-alt"></i> Codigo</b></td>
                        <td>:</td>
                        <td>PE00<%= objDatoBean.getBDDATOPersona()%></td>
                    </tr>
                    <tr>    
                        <td><b><i class="fas fa-address-card"></i> Nombres </b></td>
                        <td>:</td>
                        <td><%= objDatoBean.getBDDATO1()%></td>
                    </tr>
                    <tr>    
                        <td><b><i class="fas fa-address-card"></i> Apellido Paterno</b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO2()%></td>
                    </tr>
                    <tr>    
                        <td><b><i class="fas fa-address-card"></i> Apellido Materno :</b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO3()%></td>
                    </tr>   
                    <tr>
                        <td><b><i class="fas fa-birthday-cake"></i>  Fecha de Nacimiento </b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO6()%></td>
                    </tr>                           
                </table>
            </div>
            <div class="col"> 
                <table class="table text-primary">      
                    <tr>
                        <td><b><i class="fas fa-venus"></i> Sexo </b></td>
                        <td>:</td>
                        <% if (objDatoBean.getBDDATO8().equals("0")) { %><td class="text-danger">Femenino</td>
                        <% } else {%> <td class="text-success">Masculino</td><% }%>
                    </tr>
                    <tr>
                        <td><b><i class="fas fa-address-card"></i>  DNI</b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO7()%></td>
                    </tr>           
                    <tr>
                        <td><b><i class="fas fa-users"></i>  Tipo Persona </b></td>
                        <td>:</td>
                        <td>
                            <% if (opcion == 1) { %> Director<% } %>
                            <% if (opcion == 2) { %> Secretaria<% } %>
                            <% if (opcion == 3) { %>Profesor<% } %>
                            <% if (opcion == 4) { %>Alumno<% }%>
                        </td>
                    </tr>
                    <tr>
                        <td><b><i class="fas fa-envelope"></i>  Correo </b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO10()%></td>
                    </tr>                                    
                    <tr>
                        <td><b><i class="fas fa-chevron-circle-right"></i>  Estado Civil </b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO13()%></td>
                    </tr>
                </table>
            </div>
            <div class="col">
                <table class="table text-primary">  
                    <tr>
                        <td><b><i class="fas fa-phone"></i>  Telefono </b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO11()%></td>
                    </tr>    
                    <tr>
                        <td><b><i class="fas fa-home"></i>  Direccion </b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO9()%></td>
                    </tr>    
                    <tr>
                        <td><b><i class="fas fa-home"></i>  Distrito </b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO12()%></td>
                    </tr>
                    <tr>
                        <td><b><i class="fas fa-home"></i> Provincia </b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO14()%></td>
                    </tr>
                    <tr>
                        <td><b><i class="fas fa-home"></i>  Departamento </b></td>
                        <td>:</td>
                        <td><%=objDatoBean.getBDDATO15()%></td>
                    </tr>
                </table>
            </div>                        
        </div>   
    </div>
</div>