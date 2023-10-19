
import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.entidades.EnderecoCliente;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author guilh
 */
@WebServlet(name = "EnderecoServlet", urlPatterns = {"/EnderecoServlet"})
public class EnderecoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ope = request.getParameter("ope");
        EnderecoCliente endereco = new EnderecoCliente();
        endereco.setId(Integer.parseInt(request.getParameter("id")));
        endereco.setCEP(request.getParameter("cep"));
        endereco.setRua(request.getParameter("rua"));
        endereco.setBairro(request.getParameter("bairro"));
        endereco.setCidade(request.getParameter("cidade"));
        endereco.setUf(request.getParameter("uf"));
        endereco.setComplemento(request.getParameter("complemento"));
        endereco.setNumero(Integer.parseInt(request.getParameter("num")));
        // ope = 1 => Update
        if ("1".equals(ope)) {
            //try {
            //ClienteDAO.updateCliente(cliente);
            /*} catch (ClassNotFoundException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
            }*/
        } else {
            try {
                ClienteDAO.inserirEndereco(endereco);
                response.sendRedirect(request.getContextPath() + "/loginCliente.jsp");
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(EnderecoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
