/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Usuario;
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
public class UsuarioDAO {

    public static Usuario getUsuario(String login) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.abrirConexao();
        Usuario usuario = null;
        String query = "select u.id\n"
                + "       ,u.nome\n"
                + "       ,u.telefone\n"
                + "       ,u.nascimento\n"
                + "       ,u.email\n"
                + "       ,c.categoria\n"
                + "       ,u.cpf\n"
                + "       ,u.senha\n"
                + "       ,case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo\n"
                + "from usuario u\n"
                + "inner join categoria c\n"
                + "on c.id = u.id_categoria\n"
                + "where u.email = ?;";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, login);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            usuario = new Usuario();
            usuario.setId(rs.getInt("id"));
            usuario.setNome(rs.getString("nome"));
            usuario.setEmail(rs.getString("email"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setCategoria(rs.getString("categoria"));
            usuario.setAtivo(rs.getString("ativo"));
        }
        return usuario;
    }

    public static void inserirUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
        String query = "insert into usuario values (null,?,?,?,?,?,?,?,?)";
        Connection con = Conexao.abrirConexao();
        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setString(1, usuario.getNome());
        ps.setString(2, usuario.getTelefone());
        ps.setString(3, usuario.getEmail());
        ps.setDate(4, new java.sql.Date(usuario.getNascimento().getTime()));
        if (usuario.getCategoria().equals("administrador")) {
            ps.setInt(5, 1);
        } else {
            ps.setInt(5, 2);
        }
        ps.setString(6, usuario.getCpf());
        ps.setString(7, usuario.getSenha());
        ps.setInt(8, 1);

        ps.execute();
    }

    public static boolean updateUsuario(Usuario usuario) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "update usuario set nome=?,telefone=?,nascimento=?,id_categoria=?,senha=?"
                + " where cpf=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getTelefone());
            ps.setDate(3, new java.sql.Date(usuario.getNascimento().getTime()));
            if (usuario.getCategoria().equals("administrador")) {
                ps.setInt(4, 1);
            } else {
                ps.setInt(4, 2);
            }
            ps.setString(5, usuario.getSenha());
            ps.setString(6, usuario.getCpf());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }

    public static List<Usuario> getAllClientes(int ope) throws ClassNotFoundException, SQLException {

        List<Usuario> clientes = new ArrayList<>();
        String query = "call sp_getUsuario(?)";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ope);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setNascimento(rs.getDate("nascimento"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setCategoria(rs.getString("categoria"));
                usuario.setAtivo(rs.getString("ativo"));
                clientes.add(usuario);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return clientes;
    }

    public static Usuario getUsuarioPorCPF(String cpf) throws ClassNotFoundException, SQLException {
        Usuario usuario = null;
        String query = "select u.id\n"
                + "       ,u.nome\n"
                + "       ,u.telefone\n"
                + "       ,u.nascimento\n"
                + "       ,u.email\n"
                + "       ,c.categoria\n"
                + "       ,u.cpf\n"
                + "       ,u.senha\n"
                + "       ,case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo\n"
                + "from usuario u\n"
                + "inner join categoria c\n"
                + "on c.id = u.id_categoria\n"
                + "where u.cpf = ?";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setNascimento(rs.getDate("nascimento"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setCategoria(rs.getString("categoria"));
                usuario.setAtivo(rs.getString("ativo"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuario;
    }

    public static List<Usuario> buscarUsuario(String nomeParam) throws ClassNotFoundException, SQLException {
        nomeParam = nomeParam.toUpperCase();
        List<Usuario> clientes = new ArrayList<>();
        String query = "select u.id\n"
                + "       ,u.nome\n"
                + "       ,u.telefone\n"
                + "       ,u.nascimento\n"
                + "       ,u.email\n"
                + "       ,c.categoria\n"
                + "       ,u.cpf\n"
                + "       ,u.senha\n"
                + "       ,case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo\n"
                + "from usuario u\n"
                + "inner join categoria c\n"
                + "on c.id = u.id_categoria\n"
                + "where u.nome like ?";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nomeParam + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setNascimento(rs.getDate("nascimento"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setCategoria(rs.getString("categoria"));
                usuario.setAtivo(rs.getString("ativo"));
                clientes.add(usuario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clientes;
    }

    public static boolean statusUsuario(String cpf) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "call sp_altStatus(?)";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
}
