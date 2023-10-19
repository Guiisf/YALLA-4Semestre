


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous" />
        <script src="${pageContext.request.contextPath}/lib/jquery-3.6.0.min.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/lib/bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <title>CrSete Tecnology</title>
    </head>
    <body style="background-color: #006C75">
        <div class="container-fluid bg-dark text-white p-3" style="text-align: center">
            <h1 class="">CrSete Tecnology</h1>
        </div>

        <nav class="navbar navbar-expand-lg bg-dark navbar-dark sticky-top">
            <a class="navbar-brand mx-auto" href="${pageContext.request.contextPath}/Principal.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
                <ul class="navbar-nav ">
                    <li class="nav-item mx-3">
                        <a class="nav-link" href="Principal.jsp">Home</a>
                    </li>
                    <li class="nav-item dropdown mx-3">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            Produtos
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="produtosApple.jsp">Celulares Apple</a>
                            <a class="dropdown-item" href="produtosSamsung.jsp">Celulares Samsung</a>
                        </div>
                    </li>
                    <c:if test="${sessionScope.cliente.nome == null}">
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="loginCliente.jsp">Login</a>
                        </li>   
                    </c:if>
                    <c:if test="${sessionScope.cliente.nome != null}">
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="CadastroClienteServlet?CPFCliente=${cliente.cpf}&ope=1">Perfil</a>
                        </li>   
                    </c:if>
                    <c:if test="${sessionScope.cliente.nome != null}">
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="protegido/cliente/Pedidos.jsp">Pedidos</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.cliente.nome == null}">
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="loginCliente.jsp"><i class="fas fa-shopping-cart" aria-hidden="true"></i></a>
                        </li>   
                    </c:if>
                    <c:if test="${sessionScope.cliente.nome != null}">
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="protegido/produto/CadastroCarrinhoServlet?ope=1&id_cliente=${cliente.id}"><i class="fas fa-shopping-cart" aria-hidden="true"></i></a>
                        </li> 
                    </c:if>
                </ul>
            </div> 
        </nav>

        <div class="container mt-4 p-4" style="background-color: white; border-radius: 20px">
            <form>
                <div class="input-group">
                    <input class="form-control" type="search" placeholder="Pesquisar" aria-label="Search">
                    <div class="input-group-append">
                        <a class="btn bg-light border">
                            <i class="fas fa-search" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
            </form>
        </div>
        <div class="container-fluid p-5 mt-4" style="background-color: white;">
            <h1 class="text-center display-3">Celulares Apple</h1>
        </div>
        <div class="container-fluid mt-4 p-4" style="background-color: white">
            <div class="p-4" style="background-color: #006C75; border-radius: 20px">
                <div class="row m-sm-2">
                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto4" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto4" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto4" data-slide-to="1"></li>
                                    <li data-target="#produto4" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone11-yellow-select-2019.png" alt="iphone 11 amarelo" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone11-red-select-2019.png" alt="iphone 11 vermelho" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone11-purple-select-2019.png" alt="iphone 11 roxo" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto4" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto4" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 11 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=4" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>
                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto5" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto5" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto5" data-slide-to="1"></li>
                                    <li data-target="#produto5" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone-13-blue-select-2021.png" alt="iphone 13 azul" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-13-pink-select-2021.png" alt="iphone 13 rosa" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-13-green-select.png" alt="iphone 13 verde" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto5" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto5" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 13 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=5" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>
                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto6" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto6" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto6" data-slide-to="1"></li>
                                    <li data-target="#produto6" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone-12-black-select-2020.png" alt="iphone 12 preto" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-blue-select-2020.png" alt="iphone 12 azul" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-green-select-2020.png" alt="iphone 12 verde" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto6" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto6" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 12 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=6" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>

                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto6" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto6" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto6" data-slide-to="1"></li>
                                    <li data-target="#produto6" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone-12-black-select-2020.png" alt="iphone 12 preto" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-blue-select-2020.png" alt="iphone 12 azul" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-green-select-2020.png" alt="iphone 12 verde" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto6" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto6" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 12 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=6" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>
                </div>

                <div class="row m-sm-2">
                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto4" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto4" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto4" data-slide-to="1"></li>
                                    <li data-target="#produto4" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone11-yellow-select-2019.png" alt="iphone 11 amarelo" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone11-red-select-2019.png" alt="iphone 11 vermelho" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone11-purple-select-2019.png" alt="iphone 11 roxo" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto4" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto4" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 11 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=4" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>
                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto5" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto5" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto5" data-slide-to="1"></li>
                                    <li data-target="#produto5" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone-13-blue-select-2021.png" alt="iphone 13 azul" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-13-pink-select-2021.png" alt="iphone 13 rosa" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-13-green-select.png" alt="iphone 13 verde" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto5" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto5" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 13 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=5" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>
                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto6" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto6" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto6" data-slide-to="1"></li>
                                    <li data-target="#produto6" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone-12-black-select-2020.png" alt="iphone 12 preto" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-blue-select-2020.png" alt="iphone 12 azul" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-green-select-2020.png" alt="iphone 12 verde" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto6" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto6" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 12 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=6" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>

                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto6" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto6" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto6" data-slide-to="1"></li>
                                    <li data-target="#produto6" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone-12-black-select-2020.png" alt="iphone 12 preto" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-blue-select-2020.png" alt="iphone 12 azul" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-green-select-2020.png" alt="iphone 12 verde" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto6" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto6" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 12 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=6" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>
                </div>

                <div class="row m-sm-2">
                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto4" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto4" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto4" data-slide-to="1"></li>
                                    <li data-target="#produto4" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone11-yellow-select-2019.png" alt="iphone 11 amarelo" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone11-red-select-2019.png" alt="iphone 11 vermelho" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone11-purple-select-2019.png" alt="iphone 11 roxo" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto4" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto4" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 11 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=4" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>
                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto5" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto5" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto5" data-slide-to="1"></li>
                                    <li data-target="#produto5" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone-13-blue-select-2021.png" alt="iphone 13 azul" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-13-pink-select-2021.png" alt="iphone 13 rosa" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-13-green-select.png" alt="iphone 13 verde" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto5" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto5" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 13 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=5" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>
                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto6" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto6" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto6" data-slide-to="1"></li>
                                    <li data-target="#produto6" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone-12-black-select-2020.png" alt="iphone 12 preto" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-blue-select-2020.png" alt="iphone 12 azul" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-green-select-2020.png" alt="iphone 12 verde" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto6" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto6" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 12 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=6" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>

                    <div class="col-md p-sm-2 ml-md-1">
                        <div class="card mx-auto border-0 shadow-sm" style="width:400px">
                            <div id="produto6" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                    <li data-target="#produto6" data-slide-to="0" class="active"></li>
                                    <li data-target="#produto6" data-slide-to="1"></li>
                                    <li data-target="#produto6" data-slide-to="2"></li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="protegido/produto/Resources/iphone-12-black-select-2020.png" alt="iphone 12 preto" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-blue-select-2020.png" alt="iphone 12 azul" width="100%" height="auto">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="protegido/produto/Resources/iphone-12-green-select-2020.png" alt="iphone 12 verde" width="100%" height="auto">
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#produto6" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#produto6" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Apple Iphone 12 <small>R$ 4000.00</small></h4>
                                <p class="card-text"></p>
                                <a href="protegido/produto/VisualizarServlet?id=6" class="btn btn-dark">Ir para o produto</a>
                            </div>
                        </div>                    
                    </div>
                </div>
            </div>
        </div>      
    </body>
</html>
