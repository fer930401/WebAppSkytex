<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="skytex.aspx.cs" Inherits="Skytex.skytex" %>

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
                    <li><a href="https://www.skytex.com.mx/es-MX/Home/SkyMatt"><span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span> SkyMatt</a></li>
                    <!--<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> Skytex Mexico <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="https://www.skytex.com.mx/es-MX/Home/Acerca"><span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span> Skytex México</a></li>
                            <li><a href="https://www.skytex.com.mx/es-MX/Home/SkyMatt"><span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span> SkyMatt</a></li>
                            <li><a href="@Url.Action("SkyMatt", "Home")">SkyMatt</a></li>
                            <li><a href="@Url.Action("SkyFelt", "Home")">SkyFelt</a></li>
                            <li><a href="@Url.Action("EnConstruccion", "Home")">Fiber Home</a></li>
                            <li><a href="@Url.Action("EnConstruccion", "Home")">Body Fx</a></li>
                            <li><a href="@Url.Action("EnConstruccion", "Home")">SkyDeco</a></li>
                        </ul>
                    </li>-->
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
    <!-- <center><iframe src="https://www.skytex.com.mx/proveedores" width="100%"> </iframe></center> -->
    <div class="container">
        <div class="col-sm-12">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="Media/banner1.jpg" alt="Skytex">
                        <div class="carousel-caption">
                            Grupo Skytex
                        </div>
                    </div>
                    <div class="item">
                        <img src="Media/banner2.jpg" alt="Skytex">
                        <div class="carousel-caption">
                            Grupo Skytex
                        </div>
                    </div>
                    <div class="item">
                        <img src="Media/banner3.jpg" alt="Skytex">
                        <div class="carousel-caption">
                            Grupo Skytex
                        </div>
                    </div>
                    <div class="item">
                        <img src="Media/banner4.jpg" alt="Skytex">
                        <div class="carousel-caption">
                            Grupo Skytex
                        </div>
                    </div>
                    <div class="item">
                        <img src="Media/banner5.jpg" alt="Skytex">
                        <div class="carousel-caption">
                            Grupo Skytex
                        </div>
                    </div>
                    <div class="item">
                        <img src="Media/banner6.jpg" alt="Skytex">
                        <div class="carousel-caption">
                            Grupo Skytex
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <br />
        <br />
        <div>
            <div class="e">
                <div class="parrafo">
                    <div class="col-md-6">
                        <img class="img-responsive" src="Media/pg5-2.png" style="width: 100%;">
                    </div>
                    <div class="col-md-6">
                        <h3 class="alp">En Skytex</h3>
                        <p class="ak amf text-justify">
                            En Skytex estamos orgullosos de ser uno de los fabricantes más importantes en la región del Tratado de Libre Comercio de América del Norte y Latinoamérica de telas de poliéster de alta torsión, así como de las telas sintéticas con spandex del tejido circular, teñidas y estampadas.
                        </p>
                        <p class="ak amf text-justify">
                            Debido a su equipamiento y tecnología de punta, nuestra planta bien puede ser considerada como una de las más modernas de su tipo a nivel mundial.
                        </p>
                        <p class="ak amf text-justify">
                            Gracias a la integración vertical de todos los procesos, desde el torcido de hilo hasta el estampado de la tela, estamos en condiciones de garantizar la más alta calidad en todos nuestros productos, y así, ofrecer el mejor de los servicios a nuestros clientes.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div class="al aa">
            <div class="e">
                <div class="parrafo">
                    <div class="gg jr">
                        <img class="" src="Media/pg1.png" style="width: 100%;">
                    </div>
                    <div class="gk jg">
                        <h6 class="am eu">ULTIMAS NOTICIAS</h6>
                        <h3 class="alp">Acerca de Skytex México.</h3>
                        <p class="ak amf text-justify">
                            Grupo Skytex consta de un grupo de empresas que gracias a su tecnología de punta y determinación permiten garantizar la más alta calidad en todos nuestros productos. Grupo Skytex se enfoca en la industria de la confección, moda, decoración del hogar, limpieza, industria colchonera, mueblera y otras. Nuestra planta está ubicada en el Parque Industrial en Huejotzingo, Puebla y abarca más de 80,000 metros cuadrados. Grupo Skytex cumple con todas los normas nacionales al igual que internacionales.
                        </p>
                        <p class="ak amf text-justify">
                            El principal mercado al que nuestros productos están destinados es el de la moda y confección, por lo que la variedad de las telas en cuanto a texturas, acabados, colores y estampados, adquiere importancia relevante ya que permanentemente tenemos que ofrecer alternativas de vanguardia, de acuerdo a las tendencias de marca la moda internacional.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="k ams">
        </div>
        <div class="anp brandRibbon">
            <div class="e eq">
                <h3 class="am letraFooter eu">GRUPO SKYTEX</h3>
                <p class="ak amf am">
                    <ul class="list-inline">
                        <li><img class="ag img-responsive" src="Media/skytex2B.png" width="150"></li>
                        <li><img class="ag img-responsive" src="Media/skyfelt.png" width="150"></li>
                        <li><img class="ag img-responsive" src="Media/skymatt.png" width="100"></li>
                        <li><img class="ag img-responsive" src="Media/skyrug.png" width="100"></li>
                        <li><img class="ag img-responsive" src="Media/skytrade.png" width="100"></li>
                        <li><img class="ag img-responsive" src="Media/skyeps1.png" width="150"></li>
                        <li><img class="ag img-responsive" src="Media/skyeps2.png" width="150"></li>
                    </ul>
                </p>
            </div>
        </div>
        <div class="k ae">
            <div class="e eq">
                <div class="c ah">
                    <div class="gz ix gs kj gm ni">
                        <h5 class="am eu">DENTRO DE SKYTEX</h5>
                        <h3 class=" text-uppercase">"LA CALIDAD ES PRIMERO"</h3>
                    </div>
                </div>
                <div class="c af">
                    <div class="gc anh ah">
                        <img class="ag img-responsive" src="Media/maq_hilos.jpg" width="300">
                        <p class="text-justify">Tejido Plano y Circular. Surge en el país como la primera fábrica para telas de alta torsión. Utilizando fibras de poliéster para ofrecer al mercado un producto nacional capaz de sustituir y mejorar los productos que se tenían que importar.</p>
                    </div>
                    <div class="gc anh ah">
                        <img class="ag img-responsive" src="Media/listones.jpg" width="300">
                        <p class=" text-justify">Listones. A finales del año 2006 iniciamos la fabricación de listones con tecnología avanzada y un alto control de calidad; elaborados con nylon y poliéster, ofreciendo alta resistencia y gran variedad en cuanto a tamaño y colorido.</p>
                    </div>
                    <div class="gc anh ah">
                        <img class="ag img-responsive" src="Media/medio_ambiente.png" width="300">
                        <p class=" text-justify">Medio Ambiente. Como empresa no solo cumplimos con regulaciones gubernamentales en el ámbito de la industria, sino que también cumplimos con nuestros propios objetivos en materia ecológica.</p>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="c">
                <center>
                    <h5 class="am eu">ENCUÉNTRAMOS EN</h5>
                    <h3 class="alp">Nos encontramos ubicados en Corredor Industrial Quetzalcóatl, Huejotzingo, Pue.</h3>
                    <div id="googleMap" style="width:80%;height:400px;"></div>
                </center>
            </div>
        </div>
        <div class="k ams">

        </div>
        <div class=" aj">
            <div class="e">
                <div class="c">
                    <div class="gg amf">
                        <br />
                        <br />
                        <ul class="fh ">
                            <li class="ag"><h6 class="eu">CONTACTO VACANTES</h6></li>
                            <li class="letraFooter">
                                <address>
                                    <strong>Skytex México S.A de C.V.</strong><br /><br />
                                    <p class="alp">
                                        <abbr title="Email">Email:</abbr>
                                        <a href="mailto:gerente.reclutamiento@skytex.com.mx?subject=Contacto Skytex">gerente.reclutamiento@skytex.com.mx</a>
                                        <br />
                                    </p>
                                    <p class="alp">
                                        <abbr title="Email">Email:</abbr>
                                        <a href="mailto:supervisor.reclutamiento@skytex.com.mx?subject=Contacto Skytex">supervisor.reclutamiento@skytex.com.mx</a>
                                        <br />
                                    </p>
                                </address>
                                <address>
                                    <strong>Paseo de la Reforma 2620-405 </strong><br>
                                    <strong>Colonia Lomas Altas, Del. Miguel Hidalgo. C.P. 11950, México D.F.</strong><br>
                                    <p class="alp">
                                        <abbr title="Tel">Tel.:</abbr> 50 81 8940<br />
                                        <abbr title="Tel">Tel.:</abbr> 50 81 8946
                                    </p>
                                </address>
                            </li>
                        </ul>
                    </div>
                    <div class="fu kk amf">
                        <br />
                        <br />
                        <ul class="fh sv">
                            <li class="ag"><h6 class="eu">Facebook</h6></li>
                            <li class="am"><a href="https://www.facebook.com/pages/Skytex-M%C3%A9xico-SA-de-CV/417270945049937" target="_blank"><img class="ag img-responsive" src="Media/facebook.png" width="45"></a></li>
                        </ul>
                    </div>
                    <div class="fu amf">
                        <br />
                        <br />
                        <ul class="fh sv">
                            <li class="ag"><h6 class="eu">Linked In</h6></li>
                            <li class="am"><a href="https://www.linkedin.com/company/skytex-mexico-sa-de-cv?trk=top_nav_home" target="_blank"><img class="ag img-responsive" src="Media/linkedin.png" width="45"></a></li>
                        </ul>
                    </div>
                    <div class="fu amf">
                        <br />
                        <br />
                        <ul class="fh sv">
                            <li class="ag"><h6 class="eu">Google +</h6></li>
                            <!-- <li class="am"><a href="https://plus.google.com/115559457839308952639/about" target="_blank"><img class="ag img-responsive" src="Media/google.png" width="45"></a></li> -->
                            <li class="am"><a href="https://plus.google.com/107599648363134966181/about" target="_blank"><img class="ag img-responsive" src="Media/google.png" width="45"></a></li>
                        </ul>
                    </div>
                </div>
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
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
