

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Cadastro de Produtos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
        <script type="text/javascript">

            function readImage() {
                if (this.files && this.files[0]) {
                    var file = new FileReader();
                    file.onload = function (e) {
                        document.getElementById("preview").src = e.target.result;
                    };
                    file.readAsDataURL(this.files[0]);
                }
            }

            window.onload = function () {
                document.getElementById("img-input").addEventListener("change", readImage, false);
            }

        </script>
    </head>
    <body>
        <div class="container">
            <c:import url="../uteis/header.jsp"/>
            <br><br><br>
            <h1><center>Cadastro de Produtos</center></h1>
            <br><br>
            <form class="col-md-6 offset-md-3 jumbotron" action="CadastroProdutoServlet" method="POST" enctype="multipart/form-data">
                <c:if test="${not empty produtoAtualizacao}">
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <c:if test="${sessionScope.usuario.isADM()}">
                    <div  class="form-group">
                        <label>Nome</label>
                        <input type="text" name="nomeProduto" value="${produtoAtualizacao.nome}"
                               required class="form-control"/>
                    </div>
                </c:if>
                <br/>
                <div class="form-group">
                    <label>Quantidade</label>
                    <input type="number" name="quantidadeProduto" value="${produtoAtualizacao.quantidade}"
                           required class="form-control"/>
                <c:if test="${sessionScope.usuario.isADM()}">
                </div>
                <div class="form-group">
                    <label>Descricao</label>
                    <input type="text" name="DescricaoProduto" value="${produtoAtualizacao.descricao}"
                           required class="form-control"/>
                </div>           
                <br/>
                    <div class="form-group">
                        <label>Valor</label>
                        <input type="number" name="valorProduto"
                               value="${produtoAtualizacao.valor}" placeholder="000000.00"
                               required class="form-control"/>
                    </div>
                    <br>
                    <div class="form-group">
                        <label>Avaliação</label>
                        <input type="number"  name="avaliacaoProduto"
                               value="${produtoAtualizacao.avaliacao}" 
                               required
                               class="form-control"/>        
                <div class="form-group">
                    <label>Imagem</label>
                    <input type="file" id="img-input" name="imagem" multiple
                           required accept="image/png, image/jpeg"
                           class="form-control"/>        
                </div>
                <div id="img-container">
                    <img id="preview" src="" width="200" height="200">
                </div>
                </c:if>
                <br>
                <c:if test="${not empty produtoAtualizacao}">
                    <input type="hidden" name="codigoProduto"
                           value="${produtoAtualizacao.codigo}" 
                           class="form-control"/>
                </c:if>
                <br/>
                <div class="btn-group">
                    <div class="col-lg-12" style="text-align: left;">
                        <button type="submit" class="btn btn-primary" style="width:100%;">Salvar</button>
                    </div>
                    <div class="col-lg-12" style="text-align: right;">
                        <a class="btn btn-primary" href="../produto/ListarProdutoServlet?ope=0" role="button" style="width:100%;">Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>