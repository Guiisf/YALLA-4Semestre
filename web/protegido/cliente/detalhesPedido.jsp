<%-- 
    Document   : detalhesPedido
    Created on : 26/05/2022, 18:06:38
    Author     : Gabriel Lima
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a href="detalhesPedido.jsp"></a>
<!DOCTYPE html>
<html>
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

        <title>Carrinho</title>
    </head>
    <body style="background-color: #006C75">
        <header class="fixed-top bg-dark pb-3">
            <div class="container">
                <div class="d-flex justify-content-center mt-3">
                    <a class="btn text-white px-4" href="${pageContext.request.contextPath}/Principal.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
                    </a>
                </div>
            </div>
        </header>
        <div class="container-fluid bg-dark shadow" style="height: 250px"></div>
        <div class="container shadow border bg-light p-5 mb-sm-5" style="top: -50px; position: relative; border-radius: 15px;">
            <a href="/ProjetoIntegradorIV/protegido/cliente/confirmarPedido.jsp" class="btn btn-lg" data-toggle="tooltip" title="Voltar"><i class="fas fa-angle-left"></i></a>
            <h1 class="display-4 text-center mb-5">Resumo do pedido</h1>
            <div class="container p-sm-5 border-bottom border-top mt-sm-3">
                <br>
                <h3>Produtos:</h3>
                <c:forEach var="produto" items="${listaCarrinho}">

                    <div class="d-flex px-5">
                        <h5 class="flex-fill">${produto.nome}</h5>
                    </div>
                    <div class="d-flex px-5">
                        <h6 class="flex-fill">Quantidade: ${produto.quantidade}</h6>
                        <h5 class="text-center">R$${produto.valor}</h5>
                    </div>
                </c:forEach>
                <br>
                <h3>Endereço de entrega:</h3>
                <br>
                <div class="d-flex">
                    <div class="align-self-center">
                        <div class="pl-5">
                            <h5>${endereco.rua}, 325</h5>
                            <h5>${endereco.bairro} - ${endereco.cidade}, ${endereco.uf}</h5>
                            <h5>${endereco.CEP}</h5>
                        </div>
                    </div>
                    <div class="align-self-center p-5">
                        <button class="btn bg-light rounded-circle" data-toggle="modal" data-target="#endereco" data-toggle="tooltip" title="Mudar endereço de entrega">
                            <i class="fas fa-pen py-1" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
                <br>
                <h3>Frete</h3>
                <div class="d-flex px-5">
                    <h5 class="flex-fill">Padrão</h5>
                    <h6 class="align-self-end">R$${frete}</h6>
                </div>                
                <br>
                <h3>Método de pagamento:</h3>
                <h5 class="pl-5">${forma_pagamento}</h5>
                <br>
                <h3>Total:</h3>
                <h4 class="pl-5">R$${total}</h4>
            </div>
            <div class="d-flex align-self-sm-end align-self-center">
                <div class="mt-sm-3 mt-4">
                    <form Action="CadastroPedidoServlet" method="POST">
                        <input type="text" name="id_cliente" id="id_cliente" hidden value="${sessionScope.cliente.id}">
                        <input type="text" name="forma_pg" id="forma_pg" hidden value="${forma_pagamento}">
                        <div class="mt-5">
                            <button class="btn btn-lg bg-primary text-white" type="submit">Finalizar pedido</button> 
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <form class="modal" id="endereco">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Seus endereços</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <c:forEach var="enderecos" items="${listaEnderecos}">
                            <div class="d-flex justify-content-between mb-3">
                                <ul class="list-group flex-fill">
                                    <li class="list-group-item">${enderecos.CEP}</li>
                                        <c:if test="${not empty enderecos.complemento}">
                                        <li class="list-group-item">${enderecos.complemento}</li>
                                        </c:if>
                                        <c:if test="${empty enderecos.complemento}">
                                        <li class="list-group-item">"Complemento"</li>
                                        </c:if>
                                    <li class="list-group-item">${enderecos.cidade}</li>
                                </ul>
                                <ul class="list-group flex-fill">
                                    <li class="list-group-item">${enderecos.rua}</li>
                                    <li class="list-group-item">${enderecos.bairro}</li>
                                    <li class="list-group-item">${enderecos.uf}</li>
                                </ul>
                                <div class="d-flex flex-column">
                                    <div class="bg-white my-auto border text-center p-2 flex-fill" data-toggle="tooltip" title="Endereço principal">
                                        <input type="radio" name="optradio" onclick="location.href='CadastroPedidoServlet?forma_pagemento=${forma_pagamento}&CEP=${enderecos.CEP}'" <c:if test="${CEP == enderecos.CEP}">checked</c:if> style="bottom: -55px; position: relative">
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>