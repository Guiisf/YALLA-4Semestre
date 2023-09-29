<%-- 
    Document   : Login
    Created on : 04/03/2021, 20:19:16
    Author     : Douglas Proença
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous" />
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>

    <body>

        <div class="container" >
            <br>
            <br>
            <form class="col-md-6 offset-md-3 jumbotron" action="LoginServlet" method="POST">
                <h3>Login</h3>
                <br>
                <c:if test="${param.loginInvalido != null}">
                    <div class="alert alert-danger" role="alert">
                        Usuário/Senha inválidos
                    </div>  
                </c:if>
                <c:if test="${param.usuarioInativo != null}">
                    <div class="alert alert-danger" role="alert">
                        Usuário Inativo no Sistema
                    </div>  
                </c:if>
                <div style="margin-bottom: 50px" class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input type="text" class="form-control" name="nomeUsuario" placeholder="E-mail">
                </div>
                <br>
                <div style="margin-bottom: 50px" class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" class="form-control" name="senhaUsuario" placeholder="Senha">
                </div>
                <br>
                <br>
                <br>
                <center>
                    <button type="submit" value="Enviar" class="btn btn-primary">Entrar</button>
                </center>
                <br>
            </form>
        </div>
    </body>
</html>