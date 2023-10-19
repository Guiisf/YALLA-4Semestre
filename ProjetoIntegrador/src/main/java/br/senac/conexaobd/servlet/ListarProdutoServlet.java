/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ProdutoDAO;
import br.senac.conexaobd.entidades.Produto;

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
@WebServlet(name = "ListarProdutoServlet", urlPatterns = {"/protegido/produto/ListarProdutoServlet"})
public class ListarProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ope = Integer.parseInt(request.getParameter("ope"));
        try {
            List<Produto> produtos = ProdutoDAO.getAllProdutos(ope);
            request.setAttribute("listaProdutos", produtos);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/protegido/produto/listar.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(ListarProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}