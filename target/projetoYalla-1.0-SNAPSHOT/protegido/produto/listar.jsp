<%-- 
    Document   : Listar
    Created on : 18/03/2022, 21:00:14
    Author     : Douglas Proença
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Lista de Produtos</title>
        <script type="text/javascript">

            function buscarProduto() {
                var campoBusca = $("#nomeProduto");
                $("#tabelaProdutos td").detach();
                var nomeProduto = campoBusca.val();
                var tamanhoBusca = nomeProduto.length;
                if (tamanhoBusca < 3) {
                    mostrarTelaAlerta("Digite, pelo menos, 3 caracteres");
                } else {
                    $('#tabelaColaboradores tbody').empty();
                    var url = "../produto/BuscaProduto?nomeProduto=" + nomeProduto;
                    $.ajax(url).done(function (resposta) {
                        // Retorno do servlet
                        var jsonClientes = JSON.parse(resposta);
                        if (jsonClientes.length === 0) {
                            mostrarTelaAlerta("A busca não encontrou resultados");
                        }
                        console.log(jsonClientes);
                        // Adicionando resultado na lista
                        jsonClientes.forEach(function (Produto) {
                            $("#tabelaProdutos").find('tbody')
                                    .append($('<tr>')
                                            .append($('<td>').append(Produto.codigo))
                                            .append($('<td>').append(Produto.nome))
                                            .append($('<td>').append(Produto.quantidade))
                                            .append($('<td>').append(Produto.valor))
                                            .append($('<td>').append(Produto.ativo))
                                            );
                        })




                    }).fail(function () {
                        console.log("Erro!");
                    })
                }

            }

            function confirmarStatus(nome, codigo) {
                console.log("Confirmar alteração ", nome, codigo);
                idProduto = codigo;
                var paragrafoCliente = $("#campoTextoStatus");
                paragrafoCliente.html(nome + " - " + codigo);

                var modalConfirmacao = $("#modalStatus");
                modalConfirmacao.show();
            }

            function fecharModalStatus() {
                var modalConfirmacao = $("#modalStatus");
                modalConfirmacao.hide();
            }

            function status() {
                console.log("Alterando produto ", idProduto);
                fecharModalStatus();
                var url = "CadastroProdutoServlet?ope=2&codigoProduto=" + idProduto;
                $.ajax(url).done(function () {
                    console.log("Produto Alterado!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function () {
                        alerta.css("display", "none");
                        location.reload();
                    }, 1000)
                }).fail(function () {
                    console.log("Erro ao alterar o Produto!");
                })
            }
        </script>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <br><br><br><br>
        <c:if test="${sessionScope.usuario.isADM()}">
            <div class="col-lg-12" style="text-align: right;">
                <a class="btn btn-primary" href="../produto/cadastro.jsp" role="button">+</a>
            </div>
        </c:if>
        <br><br>
        <div id="alerta" class="alert alert-success" role="alert" style="display:none">
            Produto alterado com sucesso!
        </div>
        <input type="search" id="nomeProduto" class="form-control"/><br/>
        <button onclick="buscarProduto()" class="btn btn-primary">Buscar</button>
        <br><br><br><br>
        <div class="modal" tabindex="-1" role="dialog" id="modalStatus">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirmar Alteração</h5>                       
                    </div>
                    <div class="modal-body">
                        <p>Confirmar alteração do produto abaixo abaixo?</p>
                        <p id="campoTextoStatus"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="fecharModalStatus()">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="status()">Confirmar</button>
                    </div>
                </div>
            </div>
        </div>
    <fildset>
        <table class="table" id="tabelaProdutos" aling="center">
            <thead>
            <th>Código</th><th>Nome</th><th>Quantidade</th><th>Valor</td><th>Ativo</th>
            </thead>
            <tbody>
                <c:forEach var="produto" items="${listaProdutos}">
                    <tr>
                        <td>${produto.codigo}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.quantidade}</td>
                        <td>${produto.valor}</td>
                        <td>${produto.ativo}</td>
                        <td><a href="../produto/CadastroProdutoServlet?codigoProduto=${produto.codigo}&ope=1" >Alterar</a></td>
                            <td><a href="../produto/VisualizarServlet?id=${produto.codigo}">Visualizar</a></td>
                            <c:if test="${sessionScope.usuario.isADM()}">
                            <c:if test="${produto.isAtivo()}">
                                <td><button onclick="confirmarStatus('${produto.nome}', '${produto.codigo}')" class="btn btn-link">Inativar</button></td>
                            </c:if>
                            <c:if test="${produto.isNotAtivo()}">
                                <td><button onclick="confirmarStatus('${produto.nome}', '${produto.codigo}')" class="btn btn-link">Reativar</button></td>
                            </c:if>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </fildset>
    <nav>
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="../produto/ListarProdutoServlet?ope=0">1</a></li>
            <li class="page-item"><a class="page-link" href="../produto/ListarProdutoServlet?ope=1">2</a></li>
            <li class="page-item"><a class="page-link" href="../produto/ListarProdutoServlet?ope=2">3</a></li>
        </ul>
    </nav>
</body>
<a href="${pageContext.request.contextPath}/protegido/index.jsp">Voltar</a>
</html>
