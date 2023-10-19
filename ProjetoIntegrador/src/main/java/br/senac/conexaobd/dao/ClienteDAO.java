/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Cliente;
import br.senac.conexaobd.entidades.EnderecoCliente;
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
public class ClienteDAO {

    public static Cliente getUsuario(String login) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.abrirConexao();
        Cliente cliente = null;
        String query = "select id\n"
                + "	 , usuario\n"
                + "      , cpf\n"
                + "      , nome\n"
                + "      , senha\n"
                + "from cliente \n"
                + "where usuario = ?;";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, login);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            cliente = new Cliente();
            cliente.setId(rs.getInt("id"));
            cliente.setEmail(rs.getString("usuario"));
            cliente.setNome(rs.getString("nome"));
            cliente.setCpf(rs.getString("cpf"));
            cliente.setSenha(rs.getString("senha"));
        }
        return cliente;
    }

    public static void inserirCliente(Cliente cliente, EnderecoCliente enderecoCliente) throws SQLException, ClassNotFoundException {
        String query = "call sp_inserirCliente(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection con = Conexao.abrirConexao();
        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setString(1, cliente.getEmail());
        ps.setString(2, cliente.getNome());
        ps.setString(3, cliente.getCpf());
        ps.setDate(4, new java.sql.Date(cliente.getNascimento().getTime()));
        ps.setString(5, cliente.getGenero());
        ps.setString(6, cliente.getSenha());
        ps.setString(7, enderecoCliente.getCEP());
        ps.setString(8, enderecoCliente.getRua());
        ps.setInt(9, enderecoCliente.getNumero());
        ps.setString(10, enderecoCliente.getComplemento());
        ps.setString(11, enderecoCliente.getBairro());
        ps.setString(12, enderecoCliente.getCidade());
        ps.setString(13, enderecoCliente.getUf());

        ps.execute();
    }

    public static boolean updateCliente(Cliente cliente) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "update cliente set nome=?,nascimento=?,usuario=?,cpf=?,senha=?"
                + " where id=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cliente.getNome());
            ps.setDate(2, new java.sql.Date(cliente.getNascimento().getTime()));
            ps.setString(3, cliente.getEmail());
            ps.setString(4, cliente.getCpf());
            ps.setString(5, cliente.getSenha());
            ps.setInt(6, cliente.getId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }

    public static EnderecoCliente getClientePorCPF(String cpf) throws ClassNotFoundException, SQLException {
        EnderecoCliente cliente = null;
        String query = "select c.*\n"
                + "from cliente c\n"
                + "where c.cpf = ?\n";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cliente = new EnderecoCliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setNascimento(rs.getDate("nascimento"));
                cliente.setGenero(rs.getString("genero"));
                cliente.setEmail(rs.getString("usuario"));
                cliente.setSenha(rs.getString("senha"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cliente;
    }

    public static List<EnderecoCliente> getEnderecoCliente(String cpf) throws ClassNotFoundException, SQLException {

        List<EnderecoCliente> enderecos = new ArrayList<>();
        String query = "select e.* \n"
                + "from endereco_cliente e\n"
                + "inner join cliente c\n"
                + "	on c.id = e.id_cliente\n"
                + "where c.cpf = ?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                EnderecoCliente endereco = new EnderecoCliente();
                endereco.setId(rs.getInt("id_cliente"));
                endereco.setCEP(rs.getString("CEP"));
                endereco.setRua(rs.getString("logradouro"));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setBairro(rs.getString("bairro"));
                endereco.setUf(rs.getString("uf"));
                endereco.setComplemento(rs.getString("complemento"));
                enderecos.add(endereco);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return enderecos;
    }
    
     public static void inserirEndereco(EnderecoCliente enderecoCliente) throws SQLException, ClassNotFoundException {
        String query = "insert into endereco_cliente values(null,?,?,?,?,?,?,?,?)";
        Connection con = Conexao.abrirConexao();
        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setInt(1, enderecoCliente.getId());
        ps.setString(2, enderecoCliente.getCEP());
        ps.setString(3, enderecoCliente.getRua());
        ps.setInt(4, enderecoCliente.getNumero());
        ps.setString(5, enderecoCliente.getComplemento());
        ps.setString(6, enderecoCliente.getBairro());
        ps.setString(7, enderecoCliente.getCidade());
        ps.setString(8, enderecoCliente.getUf());

        ps.execute();
    }
}
