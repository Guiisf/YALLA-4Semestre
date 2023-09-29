<%-- 
    Document   : Carrinho
    Created on : 02/05/2022, 16:23:36
    Author     : Gabriel Lima
--%>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3/jquery.inputmask.bundle.js"></script>
        <title>Carrinho</title>
        <script type="text/javascript">
            function AlterarQuantidade(id_produto, quantidade) {
                location.href = "CadastroCarrinhoServlet?ope=1&id_produto=" + id_produto + "&quantidade=" + quantidade;
            }
        </script>
    </head>
    <body class="" style="background-color: #006C75">
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
            <h1 class="display-4 text-center mb-sm-5">Carrinho</h1>
            <c:forEach var="produto" items="${listaCarrinho}">
                <div class="media border-top border-bottom p-2 my-1">
                    <img src="<c:url value="${ produto['caminho']}" />" alt="12-black" class="mr-3 mt-3 d-md-block d-none" style="width:200px; height: auto; overflow: hidden">
                    <div class="media-body align-self-end">
                        <div class="row">
                            <div class="col-sm">
                                <h4 class="text-sm-left text-center mt-sm-0 mt-4">${produto.nome}</h4>
                                <p class="text-sm-left text-center">Melhor produto do mercado</p>   
                            </div>
                            <div class="col-sm text-right">
                                <div class="">
                                    <a class="btn bg-transparent text-danger" href="CadastroCarrinhoServlet?ope=2&id_produto=${produto.codigo}">Excluir</a>
                                </div>
                                <h2>${produto.valor}</h2>
                                <label>Quantidade:</label>
                                <br>
                                <!-- Nota: Aqui, tu pode fazer a quantidade options conforme a disponibilidade do estoque -->
                                <select class="form-control float-right text-center" onblur="AlterarQuantidade(${produto.codigo}, this.value)" 
                                        id="sellist1" value="${produto.quantidade}" name="sellist1" style="max-width: 100px">
                                    <option <c:if test="${produto.quantidade == 1}">selected</c:if> value="1">1</option>
                                    <option <c:if test="${produto.quantidade == 2}">selected</c:if> value="2">2</option>
                                    <option <c:if test="${produto.quantidade == 3}">selected</c:if> value="3">3</option>
                                    <option <c:if test="${produto.quantidade == 4}">selected</c:if> value="4">4</option>
                                    <option <c:if test="${produto.quantidade == 5}">selected</c:if> value="5">5</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
            </c:forEach>
            <div class="d-flex flex-column text-sm-right text-center my-sm-4">
                <h3>Sub-total</h3>
                <h5>${subtotal}</h5>
            </div>
            <div class="row">
                <div class="col-sm">
                    <div>
                        <c:if test="${sessionScope.cliente.nome != null}">
                            <ul class="nav nav-tabs justify-content-between" role="tablist">
                                <li class="nav-item flex-fill">
                                    <a class="nav-link active text-center" data-toggle="tab" href="#novo">Novo endereço</a>
                                </li>
                                <li class="nav-item flex-fill">
                                    <a class="nav-link text-center" data-toggle="tab" href="#salvos">Seus endereços</a>
                                </li>
                            </ul>
                        </c:if>
                        <div class="tab-content">
                            <div id="novo" class="container tab-pane active"><br>
                                <div class="col-sm mt-4 d-flex">
                                    <div>
                                        <h4 class="">Calcule seu frete</h4>
                                        <div class="form-group">
                                            <input class="form-control" type="text" id="cep" name="cep" placeholder="_____-___" onblur="location.href = 'CadastroCarrinhoServlet?ope=3&CEP='this.value">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="salvos" class="container tab-pane fade"><br>
                                <h2 class="ml-sm-3">Seus endereços</h2>
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
                                                <input type="radio" <c:if test="${CEP == enderecos.CEP}">checked</c:if> name="optradio" onclick="location.href='CadastroCarrinhoServlet?ope=3&CEP=${enderecos.CEP}'" style="bottom: -55px; position: relative">
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="d-flex flex-column text-sm-right text-center mt-4">
                        <h3 class="">Frete</h3>
                        <h6>Padrão</h6>
                        <h5>${frete}</h5>
                        <h3>Total</h3>
                        <h5>${total}</h5>
                        <div class="d-flex align-self-sm-end align-self-center">
                            <div class="mt-sm-3 mt-4">
                                <c:if test="${sessionScope.cliente.nome != null}">
                                    <a class="btn btn-lg bg-primary text-white" href="/ProjetoIntegradorIV/protegido/cliente/confirmarPedido.jsp">Continuar</a>
                                </c:if>
                                <c:if test="${sessionScope.cliente.nome == null}">
                                    <a class="btn btn-lg bg-primary text-white" href="../../loginCliente.jsp">Continuar</a>
                                </c:if>    
                            </div>
                        </div>
                    </div>
                </div>
            </div>           
        </div>
        <script type="text/javascript">
            //máscara do cep
            $("#cep").inputmask({"mask": "99999-999"});

            $("#cep").focusout(function () {
                //Início do Comando AJAX
                $.ajax({
                    //O campo URL diz o caminho de onde virá os dados
                    //É importante concatenar o valor digitado no CEP
                    url: 'https://viacep.com.br/ws/' + $(this).val() + '/json/',
                    //Aqui você deve preencher o tipo de dados que será lido,
                    //no caso, estamos lendo JSON.
                    dataType: 'json',
                    //SUCESS é referente a função que será executada caso
                    //ele consiga ler a fonte de dados com sucesso.
                    //O parâmetro dentro da função se refere ao nome da variável
                    //que você vai dar para ler esse objeto.
                    success: function (resposta) {
                        //Agora basta definir os valores que você deseja preencher
                        //automaticamente nos campos acima.
                        if (!("erro" in resposta)) {
                            $("#rua").val(resposta.logradouro);
                            $("#complemento").val(resposta.complemento);
                            $("#bairro").val(resposta.bairro);
                            $("#cidade").val(resposta.localidade);
                            $("#uf").val(resposta.uf);
                            //Vamos incluir para que o Número seja focado automaticamente
                            //melhorando a experiência do usuário
                            $("#numero").focus();
                        } else {
                            //CEP não Encontrado.
                            alert("CEP não encontrado.");
                        }
                    }
                });
            });
        </script>
    </body>
</html>
