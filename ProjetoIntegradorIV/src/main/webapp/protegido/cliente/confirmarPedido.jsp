

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
        <script type="text/javascript">
            function FormadePagamento() {
                var formaPagamento;
                if (document.querySelector('#radio1').checked) {
                    formaPagamento = "boleto";
                } else {
                    formaPagamento = "cartao";
                }
                location.href = "../../CadastroPedidoServlet?forma_pagemento=" + formaPagamento;
            }
        </script>
        <title>Carrinho</title>
    </head>
    <body class="" style="background-color: #006C75">
        <header class="fixed-top bg-dark pb-3">
            <div class="container">
                <div class="d-flex justify-content-center mt-3">
                    <a class="btn text-white px-4" href="../../Principal.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
                    </a>
                </div>
            </div>
        </header>
        <div class="container-fluid bg-dark shadow" style="height: 250px"></div>
        <div class="container shadow border bg-light p-5 mb-sm-5" style="top: -50px; position: relative; border-radius: 15px;">
            <a href="../../protegido/produto/CadastroCarrinhoServlet?ope=1&id_cliente=${cliente.id}" classradio1="btn btn-lg" data-toggle="tooltip" title="Voltar"><i class="fas fa-angle-left"></i></a>
            <h1 class="display-4 text-center mb-sm-5">Método de pagamento</h1>
            <div class="border-bottom border-top p-5">
                <h3>Forma de Pagamento</h3>
                <div class="form-check mt-5">
                    <label class="form-check-label" for="radio1">
                        <input type="radio" class="form-check-input" id="radio1" name="optradio" value="boleto" data-toggle="modal" data-target="#boleto"><h3>Boleto</h3>
                    </label>
                </div>
                <div class="form-check mt-sm-3">
                    <label class="form-check-label" for="radio2">
                        <input type="radio" class="form-check-input" id="radio2" name="optradio" value="cartao" data-toggle="modal" data-target="#cartao"><h3>Cartão de crédito/débito</h3>
                    </label>
                </div>
                <div class="text-center mt-5">
                    <a class="btn btn-lg bg-primary text-white" onclick="FormadePagamento()">Continuar</a>
                </div>
            </div>
        </div>
        <form class="modal" id="cartao">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Novo cartão</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="d-sm-inline flex-fill m-sm-3">
                            <input class="form-control" type="text" required id="nomeCartao" name="nome" placeholder="Nome no cartão">
                        </div>
                        <div class="d-sm-inline flex-fill m-sm-3">
                            <input class="form-control" type="text" required id="numeroCartao" name="numero" placeholder="Número">
                        </div>
                        <div class="d-flex">
                            <div class="d-sm-inline flex-fill">
                                <input class="form-control" type="text" required id="codigoCartao" name="cvv" placeholder="Validade">
                            </div>
                            <div class="d-sm-inline flex-fill">
                                <input class="form-control" type="text" required id="codigoCartao" name="cvv" placeholder="CVV">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-lg bg-primary text-white">Confirmar</button>
                    </div>
                </div>
            </div>
            <form>
                <div class="m-4s">
                    <div class="form-check-inline">
                        <label class="form-check-label" for="radio1">
                            <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>Crédito
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label" for="radio2">
                            <input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">Débito
                        </label>
                    </div>
                </div>
            </form>
            <div class="modal-footer">
                <button class="btn bg-primary text-white">Confirmar</button>
            </div>
        </form>
        <form class="modal" id="boleto">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Boleto</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="m-sm-5 text-center">
                            <button type="button" class="btn btn-lg bg-primary text-white">Gerar boleto</button>
                        </div>
                        <div class="m-sm-5 text-center">
                            <h3>"Código do boleto aqui!"</h3>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-lg bg-primary text-white">Confirmar</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
