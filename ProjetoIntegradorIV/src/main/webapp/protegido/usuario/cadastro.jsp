

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Cadastro de Usuários</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
    </head>
    <body>
        <div class="container">
            <c:import url="../uteis/header.jsp"/>
            <br><br><br>
            <h1><center>Cadastro de Usuários</center></h1>
            <br><br>
            <form class="col-md-6 offset-md-3 jumbotron" action="CadastroUsuarioServlet" method="POST">
                <c:if test="${param.cpfInvalido != null}">
                    <div class="alert alert-danger" role="alert">
                        CPF Inválido!
                    </div>  
                </c:if>
                <c:if test="${param.mailInvalido != null}">
                    <div class="alert alert-danger" role="alert">
                        Esse e-mail já esta cadastrado no Sistema!
                    </div>  
                </c:if>
                <c:if test="${not empty clienteAtualizacao}">
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <div  class="form-group">
                    <label>Nome</label>
                    <input type="text" name="nomeUsuario" value="${clienteAtualizacao.nome}"
                           required class="form-control"/>
                </div>
                <br/>
                <c:if test="${empty clienteAtualizacao}">
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="emailUsuario" value="${clienteAtualizacao.email}"
                               required class="form-control"/>
                    </div>
                </c:if>
                <br/>
                <c:if test="${empty clienteAtualizacao}">
                    <div class="form-group">
                        <label>CPF</label>
                        <input type="text" name="CPFUsuario"
                               value="${clienteAtualizacao.cpf}" placeholder="000.000.000-00"
                               required class="form-control"/>
                    </div>
                </c:if>
                <br>
                <div class="form-group">
                    <label>Celular</label>
                    <input type="text" name="CelularUsuario"
                           value="${clienteAtualizacao.telefone}" placeholder="(00)00000-0000"
                           required
                           class="form-control"/>        
                </div>
                <br>
                <div class="form-group">
                    <label>Data de Nascimento</label>
                    <input type="date" name="NascimentoUsuario"
                           value="${clienteAtualizacao.nascimento}" placeholder="(00)0000-0000"
                           required
                           class="form-control"/>
                </div>
                <br>
                <div class="form-group">
                    <label>Tipo de Usuário</label>
                    <select name="categoriaUsuario" value="${clienteAtualizacao.categoria}"
                            class="form-control">
                        <option value="administrador">Administrador</option>
                        <option value="Estoquista">Estoquista</option>
                    </select>
                </div>
                <br/>
                <div class="form-group">
                    <label>Senha</label>
                    <input type="password" name="senhaUsuario"
                           class="form-control"/>
                </div>
                <c:if test="${not empty clienteAtualizacao}">
                    <input type="hidden" name="CPFUsuario"
                           value="${clienteAtualizacao.cpf}" 
                           required
                           class="form-control"/>
                </c:if>
                <br/>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>