﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<html lang="pt-br">

<head>
    <meta charset="utf-8">

    <title>E-Vestibular</title>
    <meta name="description" content="E-Vestibular">
    <meta name="author" content="Alexandre Goiana">
    <link rel="stylesheet" href="resources/lib/bootstrap-4.2.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/lib/caroussel/carousel.css" />
    <link rel="stylesheet" href="resources/lib/bootstrap-ecommerce-uikit/css/ui.css" />
    <link rel="stylesheet" href="resources/lib/bootstrap-ecommerce-uikit/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
        crossorigin="anonymous">
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="#"> </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="evestibular.com.br/index.aspx"><i class=""></i> E-VESTIBULAR <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="index.aspx"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href=""><i class="far fa-address-book"></i> Contato: WhatsApp: 71 99253-8773 / sac@evestibular.com.br </a>
                    </li>
                </ul>
                         </div>
        </nav>
    </header>
    <hr class="featurette-divider">

    <main role="main">
        
        
        <!-- Lista de Produtos
                ================================================== -->
        <!-- Wrap the rest of the page in another container to center all the content. -->
     

        <div class="container" id="code_prod_complex">
            <div class="row">
                <div class="col-md-4">
                    <figure class="card card-product">
                        <div class="img-wrap"><img src="assets/img/favicons/5.png"></div>
                        <figcaption class="info-wrap">
                            <h4 class="title">FACULDADE SANTÍSSIMO SACRAMENTO</h4>
                            <p class="desc">PARA REALIZAR SUA PROVA ON-LINE, CLIQUE NO BOTÃO ABAIXO</p>
                            
                        </figcaption>
                        <div class="bottom-wrap">
                             <a href="cadastro.aspx?id=5" class="btn btn-sm btn-primary float-right">FAZER MINHA PROVA</a>
                          </div> <!-- bottom-wrap.// -->
                    </figure>
                </div> <!-- col // -->
                <div class="col-md-4">
                    <figure class="card card-product">
                        <div class="img-wrap"><img src="assets/img/favicons/4.png"> </div>
                        <figcaption class="info-wrap">
                            <h4 class="title">UNIRB - CENTRO UNIVERSITÁRIO</h4>
                            <p class="desc">PARA REALIZAR SUA PROVA ON-LINE, CLIQUE NO BOTÃO ABAIXO</p>
                            </figcaption>
                        <div class="bottom-wrap">
                            <a href="https://www.evestibular.com.br/cadastro.aspx?id=4" class="btn btn-sm btn-primary float-right">FAZER MINHA PROVA</a>
                           
                        </div> <!-- bottom-wrap.// -->
                    </figure>
                </div> <!-- col // -->
                <div class="col-md-4">
                    <figure class="card card-product">
                        <div class="img-wrap"><img src="assets/img/favicons/9.png"></div>
                        <figcaption class="info-wrap">
                            <h4 class="title">FSA - FACULDADE SANTO ANTÔNIO</h4>
                            <p class="desc">PARA REALIZAR SUA PROVA ON-LINE, CLIQUE NO BOTÃO ABAIXO</p>
                                                    </figcaption>
                        <div class="bottom-wrap">
                             <a href="https://www.evestibular.com.br/cadastro.aspx?id=9" class="btn btn-sm btn-primary float-right">FAZER MINHA PROVA</a>
                            </div> <!-- bottom-wrap.// -->
                    </figure>
                </div> <!-- col // -->
            </div> <!-- row.// -->
        </div>

<!--        
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
                        alt="First slide">
                    <div class="container">
                        <div class="carousel-caption text-left">
                            <h1>Example headline.</h1>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta
                                gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
                        alt="Second slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>Another example headline.</h1>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta
                                gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
                        alt="Third slide">
                    <div class="container">
                        <div class="carousel-caption text-right">
                            <h1>One more for good measure.</h1>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta
                                gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        -->














        <hr class="featurette-divider">

        <!-- FOOTER -->
        <footer class="container">
            <p class="float-right"><a href="#">Volte ao topo</a></p>
            <p>&copy; &middot; <a href=""></a> &middot; <a href=""></a></p>
        </footer>
    </main>

    <!-- Bootstrap core JavaScript
              ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->


    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="resources/lib/holder/holder.min.js"></script>
    <script src="resources/lib/jquery3.3.1/jquery-3.3.1.min.js"></script>
    <script src="resources/lib/popper1.14.6/popper.min.js"></script>
    <script src="resources/lib/bootstrap-4.2.1-dist/js/bootstrap.min.js"></script>
</body>

</html>