function mostrarTelaAlerta(texto) {
    $("#txtAlerta").html(texto);
    $("#msgAlerta").css("display", "block");
    setTimeout(function () {
        $("#msgAlerta").css("display", "none");
    }, 1000)
}


function buscar() {
    var campoBusca = $("#nomeUsuario");
    var nomeUsuario = campoBusca.val();
    var tamanhoBusca = nomeUsuario.length;
    if (tamanhoBusca < 3) {
        mostrarTelaAlerta("Digite, pelo menos, 3 caracteres");
    } else {
        $('#tabelaUsuarios tbody').empty();
        var url = "../usuario/BuscaUsuario?nomeUsuario=" + nomeUsuario;
        $.ajax(url).done(function (resposta) {
            // Retorno do servlet
            var jsonUsuarios = JSON.parse(resposta);
            if (jsonUsuarios.length === 0) {
                mostrarTelaAlerta("A busca não encontrou resultados");
            }
            console.log(jsonUsuarios);
            // Adicionando resultado na lista
            jsonUsuarios.forEach(function (usuario) {
                $("#tabelaUsuarios").find('tbody')
                        .append($('<tr>')
                                .append($('<td>').append(usuario.nome))
                                .append($('<td>').append(usuario.categoria))
                                .append($('<td>').append(usuario.cpf))
                                .append($('<td>').append(usuario.ativo))
                                );
            })
        }).fail(function () {
            console.log("Erro!");
        })
    }
}

