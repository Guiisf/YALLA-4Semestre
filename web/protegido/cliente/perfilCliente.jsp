 <%-- 
    Document   : perfilCliente
    Created on : 24/04/2022, 18:08:07
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

        <title>Perfil</title>
        <script language=javascript>
            function confirmacao() {
            if (confirm("Deseja Realmente Sair?"))
                location="LoginClienteServlet";
            }
        </script>
</head>
<body style="background-color: #006C75">
    <header class="fixed-top bg-dark pb-3">
        <div class="container">
            <div class="d-flex justify-content-between mt-3">
                <a class="btn text-white px-4" href="Principal.jsp">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
                </a>
                <a class="btn text-danger border-danger" onclick="confirmacao();">Logout</a>
            </div>
        </div>
    </header>
    <div class="container-fluid bg-dark shadow" style="height: 250px"></div>
    <div class=" container bg-light shadow-lg mx-lg-auto p-5" style="top: -100px; position: relative; border-radius: 15px;">
        <div class="text-center mb-5">
            <!-- Imagem do usuário aqui -->
            <img src="protegido/produto/Resources/sem-foto.jpg" alt="Foto de perfil" class="rounded-circle border" style="max-width: 400px; max-height: 400px">
            <!-- Nome do usuário aqui -->
            <h2 class="display-4">${clienteAtualizacao.nome}</h2>
            <button class="btn bg-transparent rounded-circle" data-toggle="modal" data-target="#mudarNome" data-toggle="tooltip" title="Editar nome">
                <i class="fa fa-pen" aria-hidden="true"></i>
            </button>
        </div>
        <div class="container">
            <h2 class="ml-sm-3">Suas informações</h2>
            <ul class="list-group mx-auto mb-5">
                <li class="list-group-item d-flex justify-content-between pb-0">
                    <h4 class="flex-fill">Data de nascimento</h4>
                    <p>${clienteAtualizacao.nascimento}</p>
                    <button class="btn bg-transparent pt-0 rounded-circle" data-toggle="modal" data-target="#mudarData" data-toggle="tooltip" title="Editar data">
                        <i class="fa fa-pen" aria-hidden="true"></i>
                    </button>
                </li>
                <li class="list-group-item d-flex justify-content-between pb-0">
                    <h4 class="flex-fill">Sua senha</h4>
                    <p>*****</p>
                    <button class="btn bg-transparent pt-0 rounded-circle" data-toggle="modal" data-target="#mudarSenha" data-toggle="tooltip" title="Mudar senha">
                        <i class="fa fa-pen" aria-hidden="true"></i>
                    </button>
                </li>
                <li class="list-group-item d-flex justify-content-between pb-0">
                    <h4 class="flex-fill">Seu e-mail</h4>
                    <p>${clienteAtualizacao.email}</p>
                    <!-- <button class="btn bg-transparent pt-0 rounded-circle" data-toggle="modal" data-target="#mudarEmail" data-toggle="tooltip" title="Editar e-mail">
                        <i class="fa fa-pen" aria-hidden="true"></i>
                    </button> -->
                </li>
                <li class="list-group-item d-flex justify-content-between pb-0">
                    <h4 class="flex-fill">Seu CPF</h4>
                    <p>${clienteAtualizacao.cpf}</p>
                    <!-- <button class="btn bg-transparent pt-0 rounded-circle" data-toggle="modal" data-target="#mudarCPF" data-toggle="tooltip" title="Editar CPF">
                        <i class="fa fa-pen" aria-hidden="true"></i>
                    </button> -->
                </li>
            </ul>
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
                    <!--<button class="btn bg-white my-auto flex-fill border" data-toggle="modal" data-target="#adicionarEndereco" data-toggle="tooltip" title="Editar endereço">
                            <i class="fa fa-pen" aria-hidden="true"></i>
                        </button> -->
                        <div class="bg-white my-auto border text-center p-2 flex-fill" data-toggle="tooltip" title="Endereço principal">
                            <input type="radio" name="optradio" checked style="bottom: -55px; position: relative">
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="d-flex justify-content-center mt-5">
                <button class="btn bg-white rounded-circle shadow-sm" data-toggle="modal" data-target="#adicionarEndereco" data-toggle="tooltip" title="Adicionar endereço">
                    <i class="fa fa-plus"></i>
                </button>
            </div>
        </div>
    </div>

    <!-- Caixinha para alterar o nome -->
    <form class="modal" id="mudarNome" action="CadastroClienteServlet" method="POST">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Mude seu nome</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="d-sm-inline flex-fill mr-sm-1">
                        <input class="form-control" type="text" name="prnome" required placeholder="Nome">
                    </div>
                    <div class="d-sm-inline flex-fill">
                        <input class="form-control" type="text" name="sgnome" required placeholder="Sobrenome">
                    </div>
                </div>
                <c:if test="${not empty clienteAtualizacao}">
                    <input type="hidden" name="id" value="${clienteAtualizacao.id}" class="form-control"/>
                    <input type="hidden" name="cpf" value="${clienteAtualizacao.cpf}" class="form-control"/>
                    <input type="hidden" name="datemax" value="${clienteAtualizacao.nascimento}" class="form-control"/>
                    <input type="hidden" name="email" value="${clienteAtualizacao.email}" class="form-control"/>
                    <input type="hidden" name="senha2" value="${clienteAtualizacao.senha}" class="form-control"/>
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <div class="modal-footer">
                    <button type="submit" class="btn bg-primary text-white" >Confirmar</button>
                </div>
            </div>                
        </div>
    </form>
    <!-- Caixinha para alterar a data de nascimento -->
    <form class="modal" id="mudarData" action="CadastroClienteServlet" method="POST">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Mude seu aniversário</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <input class="form-control" type="date" id="datemax" required name="datemax" max="2022-12-31">
                </div>
                <c:if test="${not empty clienteAtualizacao}">
                    <input type="hidden" name="id" value="${clienteAtualizacao.id}" class="form-control"/>
                    <input type="hidden" name="cpf" value="${clienteAtualizacao.cpf}" class="form-control"/>
                    <input type="hidden" name="prnome" value="${clienteAtualizacao.nome}" class="form-control"/>
                    <input type="hidden" name="sgnome" value="" class="form-control"/>
                    <input type="hidden" name="email" value="${clienteAtualizacao.email}" class="form-control"/>
                    <input type="hidden" name="senha2" value="${clienteAtualizacao.senha}" class="form-control"/>
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <div class="modal-footer">
                    <button type="submit" class="btn bg-primary text-white">Confirmar</button>
                </div>
            </div>                
        </div>
    </form>
    <!-- Caixinha para alterar o e-mail -->
    <form class="modal" id="mudarEmail" action="CadastroClienteServlet" method="POST">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Mude seu e-mail</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <input class="form-control" required type="email" name="email" placeholder="exemplo@mail.com">
                </div>
                <div class="modal-footer">
                    <c:if test="${not empty clienteAtualizacao}">
                        <input type="hidden" name="id" value="${clienteAtualizacao.id}" class="form-control"/>
                        <input type="hidden" name="cpf" value="${clienteAtualizacao.cpf}" class="form-control"/>
                        <input type="hidden" name="datemax" value="${clienteAtualizacao.nascimento}" class="form-control"/>
                        <input type="hidden" name="prnome" value="${clienteAtualizacao.nome}" class="form-control"/>
                        <input type="hidden" name="sgnome" value="" class="form-control"/>
                        <input type="hidden" name="senha2" value="${clienteAtualizacao.senha}" class="form-control"/>
                        <input type="hidden" name="ope" value="1"/>
                    </c:if>
                    <button type="submit" class="btn bg-primary text-white">Confirmar</button>
                </div>
            </div>                
        </div>
    </form>
    <!-- Caixinha para alterar a senha -->
    <form class="modal" id="mudarSenha" action="CadastroClienteServlet" method="POST">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Mude sua senha</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="d-sm-inline flex-fill mr-sm-1">
                        <input class="form-control" type="password" required id="senhaConfir" name="senhaConfir" placeholder="Nova senha">
                    </div>
                    <div class="d-sm-inline flex-fill">
                        <input class="form-control" type="password" required id="senha" name="senha" placeholder="Confirme a senha">
                    </div>
                </div>
                <c:if test="${not empty clienteAtualizacao}">
                    <input type="hidden" name="id" value="${clienteAtualizacao.id}" class="form-control"/>
                    <input type="hidden" name="cpf" value="${clienteAtualizacao.cpf}" class="form-control"/>
                    <input type="hidden" name="email" value="${clienteAtualizacao.email}" class="form-control"/>
                    <input type="hidden" name="datemax" value="${clienteAtualizacao.nascimento}" class="form-control"/>
                    <input type="hidden" name="prnome" value="${clienteAtualizacao.nome}" class="form-control"/>
                    <input type="hidden" name="sgnome" value="" class="form-control"/>
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <div class="modal-footer">
                    <button type="submit" class="btn bg-primary text-white">Confirmar</button>
                </div>
            </div>
        </div>
    </form>
    <!-- Caixinha para alterar o CPF -->
    <form class="modal" id="mudarCPF" action="CadastroClienteServlet" method="POST">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Mude seu CPF</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <input class="form-control" required placeholder="___.___.___-__" name="cpf" id="cpf" type="text">
                </div>
                <c:if test="${not empty clienteAtualizacao}">
                    <input type="hidden" name="id" value="${clienteAtualizacao.id}" class="form-control"/>
                    <input type="hidden" name="email" value="${clienteAtualizacao.email}" class="form-control"/>
                    <input type="hidden" name="datemax" value="${clienteAtualizacao.nascimento}" class="form-control"/>
                    <input type="hidden" name="prnome" value="${clienteAtualizacao.nome}" class="form-control"/>
                    <input type="hidden" name="senha2" value="${clienteAtualizacao.senha}" class="form-control"/>
                    <input type="hidden" name="sgnome" value="" class="form-control"/>
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <div class="modal-footer">
                    <button type="submit" class="btn bg-primary text-white">Confirmar</button>
                </div>
            </div>                
        </div>
    </form>
    <!-- Caixinha para alterar/adicionar novo endereço -->
    <form class="modal" id="adicionarEndereco" action="EnderecoServlet" method="POST">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Seu endereço</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <input class="form-control" type="text" id="cep" name="cep" placeholder="_____-___">
                        <div class="d-sm-inline flex-grow-1 mr-sm-1">
                            <input class="form-control" type="text" id="rua" name="rua" placeholder="Rua">
                        </div>
                        <input class="form-control" type="number" id="numero" min="0" name="num" placeholder="Nº">
                    </div>           
                    <div class="input-group mb-3">
                        <input class="form-control" type="text" id="complemento" name="complemento" placeholder="Complemento">
                    </div>
                    <div class="input-group mb-3">
                        <div class="d-sm-inline flex-fill mr-sm-1">
                            <input class="form-control" type="text" id="bairro" name="bairro" placeholder="Bairro">
                        </div>
                        <div class="d-sm-inline flex-fill mr-sm-1">
                            <input class="form-control" type="text" id="cidade" name="cidade" placeholder="Cidade">
                        </div>
                        <input class="form-control" type="text" id="uf" name="uf" placeholder="UF">
                    </div>
                </div>
                <c:if test="${not empty clienteAtualizacao}">
                    <input type="hidden" name="id"
                           value="${clienteAtualizacao.id}" 
                           required
                           class="form-control"/>
                </c:if>
                <div class="modal-footer">
                    <button type="submit" class="btn bg-primary text-white">Confirmar</button>
                </div>
            </div>                
        </div>
    </form>


    <script type="text/javascript">

        $("#cpf").inputmask({"mask": "999.999.999-99"});
        //m?scara do cep
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
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
        var password = document.getElementById("senhaConfir"),
                confirm_password = document.getElementById("senha");

        function validatePassword() {
            if (password.value !== confirm_password.value) {
                alert("Senhas diferentes!");
            }
        }

        confirm_password.onchange = validatePassword;
    </script>
</body>
</html>
