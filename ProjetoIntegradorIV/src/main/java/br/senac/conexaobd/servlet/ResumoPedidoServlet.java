/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author guilh
 */
@WebServlet(name = "ResumoPedidoServlet", urlPatterns = {"/ResumoPedidoServlet"})
public class ResumoPedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cpf = req.getParameter("CPFCliente");

        //req.setAttribute("listaCarrinho", ProdutosCarrinho);
        //req.setAttribute("total", total);
        req.getRequestDispatcher("/protegido/cliente/Pedidos.jsp").forward(req, resp);

    }

}
