/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ImagemDAO;
import br.senac.conexaobd.dao.ProdutoDAO;
import br.senac.conexaobd.entidades.Imagem;
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
@WebServlet(name = "VisualizarServlet", urlPatterns = {"/protegido/produto/VisualizarServlet"})
public class VisualizarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Produto produtos = ProdutoDAO.getProdutoPorCodigo(id);
            List<Imagem> imagens = ImagemDAO.getImagens(id);
            request.setAttribute("Produto", produtos);
            request.setAttribute("listaImagens", imagens);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/visualizar.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(ListarProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}