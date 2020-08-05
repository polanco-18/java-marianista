<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/Imagen/logoM1.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
        <script src="<%=request.getContextPath()%>/JavaScript/JS.js" type="text/javascript"></script>
        <title>Login</title>
        <script>
            function MostrarC() {
                var x = document.getElementById("txtcla");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>
    </head>
    <body background="Imagen/FondoM.jpg" oncontextmenu="return false">
        <br> 
        <br>
        <br>
        <br>
        <br>
    <center>
        <div class="card" style="width: 28rem;">
            <div class="card-body"> 
                <form name="form">
                    <input type="hidden" name="op">
                    <img src="Imagen/logoM.png" alt=""/>
                    <br>
                    <br>
                    <h4 class="text-primary">Login</h4>
                    <br>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" name="txtusu" id="txtusu" placeholder="Usuario" aria-label="Usuario" aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
                        </div>
                        <input type="password"  name="txtcla"  id="txtcla" class="form-control" placeholder="Password">
                    </div>
                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" onclick="MostrarC()">Enseñar Contraseña
                        </label>
                    </div>
                    <% if (request.getAttribute("Mensaje") != null) {%>  
                    <div class="alert alert-danger alert-dismissible fade show text-danger" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong><%=(String) request.getAttribute("Mensaje")%></strong>
                        <br>
                    </div>              
                    <% }%>
                    <br>
                    <button class="btn btn-lg btn-outline-primary btn-block"  onclick="entrar('<%=request.getContextPath()%>', 'UsuarioServlet', 0)" > Entrar</button>
                </form>
            </div>
        </div>
    </center>
    <!-- Optional JavaScript -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>