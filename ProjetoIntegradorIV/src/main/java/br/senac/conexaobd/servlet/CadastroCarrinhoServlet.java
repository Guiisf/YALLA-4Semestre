/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.CarrinhoDAO;
import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.entidades.EnderecoCliente;
import br.senac.conexaobd.entidades.Produto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author guilh
 */
@WebServlet(name = "CadastroCarrinhoServlet", urlPatterns = {"/protegido/produto/CadastroCarrinhoServlet"})
public class CadastroCarrinhoServlet extends HttpServlet {

    public static List<Produto> produtoList;
    public static double frete = 0;
    double subtotal = 0;
    public static double total = 0;
    public static List<EnderecoCliente> enderecos;
    public static String CEP;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean jaTem = false;

        try {
            if (produtoList == null) {
                produtoList = new ArrayList<>();
            }
            Produto produto = CarrinhoDAO.ProdutosCarrinhosemid(request.getParameter("id_produto"));
            for (int i = 0; i < produtoList.toArray().length; i++) {
                if (produtoList.get(i).getCodigo() == Integer.parseInt(request.getParameter("id_produto"))) {
                    produtoList.get(i).setQuantidade(produtoList.get(i).getQuantidade() + 1);
                    produtoList.get(i).setValor(produtoList.get(i).getValor() * produtoList.get(i).getQuantidade());
                    jaTem = true;
                }
            }
            if (!jaTem) {
                produtoList.add(produto);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CadastroCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect(request.getContextPath() + "/Principal.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String ope = req.getParameter("ope");
            String id_produto = null;
            id_produto = req.getParameter("id_produto");
            if (req.getParameter("cpf") != null) {
                enderecos = ClienteDAO.getEnderecoCliente(req.getParameter("cpf"));
            }
            total = 0;
            subtotal = 0;
            for (int i = 0; i < produtoList.toArray().length; i++) {
                subtotal = subtotal + produtoList.get(i).getValor();
                total = subtotal;
            }

            if ("1".equals(ope)) {
                if (req.getParameter("quantidade") != null) {
                    total = 0;
                    subtotal = 0;
                    for (int i = 0; i < produtoList.toArray().length; i++) {
                        if (produtoList.get(i).getCodigo() == Integer.parseInt(req.getParameter("id_produto"))) {
                            produtoList.get(i).setValor(produtoList.get(i).getValor() / produtoList.get(i).getQuantidade());
                            produtoList.get(i).setQuantidade(Integer.parseInt(req.getParameter("quantidade")));
                            produtoList.get(i).setValor(produtoList.get(i).getValor() * produtoList.get(i).getQuantidade());
                        }
                    }
                    for (int j = 0; j < produtoList.toArray().length; j++) {
                        subtotal = subtotal + produtoList.get(j).getValor();
                        total = subtotal + frete;
                    }
                }
                req.setAttribute("listaEnderecos", enderecos);
                req.setAttribute("listaCarrinho", produtoList);
                req.setAttribute("total", total);
                req.setAttribute("frete", frete);
                req.setAttribute("subtotal", subtotal);
                req.getRequestDispatcher("/Carrinho.jsp").forward(req, resp);
            } else if ("2".equals(ope)) {
                for (int i = 0; i < produtoList.toArray().length; i++) {
                    if (produtoList.get(i).getCodigo() == Integer.parseInt(id_produto)) {
                        subtotal = subtotal - produtoList.get(i).getValor();
                        total = total - produtoList.get(i).getValor();
                        produtoList.remove(i);
                    }
                }
                req.setAttribute("listaEnderecos", enderecos);
                req.setAttribute("listaCarrinho", produtoList);
                req.setAttribute("total", total);
                req.setAttribute("subtotal", subtotal);
                req.setAttribute("frete", frete);
                req.getRequestDispatcher("/Carrinho.jsp").forward(req, resp);
            } else if ("3".equals(ope)) {
                CEP = req.getParameter("CEP"); 
                frete = 10;
                total = frete + subtotal;
                req.setAttribute("CEP", CEP);
                req.setAttribute("listaEnderecos", enderecos);
                req.setAttribute("listaCarrinho", produtoList);
                req.setAttribute("total", total);
                req.setAttribute("subtotal", subtotal);
                req.setAttribute("frete", frete);
                req.getRequestDispatcher("/Carrinho.jsp").forward(req, resp);
            }
        } catch (NullPointerException ex) {
            resp.sendRedirect(req.getContextPath() + "/Carrinho.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CadastroCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
