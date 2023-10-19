/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.entidades.Cliente;
import br.senac.uteis.CryptoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author guilh
 */
@WebServlet(name = "LoginClienteServlet", urlPatterns = {"/LoginClienteServlet"})
public class LoginClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nomeUsuario = request.getParameter("mail");
            String senhaUsuario = request.getParameter("pass");

            Cliente cliente = ClienteDAO.getUsuario(nomeUsuario);
            if (cliente == null) {
                response.sendRedirect(request.getContextPath() + "/loginCliente.jsp?loginInvalido=true");
            } else {
                boolean senhaOk = CryptoUtils.verificarSenha(senhaUsuario, cliente.getSenha());
                if (senhaOk) {
                    HttpSession sessao = request.getSession();
                    sessao.setAttribute("cliente", cliente);
                    response.sendRedirect(request.getContextPath() + "/Principal.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/loginCliente.jsp?loginInvalido=true");
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Logout
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sessao = request.getSession();
        sessao.invalidate();
        response.sendRedirect(request.getContextPath() + "/Principal.jsp");
    }
}
