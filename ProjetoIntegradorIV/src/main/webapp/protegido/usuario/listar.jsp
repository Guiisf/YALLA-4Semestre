
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Listar usuários</title>
        <script type="text/javascript">
            function confirmarStatus(nome, cpf) {
                console.log("Confirmar alteração ", nome, cpf);
                idColaborador = cpf;
                var paragrafoCliente = $("#campoTextoStatus");
                paragrafoCliente.html(nome + " - " + cpf);

                var modalConfirmacao = $("#modalStatus");
                modalConfirmacao.show();
            }

            function fecharModalStatus() {
                var modalConfirmacao = $("#modalStatus");
                modalConfirmacao.hide();
            }

            function status() {
                console.log("Alterando usuário(a) ", idColaborador);
                fecharModalStatus();
                var url = "CadastroUsuarioServlet?ope=2&CPFUsuario=" + idColaborador;
                $.ajax(url).done(function () {
                    console.log("Usuário(a) Alterado!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function () {
                        alerta.css("display", "none");
                        location.reload();
                    }, 1000)
                }).fail(function () {
                    console.log("Erro ao alterar o usuário!");
                })
            }
        </script>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <div id="alerta" class="alert alert-success" role="alert" style="display:none">
            Usuario(a) Alterado(a) com sucesso!
        </div>
        <br><br><br>
        <h1><center>Usuários</center></h1>
        <br>
        <div class="modal" tabindex="-1" role="dialog" id="modalStatus">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirmar Alteração</h5>                       
                    </div>
                    <div class="modal-body">
                        <p>Confirmar Alteração do usuário abaixo?</p>
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
        <table class="table" aling="center" id="tabela">
            <thead>
            <td>Nome</td><td>Categoria</td><td>CPF</td><td>Ativo</td>
            </thead>
            <tbody>
                <c:forEach var="usuario" items="${listaUsuarios}">
                    <tr>
                        <td>${usuario.nome}</td>
                        <td>${usuario.categoria}</td>
                        <td>${usuario.cpf}</td>
                        <td>${usuario.ativo}</td>
                        <td><a href="../CadastroClienteServlet?CPFUsuario=${usuario.cpf}&ope=1" >Alterar</a></td>
                        <c:if test="${usuario.isAtivo()}">
                            <td><button onclick="confirmarStatus('${usuario.nome}', '${usuario.cpf}')" class="btn btn-link">Inativar</button></td>
                        </c:if>
                        <c:if test="${usuario.isNotAtivo()}">
                            <td><button onclick="confirmarStatus('${usuario.nome}', '${usuario.cpf}')" class="btn btn-link">Reativar</button></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <nav>
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="../usuario/ListarUsuarioServlet?ope=0">1</a></li>
                <li class="page-item"><a class="page-link" href="../usuario/ListarUsuarioServlet?ope=1">2</a></li>
                <li class="page-item"><a class="page-link" href="../usuario/ListarUsuarioServlet?ope=2">3</a></li>
            </ul>
        </nav>
    </fildset>
</body>
<a href="${pageContext.request.contextPath}/protegido/index.jsp">Voltar</a>
</html>
