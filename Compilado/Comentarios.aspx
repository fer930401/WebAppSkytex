<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comentarios.aspx.cs" Inherits="Skytex.Comentarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <title>Skytex México</title>
    <link rel="shortcut icon" href="<%=ResolveUrl("~/Media/skytex.ico") %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <meta name="description" content=""/>

    <link type="text/css" rel="stylesheet" href="~/Content/alertify.core.css" />
    <link type="text/css" rel="stylesheet" href="~/Content/alertify.default.css" />
    <link href="~/Scripts/toolkit-startup.css" rel="stylesheet"/>
    <link href="<%=ResolveUrl("~/Content/bootstrap.css") %>" rel="stylesheet"/>
    <script type="text/javascript" src="<%=ResolveUrl("~/Scripts/jquery-1.10.2.js") %>"></script> 
    <script type="text/javascript" src="<%=ResolveUrl("~/Scripts/bootstrap.js") %>"></script>
    <script type="text/javascript" src="~/Scripts/alertify.min.js"></script> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/> 
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>   
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <style type="text/css">
        .minusculas {
            text-transform: lowercase;
        }

        .mayusculas {
            text-transform: uppercase;
        }
    </style>
    <script>
        $(document).ready(function () {

            $('.ir-arriba').click(function () {
                $('body, html').animate({
                    scrollTop: '0px'
                }, 300);
            });

            $(window).scroll(function () {
                if ($(this).scrollTop() > 0) {
                    $('.ir-arriba').slideDown(300);
                } else {
                    $('.ir-arriba').slideUp(300);
                }
            });

        });
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 0) {
                    //$('.flotante').animate({ marginBottom: 50 }, 100);
                    $('.flotante').slideDown(300);
                } else {
                    //$('.flotante').animate({ marginBottom: 0 }, 100);
                    $('.flotante').slideUp(300);
                }
            });

        });
        function proveedores() {
            //alert('@Skytex.Recursos.Textos.strAviso2');
            window.location.href = 'https://www.skytex.com.mx/proveedores/';
        }
        var contador = 1;
        function cloneRow() {
            //se incrementa el contador cada ves que una fila es clonada
            contador++;
            // validacion de solo 3 inserciones mas
            if (contador <= 3) {
                var row = document.getElementById("rowToClone");
                var table = document.getElementById("tableToModify");
                var clone = row.cloneNode(true);
                //se agrega la nueva fila
                table.appendChild(clone);
                // se regresa el valor del contador
                return contador;
            } else {
                // si se alcanzan las 3 inserciones mas se nuestra una alerta
                alert('Solo Puedes Capturar 3 Empleos Previos');
            }
        }

        function onEnviar() {
            document.getElementById("variable").value = contador;
        }

        var myCenter = new google.maps.LatLng(19.2163540, -98.4035020);

        function initialize() {
            var mapProp = {
                center: myCenter,
                zoom: 16,
                mapTypeId: google.maps.MapTypeId.HYBRID
            };

            var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

            var marker = new google.maps.Marker({
                position: myCenter,
            });

            marker.setMap(map);

            var infowindow = new google.maps.InfoWindow({
                content: "Skytex Mexico S.A de C.V."
            });

            infowindow.open(map, marker);
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</head>

<body>
    <span class="ir-arriba icon-arrow-up2"><span class="glyphicon glyphicon-circle-arrow-up" aria-hidden="true"></span></span>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="https://www.skytex.com.mx"><img src="<%=ResolveUrl("~/Media/logoSkytexB.png") %>" width="22" height="25"></a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="https://www.skytex.com.mx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Inicio <span class="sr-only">(current)</span></a></li>
                    <li><a href="https://www.skytex.com.mx/es-MX/Home/Acerca"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> Skytex México</a></li>
                    <li><a href="https://jobs.lever.co/skytex.com.mx?lever-source=SITIO-WEB-SKYTEX"><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> Bolsa de Trabajo</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-text-width" aria-hidden="true"></span> Idioma <span class="caret"></span></a>
                        <ul class="dropdown-menu list-inline">
                            <li><a class="idioma" href="https://www.skytex.com.mx"><img src="<%=ResolveUrl("~/Media/Mexico-Flag.ico") %>" width="18" height="18"> Español</a></li>
                            <li><a class="idioma" href="https://www.skytex.com.mx/en-US"><img src="<%=ResolveUrl("~/Media/United-States-Flag.ico") %>" width="18" height="18"> English</a></li>
                            <!-- <li><a class="idioma" href="@Url.Action("SetLanguage", "Home", new { idioma = "ja-JP" })"><img src="~/Media/Japan-Flag.ico" width="18" height="18"> 日本の(Japones)</a></li> -->
                            <!-- <li><a class="idioma" href="@Url.Action("SetLanguage", "Home", new { idioma = "pt-BR" })"><img src="~/Media/Brazil-Flag.ico" width="18" height="18"> Portuges</a></li> -->
                        </ul>
                    </li>
                    <li><a href="https://www.skytex.com.mx/proveedores/" onclick="proveedores()"><span class="glyphicon glyphicon-log-in" aria-hidden="true"> </span> Ir a Proveedores</a></li>
                    <li><a href="https://www.skytex.com.mx/es-MX/Home/Comentarios"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Empleados/Operadores</a></li>
                </ul>
                <!-- Html.Partial("_LoginPartial") -->
            </div>
        </div>
    </div>
    <div class="flotante">
        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
        Skytex te agradece la visita.
        <span class="label label-danger"><strong>N# <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></strong></span>
    </div>
    <span class="ir-arriba icon-arrow-up2"><span class="glyphicon glyphicon-circle-arrow-up" aria-hidden="true"></span></span>
    <br />
        <div class="container">
            <div class="row">
                <ul class="list-inline">
                    <li><img src="/Media/logo2.png" width="230" height="90" /></li>
                    <li></li>
                </ul>
            </div>
            <div class="row">
        <div class="col-md-7">
            <form action="#" name="datosForm" method="post" runat="server">
                <h5>Puedes verificar los siguientes datos en tu credencial</h5>
                <br />
                <ul class="list-inline">
                    <li><strong>Número de Empleado:</strong></li>
                    <li><asp:TextBox ID="num_nom" runat="server" CssClass="form-control" required></asp:TextBox></li>
                </ul>
                <ul class="list-inline">
                    <li><strong>RFC:</strong></li>
                    <li><asp:TextBox ID="rfc_user" runat="server" CssClass="form-control" required></asp:TextBox></li>
                </ul>
                <asp:Button ID="btnComentario" runat="server" Text="Agrega Tu Comentario" OnClick="btnComentario_Click" CssClass="btn btn-success"/>   
               
            <br />
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
            <br />
            <asp:TextBox ID="user" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
            <asp:TextBox ID="num_nom2" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
            <asp:TextBox ID="rfc2" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="Ingresa tu comentario en el siguiente espacio" Visible="false"></asp:Label>
            <asp:TextBox ID="comentario" runat="server" TextMode="MultiLine" Rows="8" CssClass="form-control"></asp:TextBox><br />
            <asp:Button ID="btnGComentario" runat="server" Text="Enviar" OnClick="btnGComentario_Click" CssClass="btn btn-skytex"/>   
            <asp:Label ID="Label4" runat="server" Text="Label" Visible="false"></asp:Label>
            </form>
        <br />
        </div>
    </div>
        </div>
    <div class="container body-content">
        <hr />
        <footer>
            <p>© 2016 - Skytex México S.A. de C.V.</p>
            <a href="https://www.skytex.com.mx/es-MX/Home/Privacidad">Aviso de Privacidad</a>
        </footer>
    </div>
    
</body>
</html>

