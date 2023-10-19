/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.CarrinhoDAO;
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
@WebServlet(name = "StatusPedidoServlet", urlPatterns = {"/protegido/produto/StatusPedidoServlet"})
public class StatusPedidoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pedido pedido = new Pedido();
        pedido.setId(Integer.parseInt(request.getParameter("id")));
        pedido.setStatus(request.getParameter("sel1"));
        try {
            CarrinhoDAO.updateStatusPedido(pedido);
            List<Pedido> pedidos = CarrinhoDAO.getAllPedidos(0);
            request.setAttribute("listaPedidos", pedidos);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/protegido/statusPedido.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int ope = Integer.parseInt(request.getParameter("ope"));
            List<Pedido> pedidos = CarrinhoDAO.getAllPedidos(ope);
            request.setAttribute("listaPedidos", pedidos);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/protegido/statusPedido.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(ListarUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
