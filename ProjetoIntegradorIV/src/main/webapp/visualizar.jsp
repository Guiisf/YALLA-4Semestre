
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>${Produto.nome}</title>
        <script src="${pageContext.request.contextPath}/lib/jquery-3.6.0.min.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/lib/bootstrap-4.1.3-dist/css/bootstrap.min.css"
              rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <script type="text/javascript">
            $(document).ready(function () {
                $('#carousel').find('.carousel-item').first().addClass('active');
            });
        </script>
    </head>
    <body style="background-color: #006C75; overflow-x: hidden">
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
                        <a class="nav-link" href="../../Principal.jsp">Home</a>
                    </li>
                    <li class="nav-item dropdown mx-3">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            Produtos
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Celulares Apple</a>
                            <a class="dropdown-item" href="#">Celulares Samsung</a>
                        </div>
                    </li>
                    <c:if test="${sessionScope.cliente.nome == null}">
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="../../loginCliente.jsp">Login</a>
                        </li>   
                    </c:if>
                    <c:if test="${sessionScope.cliente.nome != null}">
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="../../CadastroClienteServlet?CPFCliente=${cliente.cpf}&ope=1">Perfil</a>
                        </li>   
                    </c:if>
                    <c:if test="${sessionScope.cliente.nome != null}">
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="protegido/cliente/Pedidos.jsp">Pedidos</a>
                        </li>
                    </c:if>
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="../produto/CadastroCarrinhoServlet?ope=1"><i class="fas fa-shopping-cart" aria-hidden="true"></i></a>
                        </li>
                </ul>
            </div> 
        </nav>
        <div class="container">
            <c:if test="${sessionScope.usuario.isEST() || sessionScope.usuario.isADM()}">
                <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/protegido/index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                        <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"></path>
                        </svg>
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Ligar navegacao">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </nav>
                <br>
                <br>
                <br>
            </c:if>
            <div class="container mt-4 p-4" style="background-color: white; border-radius: 20px">
                <div class="mx-auto bg-light text-center" style="max-width: 600px; padding: 100px">
                    <h1 class="display-4 font-weight-normal">${Produto.nome}</h1>
                    <p class="lead font-weight-normal">${Produto.descricao}</p>
                        <form action="CadastroCarrinhoServlet" method="POST">
                            <input type="hidden" name="id_produto" value="${Produto.codigo}" class="form-control"/>
                            <button class="btn btn-outline-secondary bg-primary text-white mt-sm-5" type="submit">Adicionar ao carrinho</button>
                        </form>
                </div>
            </div>
            <div class="container mt-4 p-4" style="background-color: white; border-radius: 20px">
                <div class="row p-4">
                    <div class="col bg-light">
                        <div class="mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center">
                            <div class="my-3 p-3">
                                <h2 class="display-4">Valor de mercado</h2>
                                <h4>${Produto.valor}</h4>
                            </div>
                            <div class="bg-dark shadow-sm mx-auto" style="width: 90%; height: 0; border-radius: 21px 21px 0 0;"></div>
                            <img src="${Produto.imgReferencia}" width="350">
                        </div>
                    </div>
                    <div class="col bg-primary">
                        <div class="mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white">
                            <div class="my-3 py-3">
                                <h2 class="display-4">Avaliação do produto</h2>
                                <h4>${Produto.avaliacao}</h4>
                            </div>
                            <div class="bg-light shadow-sm mx-auto"></div>
                            <img src="${Produto.imgReferencia}" width="350">
                        </div>
                    </div>
                </div>
            </div>
            <div class="container mt-4 pt-4" style="background-color: white; border-radius: 20px">

                <div class="mx-auto" style="width: 80%">
                    <div id="carousel" class="carousel slide carousel-fade" data-ride="carousel" style="margin-bottom: 40px;">
                        <ol class="carousel-indicators">
                            <c:forEach var="imagem" items="${listaImagens}" >
                                <li data-target="#carousel" data-slide-to=""></li>
                                </c:forEach>
                        </ol>
                        <div class="carousel-inner">
                            <c:forEach var="imagem" items="${listaImagens}" >
                                <div class="carousel-item">
                                    <img src="<c:url value="${ imagem['caminho']}" />" role="img" aria-label=" :  " preserveAspectRatio="xMidYMid slice" focusable="false" width="100%" height="100%"/>
                                </div>
                            </c:forEach>
                        </div>
                        <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Anterior</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Pr&oacute;xima</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <footer class="container-fluid py-5 text-white bg-dark mt-4">
            <div class="row">
                <div class="col-12 col-md">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mb-2"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
                    <small class="d-block mb-3 text-muted">© 2022-2022</small>
                </div>
                <div class="col-6 col-md">
                    <h5>Fontes</h5>
                    <ul class="list-unstyled text-small">
                        <li><a class="text-muted" href="#">Fonte</a></li>
                        <li><a class="text-muted" href="#">Nome da fonte</a></li>
                        <li><a class="text-muted" href="#">Outra fonte</a></li>
                        <li><a class="text-muted" href="#">Fonte final</a></li>
                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5>Sobre</h5>
                    <ul class="list-unstyled text-small">
                        <li><a class="text-muted" href="#">Equipe</a></li>
                        <li><a class="text-muted" href="#">Locais</a></li>
                        <li><a class="text-muted" href="#">Privacidade</a></li>
                        <li><a class="text-muted" href="#">Termos</a></li>
                    </ul>
                </div>
            </div>
        </footer>
    </body>
</body>