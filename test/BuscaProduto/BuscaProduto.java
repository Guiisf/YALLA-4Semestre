/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BuscaProduto;

import br.senac.conexaobd.dao.ProdutoDAO;
import br.senac.conexaobd.entidades.Produto;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author guilh
 */
    

@WebServlet(name = "BuscaProduto", urlPatterns = {"/protegido/produto/BuscaProduto"})
public class BuscaProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomeProduto = request.getParameter("nomeProduto");
        List<Produto> produtos = null;
        try {
            produtos = ProdutoDAO.buscarProduto(nomeProduto);
        } catch (ClassNotFoundException | SQLException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(BuscaProduto.class.getName()).log(Level.SEVERE, null, ex);
        }
        String clientesJson = new Gson().toJson(produtos);
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.write(clientesJson);
    }

}
