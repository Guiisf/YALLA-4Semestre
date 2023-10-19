/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.entidades.Cliente;
import br.senac.conexaobd.entidades.EnderecoCliente;
import br.senac.uteis.CryptoUtils;
import br.senac.uteis.ValidaCPF;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "CadastroClienteServlet", urlPatterns = {"/CadastroClienteServlet"})
public class CadastroClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String ope = request.getParameter("ope");
            Cliente cliente = new Cliente();
            cliente.setNome(request.getParameter("prnome") + " " + request.getParameter("sgnome"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setCpf(request.getParameter("cpf"));
            cliente.setGenero(request.getParameter("optradio"));
            cliente.setNascimento(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("datemax")));
            if (request.getParameter("senha") != null) {
                cliente.setSenha(CryptoUtils.gerarhashSenha(request.getParameter("senha")));
            } else {
                cliente.setSenha(request.getParameter("senha2"));
            }

            EnderecoCliente endereco = new EnderecoCliente();
            if (!"1".equals(ope)) {
                endereco.setCEP(request.getParameter("cep"));
                endereco.setRua(request.getParameter("rua"));
                endereco.setBairro(request.getParameter("bairro"));
                endereco.setCidade(request.getParameter("cidade"));
                endereco.setUf(request.getParameter("uf"));
                endereco.setComplemento(request.getParameter("complemento"));
                endereco.setNumero(Integer.parseInt(request.getParameter("num")));
            }

            // ope = 1 => Update
            if ("1".equals(ope)) {
                try {
                    cliente.setId(Integer.parseInt(request.getParameter("id")));
                    ClienteDAO.updateCliente(cliente);
                    response.sendRedirect(request.getContextPath() + "/loginCliente.jsp");
                } catch (ClassNotFoundException ex) {
                    response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
                    Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                if (ValidaCPF.isCPF((request.getParameter("cpf")).replace(".", "").replace("-", "")) == true) {
                    ClienteDAO.inserirCliente(cliente, endereco);
                    response.sendRedirect(request.getContextPath() + "/loginCliente.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/cadastroCliente.jsp?cpfInvalido=true");
                }
            }
        } catch (ClassNotFoundException | SQLException | ParseException ex) {
            Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cpf = req.getParameter("CPFCliente");
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        try {
            if ("1".equals(ope)) {
                Cliente cliente = ClienteDAO.getClientePorCPF(cpf);
                List<EnderecoCliente> enderecos = ClienteDAO.getEnderecoCliente(cpf);
                req.setAttribute("listaEnderecos", enderecos);
                req.setAttribute("clienteAtualizacao", cliente);
                req.getRequestDispatcher("/protegido/cliente/perfilCliente.jsp").forward(req, resp);
            } else if (("2".equals(ope))) {
                //ClienteDAO.statusUsuario(cpf);
                //resp.sendRedirect(req.getContextPath() + "/protegido/usuario/ListarUsuarioServlet?ope=0");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
