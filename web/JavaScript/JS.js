function  entrar(ruta, controlador, op)
{
    var usuario = document.getElementById("txtusu").value;
    var clave = document.getElementById("txtcla").value;
    if (controlador == "UsuarioServlet")
    {
        if (usuario == "")
        {
            alert("Ingrese  Usuario !!!");
            document.getElementById("txtusu").focus();
            return;
        } else if (clave == "")
        {
            alert("Ingrese  Clave !!!");
            document.getElementById("txtcla").focus();
            return;
        } else {
            document.form.action = ruta + "/" + controlador;
            document.form.method = "POST";
            document.form.op.value = op;
            document.form.submit();
        }
    } else
    {
        if (usuario == "")
        {
            alert("Ingrese  Usuario !!!");
            document.getElementById("txtusu").focus();
            return;
        } else if (clave == "")
        {
            alert("Ingrese  Clave !!!");
            document.getElementById("txtcla").focus();
            return;
        } else
        {
            document.form.action = ruta + "/" + controlador;
            document.form.method = "POST";
            document.form.op.value = op;
            document.form.submit();
        }
    }
}

function CambiodePagina(ruta, controlador, op)
{
    var paginamenu = ruta + "/" + controlador + "?op=" + op;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}


function Datos(ruta, controlador, op, ab)
{
    var paginamenu = ruta + "/" + controlador + "?op=" + op + ab;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}
function Datos1(ruta, controlador, op, ab)
{
    var paginamenu = ruta + "/" + controlador + "?op=" + op + ab;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar4').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}
// ----------------------- Mantenimientos--------------------------
function  Eliminar(ruta, controlador, op)
{
    var codigo = document.getElementById("codigo").value;
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigo=" + codigo;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}
//----------------------- Insertar -------------------------------------------

function InsertarPersonal(ruta, controlador, op)
{
    var paginamenu;
    var xmlhttp;
    var txt1 = document.getElementById("txt1").value;
    var txt2 = document.getElementById("txt2").value;
    var txt3 = document.getElementById("txt3").value;
    var txt4 = document.getElementById("txt4").value;
    var txt5 = document.getElementById("txt5").value;
    var txt6 = document.getElementById("txt6").value;
    var txt7 = document.getElementById("txt7").value;
    var txt8 = document.getElementById("txt8").value;
    var txt9 = document.getElementById("txt9").value;
    var txt10 = document.getElementById("txt10").value;
    var txt11 = document.getElementById("txt11").value;
    var txt12 = document.getElementById("txt12").value;
    var txt13 = document.getElementById("txt13").value;
    var txt14 = document.getElementById("txt14").value;
    var file = document.getElementById("file").value;
    if (txt1 == '')
    {
        alert("Ingrese el  Nombre !!!");
        document.getElementById("txt1").focus();
        return;
    }
    if (txt2 == '')
    {
        alert("Ingrese el  Apellido !!!");
        document.getElementById("txt2").focus();
        return;
    }
    if (txt3 == '')
    {
        alert("Ingrese el  Apellido Materno !!!");
        document.getElementById("txt3").focus();
        return;
    }
    if (txt4 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt4").focus();
        return;
    }
    if (txt5 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt5").focus();
        return;
    }
    if (txt6 == '')
    {
        alert("Ingrese el  Fecha de Nacimiento!!!");
        document.getElementById("txt6").focus();
        return;
    }
    if (txt7 == '')
    {
        alert("Ingrese el  Dni !!!");
        document.getElementById("txt7").focus();
        return;
    }
    if (txt8 == '')
    {
        alert("Ingrese el  Sexo !!!");
        document.getElementById("txt8").focus();
        return;
    }
    if (txt9 == '')
    {
        alert("Ingrese el  Direccion!!!");
        document.getElementById("txt9").focus();
        return;
    }
    if (txt10 == '')
    {
        alert("Ingrese el  Correo !!!");
        document.getElementById("txt10").focus();
        return;
    }
    if (txt11 == '')
    {
        alert("Ingrese el  Telefono !!!");
        document.getElementById("txt11").focus();
        return;
    }
    if (txt12 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt12").focus();
        return;
    }
    if (txt13 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt13").focus();
        return;
    }
    if (txt14 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt14").focus();
        return;
    }
     if (file == '')
    {
        alert("Ingrese la foto !!!");
        document.getElementById("file").focus();
        return;
    }else
    {
        paginamenu = ruta + "/" + controlador + "?op=" + op + "&txt1=" + txt1 + "&txt2=" + txt2 + "&txt3=" + txt3 + "&txt4=" + txt4 + "&txt5=" + txt5 + "&txt6=" + txt6 + "&txt7=" + txt7 + "&txt8=" + txt8 + "&txt9=" + txt9 + "&txt10=" + txt10 + "&txt11=" + txt11 + "&txt12=" + txt12 + "&txt13=" + txt13 + "&txt14=" + txt14;
        if (window.XMLHttpRequest)
        {
            xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
        } else
        {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function ()
        {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {
                document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", paginamenu, true);
        xmlhttp.send(null);
    }
}

function   GrabarCurso(ruta, controlador, op)
{
    var paginamenu;
    var xmlhttp;
    var txt1 = document.getElementById("txt1").value;
    var txt2 = document.getElementById("txt2").value;
    var txt3 = document.getElementById("txt3").value;
    if (txt1 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt1").focus();
        return;
    }
    if (txt2 == '')
    {
        alert("Ingrese el  Dato !!!");
        document.getElementById("txt2").focus();
        return;
    } else
    {
        paginamenu = ruta + "/" + controlador + "?op=" + op + "&txt1=" + txt1 + "&txt2=" + txt2 + "&txt3=" + txt3;
        if (window.XMLHttpRequest)
        {
            xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
        } else
        {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function ()
        {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {
                document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", paginamenu, true);
        xmlhttp.send(null);
    }
}
function GrabarSalon(ruta, controlador, op)
{
    var paginamenu;
    var xmlhttp;
    var txt1 = document.getElementById("txt1").value;
    var txt2 = document.getElementById("txt2").value;
    var txt3 = document.getElementById("txt3").value;
    var txt4 = document.getElementById("txt4").value;
    if (txt1 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt1").focus();
        return;
    }
    if (txt2 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt2").focus();
        return;
    }
    if (txt3 == '')
    {
        alert("Ingrese el  Dato !!!");
        document.getElementById("txt3").focus();
        return;
    } else
    {
        paginamenu = ruta + "/" + controlador + "?op=" + op + "&txt1=" + txt1 + "&txt2=" + txt2 + "&txt3=" + txt3 + "&txt4=" + txt4;
        if (window.XMLHttpRequest)
        {
            xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
        } else
        {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function ()
        {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {
                document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", paginamenu, true);
        xmlhttp.send(null);
    }
}
function GrabarHorario(ruta, controlador, op)
{
    var paginamenu;
    var xmlhttp;
    var txt1 = document.getElementById("txt1").value;
    var txt2 = document.getElementById("txt2").value;
    var txt3 = document.getElementById("txt3").value;
    var txt4 = document.getElementById("txt4").value;
    var txt5 = document.getElementById("txt5").value;
    if (txt1 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt1").focus();
        return;
    }
    if (txt2 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt2").focus();
        return;
    }
    if (txt3 == '')
    {
        alert("Ingrese el  Dato !!!");
        document.getElementById("txt3").focus();
        return;
    }
    if (txt4 == '')
    {
        alert("Ingrese el  Dato !!!");
        document.getElementById("txt4").focus();
        return;
    }
    if (txt5 == '')
    {
        alert("Ingrese el  Dato !!!");
        document.getElementById("txt5").focus();
        return;
    } else
    {
        paginamenu = ruta + "/" + controlador + "?op=" + op + "&txt1=" + txt1 + "&txt2=" + txt2 + "&txt3=" + txt3 + "&txt4=" + txt4 + "&txt5=" + txt5;
        if (window.XMLHttpRequest)
        {
            xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
        } else
        {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function ()
        {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {
                document.getElementById('Curso').innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", paginamenu, true);
        xmlhttp.send(null);
    }
}
function InsertarCurso(ruta, controlador, op)
{
    var paginamenu;
    var xmlhttp;
    var txt1 = document.getElementById("txt1").value;
    paginamenu = ruta + "/" + controlador + "?op=" + op + "&txt1=" + txt1;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Curso').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}

function GrabarMatri (ruta, controlador, op)
{
    var paginamenu;
    var xmlhttp;
    var txt1 = document.getElementById("txt1").value;
    var txt2 = document.getElementById("txt2").value;
    var txt3 = document.getElementById("txt3").value;
    var txt4 = document.getElementById("txt4").value;
    var txt5 = document.getElementById("txt5").value;
    var txt6 = document.getElementById("txt6").value;
    var txt7 = document.getElementById("txt7").value;
    var txt8 = document.getElementById("txt8").value;
    var txt9 = document.getElementById("txt9").value;
    var txt10 = document.getElementById("txt10").value;
    var txt11 = document.getElementById("txt11").value;
    var txt12 = document.getElementById("txt12").value;
    var txt13 = document.getElementById("txt13").value;
    var txtS = document.getElementById("txtSeccion").value;
    var txtC = document.getElementById("txtCategoria").value;
    var txt14 = document.getElementById("txt14").value;
    var txt15 = document.getElementById("txt15").value;
    var txt16 = document.getElementById("txt16").value;
    var txt17 = document.getElementById("txt17").value;
    var txt18 = document.getElementById("txt18").value;
    alert(txt5);
    if (txt1 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt1").focus();
        return;
    } else if (txt2 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt2").focus();
        return;
    } else if (txt3 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt3").focus();
        return;
    } else if (txt5 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt5").focus();
        return;
    } else if (txt6 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt6").focus();
        return;
    } else if (txt7 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt7").focus();
        return;
    } else if (txt9 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt9").focus();
        return;
    } else if (txt10 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt10").focus();
        return;
    } else if (txt11 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt11").focus();
        return;
    } else if (txt12 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt12").focus();
        return;
    } else if (txt13 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt13").focus();
        return;
    } else if (txtS == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txtSeccion").focus();
        return;
    } else if (txtC == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txtCategoria").focus();
        return;
    } else if (txt14 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt14").focus();
        return;
    } else if (txt15 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt15").focus();
        return;
    } else if (txt16 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt16").focus();
        return;
    } else if (txt17 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt17").focus();
        return;
    } else if (txt18 == '')
    {
        alert("Ingrese el  Dato!!!");
        document.getElementById("txt18").focus();
        return;
    } else {
        paginamenu = ruta + "/" + controlador + "?op=" + op + "&txt1=" + txt1 + "&txt2=" + txt2 + "&txt3=" + txt3 + "&txt4=" + txt4 + "&txt5=" + txt5 + "&txt6=" + txt6 + "&txt7=" + txt7 + "&txt8=" + txt8 + "&txt9=" + txt9 + "&txt10=" + txt10 + "&txt11=" + txt11 + "&txt12=" + txt12 + "&txt13=" + txt13 + "&txtSeccion=" + txtS + "&txtCategoria=" + txtC + "&txt14=" + txt14 + "&txt15=" + txt15 + "&txt16=" + txt16 + "&txt17=" + txt17 + "&txt18=" + txt18;
        if (window.XMLHttpRequest)
        {
            xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
        } else
        {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function ()
        {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {
                document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", paginamenu, true);
        xmlhttp.send(null);
    }
}


function  BuscarR(ruta, controlador, op)
{
    var paginamenu;
    var xmlhttp;
    var txt1 = document.getElementById("txt1").value;
    paginamenu = ruta + "/" + controlador + "?op=" + op + "&txt1=" + txt1;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('BuscarR').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}

// --------------------------------------------------------------------------  Modificar   --------------------------------------------------------------------------------
function  Modificar(ruta, controlador, op, codigo)
{
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigo=" + codigo;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}
function  ModificarSeccion(ruta, controlador, op, codigoS, codigoSA, D1, D2, D3, D4, D5, D6)
{
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigoS=" + codigoS + "&codigoSA=" + codigoSA + "&D1=" + D1 + "&D2=" + D2 + "&D3=" + D3 + "&D4=" + D4 + "&D5=" + D5 + "&D6=" + D6;
    var xmlhttp;
    // en esta condicional Doble se valida la Version del Navegador
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}

function  ModificarUsuario(ruta, controlador, op, codigo, D1, D2, D3, D4, D5, D6, D7, D8)
{
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigo=" + codigo + "&D1=" + D1 + "&D2=" + D2 + "&D3=" + D3 + "&D4=" + D4 + "&D5=" + D5 + "&D6=" + D6 + "&D7=" + D7 + "&D8=" + D8;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}

function  ModificarCur(ruta, controlador, op, codigoCurso, codigoDocente, D1, D2)
{
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigoCurso=" + codigoCurso + "&codigoDocente=" + codigoDocente + "&D1=" + D1 + "&D2=" + D2;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}
function  ModificarSalon(ruta, controlador, op, codigo, D1, D2, D3)
{
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigo=" + codigo + "&D1=" + D1 + "&D2=" + D2 + "&D3=" + D3;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}
function  EliminarSeccion(ruta, controlador, op, codigo, D1)
{
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigo=" + codigo + "&txt1=" + D1;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Curso').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}

// -------------------------------------------------------------------------- Actulizar --------------------------------------------------------------------------------

function ActualizarPer(ruta, controlador, op)
{
    var codigo = document.getElementById("codigo1").value;
    var codigo2 = document.getElementById("codigo2").value;
    var txt1 = document.getElementById("txt1").value;
    var txt2 = document.getElementById("txt2").value;
    var txt3 = document.getElementById("txt3").value;
    var txt4 = document.getElementById("txt4").value;
    var txt5 = document.getElementById("txt5").value;
    var txt6 = document.getElementById("txt6").value;
    var txt7 = document.getElementById("txt7").value;
    var txt8 = document.getElementById("txt8").value;
    var txt9 = document.getElementById("txt9").value;
    var txt10 = document.getElementById("txt10").value;
    var txt11 = document.getElementById("txt11").value;
    var txt12 = document.getElementById("txt12").value;
    var txt13 = document.getElementById("txt13").value;
    var txt14 = document.getElementById("txt14").value;
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigo1=" + codigo + "&codigo2=" + codigo2 + "&txt1=" + txt1 + "&txt2=" + txt2 + "&txt3=" + txt3 + "&txt4=" + txt4 + "&txt5=" + txt5 + "&txt6=" + txt6 + "&txt7=" + txt7 + "&txt8=" + txt8 + "&txt9=" + txt9 + "&txt10=" + txt10 + "&txt11=" + txt11 + "&txt12=" + txt12 + "&txt13=" + txt13 + "&txt14=" + txt14;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}

function ActualizarSeccion(ruta, controlador, op)
{
    var codigo = document.getElementById("codigo").value;
    var txt1 = document.getElementById("txt1").value;
    var txt2 = document.getElementById("txt2").value;
    var txt3 = document.getElementById("txt3").value;
    var txt4 = document.getElementById("txt4").value;
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigo=" + codigo + "&txt1=" + txt1 + "&txt2=" + txt2 + "&txt3=" + txt3 + "&txt4=" + txt4;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}

function ActualizarUsuario(ruta, controlador, op)
{
    var codigo = document.getElementById("codigo").value;
    var txt1 = document.getElementById("txt1").value;
    var txt2 = document.getElementById("txt2").value;
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigo=" + codigo + "&txt1=" + txt1 + "&txt2=" + txt2;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}

function ActualizarCurso(ruta, controlador, op)
{
    var codigo = document.getElementById("codigo").value;
    var txt1 = document.getElementById("txt1").value;
    var txt2 = document.getElementById("txt2").value;
    var txt3 = document.getElementById("txt3").value;
    var paginamenu = ruta + "/" + controlador + "?op=" + op + "&codigo=" + codigo + "&txt1=" + txt1 + "&txt2=" + txt2 + "&txt3=" + txt3;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();// creando un de Ajax Moderno
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById('Mostrar').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", paginamenu, true);
    xmlhttp.send(null);
}
