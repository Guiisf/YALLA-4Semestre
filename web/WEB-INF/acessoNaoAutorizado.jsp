<%-- 
    Document   : Acesso Não Autorizado
    Created on : 04/03/2022, 20:19:16
    Author     : Douglas Proença
--%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/estilo.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acesso negado!</title>
    </head>
    <body>	
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/Login.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"></path>
            </a>
        </nav>
        <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center">
            <br/><br/>
            <font color="red"><h2 class="display-5 font-weight-normal">Acesso negado!</h2></font>
            <br/><br/><br/>
            <img src="Resources/Security-Denied-icon.png" width="90">
            <br/><br/><br/><br/>
            Desculpe, você não está autorizado a acessar a página que solicitou.
            <br/><br/><br/><br/><br/>
            <a href="javascript:history.back()" class="btn  btn-primary">Voltar para onde estava</a>
        </div>
    </body>
</html>