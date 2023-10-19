
import br.senac.conexaobd.dao.ImagemDAO;
import br.senac.conexaobd.dao.ProdutoDAO;
import br.senac.conexaobd.entidades.Produto;
import br.senac.conexaobd.servlet.CadastroUsuarioServlet;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author guilh
 */
@WebServlet(name = "CadastroProdutoServlet", urlPatterns = {"/protegido/produto/CadastroProdutoServlet"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 15)
public class CadastroProdutoServlet extends HttpServlet {

    Produto produto = new Produto();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String ope = request.getParameter("ope");
            List<Part> fileParts = request.getParts().stream().filter(part -> "imagem".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList());
            if (request.getParameter("nomeProduto") != null) {
                produto.setNome(request.getParameter("nomeProduto"));
            }
            produto.setQuantidade(Integer.parseInt(request.getParameter("quantidadeProduto")));
            if (request.getParameter("valorProduto") != null) {
                produto.setValor(Double.parseDouble(request.getParameter("valorProduto")));
                produto.setAvaliacao(Float.parseFloat(request.getParameter("avaliacaoProduto")));
                produto.setDescricao(request.getParameter("DescricaoProduto"));
            }
            // ope = 1 => Update
            if ("1".equals(ope)) {
                try {
                    produto.setCodigo(Integer.parseInt(request.getParameter("codigoProduto")));
                    ProdutoDAO.updateProduto(produto);
                } catch (ClassNotFoundException ex) {
                    response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
                    Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if ("2".equals(ope)) {

            } else {
                ProdutoDAO.inserirProduto(produto);
                for (Part filePart : fileParts) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                    InputStream fileContent = filePart.getInputStream();
                    ImagemDAO.inserirImagem(fileName);
                }
            }
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/sucesso.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int codigo = Integer.parseInt(req.getParameter("codigoProduto"));
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        try {
            if ("1".equals(ope)) {
                produto = ProdutoDAO.getProdutoPorCodigo(codigo);
                req.setAttribute("produtoAtualizacao", produto);
                req.getRequestDispatcher("/protegido/produto/cadastro.jsp").forward(req, resp);
            } else if (("2".equals(ope))) {
                ProdutoDAO.statusProduto(codigo);
                resp.sendRedirect(req.getContextPath() + "/protegido/produto/ListarProdutoServlet?ope=0");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
