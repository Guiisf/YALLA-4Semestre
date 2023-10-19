/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author guilh
 */
public class ImagemDAO {

    public static void inserirImagem(String fileName) throws SQLException, ClassNotFoundException {
        String query = "insert into imagem values ((select max(código) from produto),?,?)";
        String caminho = "Resources/" + fileName;
        Connection con = Conexao.abrirConexao();
        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setString(1, fileName);
        ps.setString(2, caminho);
        ps.execute();
    }
    
    public static List<Imagem> getImagens(int ope) throws ClassNotFoundException, SQLException {

        List<Imagem> imagens = new ArrayList<>();
        String query = "select * from imagem where codigo_produto = ?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ope);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Imagem img = new Imagem();
                img.setId(rs.getInt("codigo_produto"));
                img.setNome(rs.getString("nome_imagem"));
                img.setCaminho(rs.getString("caminho"));
                imagens.add(img);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return imagens;
    }
}
