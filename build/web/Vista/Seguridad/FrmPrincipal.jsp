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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/Imagen/logoM1.png"/>
        <title>Marianista Virtual</title>
        <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
        <script src="<%=request.getContextPath()%>/JavaScript/JS.js" type="text/javascript"></script> 
    </head> 
</head>
<body oncontextmenu="return false" style="background-color: lightgrey"> 
    <input type="hidden" name="op">  
    <div class=" collapse" id="navbarHeader" style="background-color: lightgrey">
        <br>
        <div class="container-fluid">
            <div class="row">
                <% if (opcion < 4) {%>
                <div class="col text-primary">
                    <ul class="list-unstyled">
                        <div class='row'>
                            <div class=" col-md-8">
                                <h4><center><b>Área Académica <i class="fas fa-edit"></i></b></center></h4>
                                <hr style="background-color: dodgerblue">
                                <div class='row'>
                                    <div class="col">
                                        <center><li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','MatriculaServlet',0)">Matricula <i class="fas fa-file-signature"></i></a></li></center>
                                    </div>
                                    <div class="col">
                                        <center><li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','PagoServlet',0)">Pagos <i class="fas fa-file-invoice-dollar"></i></a></li></center>
                                    </div>
                                    <div class="col">
                                        <center><li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','HorarioServlet',0)">Horario <i class="fas fa-book"></i></a></li></center>
                                    </div>
                                    <div class="col">
                                        <center><li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','SeccionServlet',0)">Secciones <i class="fas fa-clipboard-check"></i></a></li></center>
                                    </div>   
                                    <div class="col">
                                        <center><li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','CursoServlet',0)">Cursos <i class="fas fa-book-open"></i></a></li></center>
                                    </div>
                                    <div class="col">
                                        <center><li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','SalonServlet',0)">Salones <i class="fas fa-building"></i></a></li></center>
                                    </div>   
                                </div>   
                            </div>   
                            <div class="col-md-4">                                
                                <h4><center><b>Área Administrativa <i class="fas fa-edit"></i></b></center></h4>
                                <hr style="background-color: dodgerblue">
                                <div class="row">
                                    <div class="col">
                                        <center><li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','DocenteServlet',0)">Docentes <i class="fas fa-users"></i></a></li></center>
                                    </div>
                                    <div class="col">
                                        <center><li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','AlumnoServlet',0)">Alumnos <i class="fas fa-user-graduate"></i></a></li></center>
                                    </div>   
                                    <% if (opcion < 3) {%><div class="col">
                                        <li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','PersonaServlet',0)">Personal <i class="fas fa-users"></i></a></li>
                                    </div><% }%>
                                    <% if (opcion < 3) {%><div class="col">
                                        <li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','UsuarioServlet',10)">Usuarios <i class="fas fa-users-cog"></i></a></li>
                                    </div>   <% }%>
                                </div>   
                            </div>   
                        </div>
                    </ul>
                </div><% } %>
                <% if (opcion > 3) {%>
                <div class="col text-primary">
                    <center><b><h4>Asignaturas <i class="fas fa-edit"></i></h4></b></center>
                    <hr>
                    <ul class="list-unstyled">
                        <div class="row">
                            <% if (opcion == 5) {%>
                            <div class="col">
                                <center><li><a href="JavaScript:Datos('<%=request.getContextPath()%>','PagoServlet',8,'<%="&txtcod=" + objDatoBean.getBDDATOPersona()%>')">Pagos <i class="fas fa-file-invoice-dollar"></i></a></li></center>
                            </div>
                            <%}%>
                            <% if (opcion == 5) {%>
                            <div class="col">
                                <center>
                                    <li><a href="JavaScript:Datos('<%=request.getContextPath()%>','HorarioServlet',8,'<%="&txtcod=" + objDatoBean.getBDDATOPersona()%>')" ><i class="fas fa-list-alt"></i> Horario</a></li>
                                </center>
                            </div><%}%>
                            <% if (opcion == 4) {%>
                            <div class="col">
                                <center>
                                    <li><a href="JavaScript:Datos('<%=request.getContextPath()%>','HorarioServlet',9,'<%="&txtcod=" + objDatoBean.getBDDATOPersona()%>')" ><i class="fas fa-list-alt"></i> Horario</a></li>
                                </center>
                            </div><%}%>
                            <div class="col">
                                <center>
                                    <li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','DocenteServlet',8)"><i class="fas fa-users"></i> Profesores</a></li>
                                </center>
                            </div>
                            <% if (opcion == 4) {%>
                            <div class="col">
                                <center> 
                                    <li><a href="JavaScript:CambiodePagina('<%=request.getContextPath()%>','AlumnoServlet',8)"><i class="fas fa-user-graduate"></i> Alumnos</a></li>
                                </center>
                            </div>
                            <% }%>
                        </div>
                    </ul>
                </div>
                </ul>
            </div>
            <% }%>                
        </div>
    </div>
</div>
<div class="navbar navbar-dark" style="background-image:url('Imagen/FondoM.jpg')">
    <div class="container-fluid d-flex justify-content-between">  
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a  class="navbar-brand" href="JavaScript:Datos('<%=request.getContextPath()%>','UsuarioServlet',1,'<%="&txtcod=" + objDatoBean.getBDDATOPersona() + "&txttip=" + opcion%>')" title="Inicio"><b class="text-light">Colegio Marianista <i class="fas fa-school"></i></b></a>
        <div class="dropdown">
            <a class="dropdown-toggle text-primary" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <center><img class="rounded-circle" src="<%=request.getContextPath()%>/Imagen/Personas/<%= objDatoBean.getBDDATO4()%>"style="width: 35px; height: 35px;" class="rounded"/></center>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <center><img class="rounded-circle" src="<%=request.getContextPath()%>/Imagen/Personas/<%= objDatoBean.getBDDATO4()%>"style="width: 80px; height: 80px;" class="rounded"/></center>
                <center><p class="text-primary"> <%= objDatoBean.getBDDATO1() + " " + objDatoBean.getBDDATO2() + " " + objDatoBean.getBDDATO3()%></p></center>
                <% if (opcion == 1) { %> <center><p class="text-danger"><i class="fas fa-user-tag"></i> Director</p></center><% } %>
                <% if (opcion == 2) { %> <center><p class="text-danger"><i class="fas fa-user-tag"></i> Sub - Director</p></center><% } %>
                <% if (opcion == 3) { %> <center><p class="text-watming"><i class="fas fa-user-tag"></i> Secretaria</p></center><% } %>
                <% if (opcion == 4) { %> <center><p class="text-info"><i class="fas fa-user-tag"></i> Profesor</p></center><% } %>
                <% if (opcion == 5) { %> <center><p class="text-primary"><i class="fas fa-user-tag"></i> Alumno</p></center><% }%>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item text-primary" href="JavaScript:Datos('<%=request.getContextPath()%>','UsuarioServlet',1,'<%="&txtcod=" + objDatoBean.getBDDATOPersona() + "&txttip=" + opcion%>')" ><i class="fas fa-home"></i> Inicio </a>
                <a class="dropdown-item text-primary" href="JavaScript:Datos('<%=request.getContextPath()%>','UsuarioServlet',2,'<%="&txtcod=" + objDatoBean.getBDDATOPersona() + "&txttip=" + opcion%>')" ><i class="fas fa-info-circle"></i> Datos Personales</a>
                <a class="dropdown-item text-primary" href="JavaScript:Datos('<%=request.getContextPath()%>','UsuarioServlet',3,'<%="&txtcod=" + objDatoBean.getBDDATOPersona() + "&txttip=" + opcion%>')" ><i class="fas fa-key"></i> Cambiar Contraseña </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item text-danger" href="<%=request.getContextPath()%>/index.jsp"><i class="fas fa-sign-out-alt"></i> Cerrar Sesion</a>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <br>
    <div id="Mostrar">
        <!------------------------------------------------------------------------------------->    
        <div class="card-group">
            <div class="card">
                <div class="card-header">
                    <center><h3 class="text-warning"><b> <i class="fas fa-calendar"></i> Eventos</b></h3></center>
                </div>
                <div class="card-body">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100 rounded" src="<%=request.getContextPath()%>/Imagen/Evento1.jpg" alt="First slide"style=" height: 560px;">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 rounded" src="<%=request.getContextPath()%>/Imagen/Evento2.jpg" alt="Second slide"style=" height: 560px;">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 rounded" src="<%=request.getContextPath()%>/Imagen/Evento3.jpg" alt="Third slide"style=" height: 560px;">                                    
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="card" >
                <div class="card-header">
                    <center><h3 class="text-primary"><b><i class="fas fa-child"></i> Bienvenido</b></h3></center>
                </div>
                <div class="card-body">
                    <div class="jumbotron jumbotron-fluid border-primary">
                        <center>
                            <h4 class="text-primary"><i class="fas fa-user-circle"></i> <%= objDatoBean.getBDDATO1() + " " + objDatoBean.getBDDATO2()%> </h4>
                            <br>
                            <% if (opcion == 1) { %> <h3 class="text-danger"><i class="fas fa-user-tag"></i> Director</h3><% } %>
                            <% if (opcion == 2) { %> <h3 class="text-danger"><i class="fas fa-user-tag"></i> Sub - Director</h3><% } %>
                            <% if (opcion == 3) { %> <h3 class="text-watming"><i class="fas fa-user-tag"></i> Secretaria</h3><% } %>
                            <% if (opcion == 4) { %> <h3 class="text-info"><i class="fas fa-user-tag"></i> Profesor</h3><% } %>
                            <% if (opcion == 5) { %> <h3 class="text-primary"><i class="fas fa-user-tag"></i> Alumno</h3><% }%>
                            <br>
                            <img src="<%=request.getContextPath()%>/Imagen/Personas/<%= objDatoBean.getBDDATO4()%>" class="d-block w-70 rounded" style="height: 180px;"/>
                            <br>
                            <p><a class="btn btn-outline-info" href="javascript:Datos('<%=request.getContextPath()%>','UsuarioServlet',2,'<%="&txtcod=" + objDatoBean.getBDDATOPersona() + "&txttip=" + opcion%>')" role="button">Mas <i class="fas fa-info-circle"></i></a></p>
                            <br>
                            <br>
                        </center>
                    </div>
                </div>
            </div>
            <div class="card" >
                <div class="card-header">
                    <center><h3 class="text-primary"><b><i class="fas fa-list-alt"></i> Seleccion </b></h3></center>
                </div>
                <div class="card-body">
                    <div id="accordion" role="tablist">
                        <div class="card">
                            <div class="card-header" role="tab" id="headingOne">
                                <h5 class="mb-0">
                                    <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><i class="fas fa-basketball-ball"></i> Basquetball - Hombres </a>
                                </h5>
                            </div>
                            <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">
                                    <img class="card-img-top" src="<%=request.getContextPath()%>/Imagen/T1.JPG" alt="Card image cap">
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingTwo">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><i class="fas fa-basketball-ball"></i> Basquetball - Mujeres </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                                <div class="card-body">
                                    <img class="card-img-top" src="<%=request.getContextPath()%>/Imagen/T2.JPG" alt="Card image cap">
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingThree">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><i class="fas fa-volleyball-ball"></i> Voley - Mujeres</a>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                                <div class="card-body">
                                    <img class="card-img-top" src="<%=request.getContextPath()%>/Imagen/T3.JPG" alt="Card image cap">                            
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>      
        <!------------------------------------------------------------------------------------->                            
    </div>
</div>
<br>
<br>
<script src="<%=request.getContextPath()%>/js/bootstrap.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>