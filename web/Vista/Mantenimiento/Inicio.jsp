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