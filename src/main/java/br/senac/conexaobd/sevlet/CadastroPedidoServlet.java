
import br.senac.conexaobd.dao.CarrinhoDAO;
import br.senac.conexaobd.servlet.CadastroCarrinhoServlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author guilh
 */
@WebServlet(name = "CadastroPedidoServlet", urlPatterns = {"/CadastroPedidoServlet"})
public class CadastroPedidoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_cliente = request.getParameter("id_cliente");
        String forma_pg = request.getParameter("forma_pg");
        try {
            CarrinhoDAO.inserirPedido(Integer.parseInt(id_cliente),
                    CadastroCarrinhoServlet.frete, CadastroCarrinhoServlet.total, forma_pg);
            for (int i = 0; i < CadastroCarrinhoServlet.produtoList.toArray().length; i++) {
                CarrinhoDAO.inserirCarrinho(CadastroCarrinhoServlet.produtoList.get(i).getCodigo(),
                        CadastroCarrinhoServlet.produtoList.get(i).getQuantidade(),
                        CadastroCarrinhoServlet.produtoList.get(i).getValor());
            }
            CadastroCarrinhoServlet.produtoList.clear();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CadastroPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect(request.getContextPath() + "/Principal.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String forma_pagamento = req.getParameter("forma_pagemento");
        
        if (req.getParameter("CEP") != null) {
         CadastroCarrinhoServlet.CEP = req.getParameter("CEP");
        }

        for (int i = 0; i < CadastroCarrinhoServlet.enderecos.toArray().length; i++) {
            if (CadastroCarrinhoServlet.CEP.equals(CadastroCarrinhoServlet.enderecos.get(i).getCEP())) {
                req.setAttribute("endereco", CadastroCarrinhoServlet.enderecos.get(i));
            }
        }
        req.setAttribute("CEP", CadastroCarrinhoServlet.CEP);
        req.setAttribute("listaEnderecos", CadastroCarrinhoServlet.enderecos);
        req.setAttribute("listaCarrinho", CadastroCarrinhoServlet.produtoList);
        req.setAttribute("total", CadastroCarrinhoServlet.total);
        req.setAttribute("frete", CadastroCarrinhoServlet.frete);
        req.setAttribute("forma_pagamento", forma_pagamento);
        req.getRequestDispatcher("/protegido/cliente/detalhesPedido.jsp").forward(req, resp);
    }

}

