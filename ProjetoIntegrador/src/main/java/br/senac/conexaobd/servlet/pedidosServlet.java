/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.CarrinhoDAO;
import br.senac.conexaobd.entidades.EnderecoCliente;
import br.senac.conexaobd.entidades.Lista;
import br.senac.conexaobd.entidades.Pedido;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author guilh
 */
@WebServlet(name = "pedidosServlet", urlPatterns = {"/pedidosServlet"})
public class pedidosServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        try {
            if (req.getParameter("idPedido") != null) {
                List<Lista> pedidos = CarrinhoDAO.getPedidoDetalhe(Integer.parseInt(req.getParameter("idPedido")));
                EnderecoCliente endereco = CarrinhoDAO.getEnderecoPedido(Integer.parseInt(req.getParameter("idPedido")));
                int frete = pedidos.get(0).getFrete();
                double valor_total = pedidos.get(0).getValor_total();
                String forma_pagamento = pedidos.get(0).getForma_pagamento();

                req.setAttribute("id_pedido", req.getParameter("idPedido"));
                req.setAttribute("valor_total", valor_total);
                req.setAttribute("forma", forma_pagamento);
                req.setAttribute("ende", endereco);
                req.setAttribute("frete", frete);
                req.setAttribute("ListaPedidos", pedidos);
                String url = "/protegido/cliente/resumoPedido.jsp";
                req.getRequestDispatcher(url).forward(req, resp);
            } else {
                List<Pedido> pedidos = CarrinhoDAO.getPedido(Integer.parseInt(id));
                req.setAttribute("ListaPedidos", pedidos);
                // RequestDispatcher reaproveita os objetos Request e Response
                String url = "/protegido/cliente/Pedidos.jsp";
                req.getRequestDispatcher(url).forward(req, resp);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            resp.sendRedirect(req.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(ListarProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
