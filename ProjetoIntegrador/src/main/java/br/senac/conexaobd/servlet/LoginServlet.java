/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.UsuarioDAO;
import br.senac.conexaobd.entidades.Usuario;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nomeUsuario = request.getParameter("nomeUsuario");
            String senhaUsuario = request.getParameter("senhaUsuario");
            Usuario usuario = UsuarioDAO.getUsuario(nomeUsuario);
            if (usuario == null) {
                response.sendRedirect(request.getContextPath() + "/Login.jsp?loginInvalido=true");
            } else {
                if (usuario.getAtivo().equals("Ativo")) {
                    boolean senhaOk = CryptoUtils.verificarSenha(senhaUsuario, usuario.getSenha());
                    if (senhaOk) {
                        HttpSession sessao = request.getSession();
                        sessao.setAttribute("usuario", usuario);
                        response.sendRedirect(request.getContextPath() + "/protegido/index.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/Login.jsp?loginInvalido=true");
                    }
                } else {
                    response.sendRedirect(request.getContextPath() + "/Login.jsp?usuarioInativo=true");
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

        CadastroCarrinhoServlet.enderecos.clear();
        HttpSession sessao = request.getSession();
        sessao.invalidate();
        response.sendRedirect(request.getContextPath() + "Login.jsp");
    }
}
