<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Tela Principal</title>
    </head>

    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/Login.jsp">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
            <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"></path>
            </svg>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Ligar navegacao">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav mr-auto">
                <c:if test="${sessionScope.usuario.isADM()}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Usuários</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown01">
                            <button class="dropdown-item"><a href="usuario/cadastro.jsp">Cadastrar Usuário</a></button>
                            <button class="dropdown-item"><a href="../protegido/usuario/ListarUsuarioServlet?ope=0">Listar Usuário</a></button>
                            <button class="dropdown-item"><a href="usuario/busca.jsp">Buscar Usuário</a></button>
                        </div>
                    </li>
                </c:if>
                <c:if test="${sessionScope.usuario.isEST() || sessionScope.usuario.isADM()}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Produto</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown01">
                            <button class="dropdown-item"><a href="../protegido/produto/ListarProdutoServlet?ope=0">Listar Produto</a></button>
                        </div>
                    </li>
                </c:if>
                 <c:if test="${sessionScope.usuario.isEST()}">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pedidos</a>
                    <div class="dropdown-menu">
                        <button class="dropdown-item"><a href="../protegido/produto/StatusPedidoServlet?ope=0">Status dos pedidos</a></button>
                    </div>
                </li>
                </c:if>
            </ul>
        </div>
    </nav>

    <main role="main" class="container" style="margin-top: 64px" id="conteudo">

        <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center">
            <div class="col-md-5 p-lg-5 mx-auto my-5">
                <h2 class="display-5 font-weight-normal">Tades Ltda</h2>
                <p class="lead font-weight-normal">Construindo um futuro para todos.</p>
                <img src="produto/Resources/logo.png" width="70">
            </div>
        </div>


        <hr class="featurette-divider">



        <hr class="featurette-divider">



        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Bem-vindo, ${sessionScope.usuario.nome} ao Sistema</h2>  
            </div>
        </div>

        <hr class="featurette-divider">

        </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>

</html>