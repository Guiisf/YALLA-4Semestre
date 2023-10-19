package br.senac.conexaobd.entidades;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
/**
 *
 * @author guilh
 */
public class Usuario {

    private int id;
    private String nome;
    private String telefone;
    private String email;
    private Date nascimento;
    private String categoria;
    private String senha;
    private String ativo;
    private String cpf;

    public boolean isADM() {
        return "administrador".equalsIgnoreCase(this.getCategoria());
    }

    public boolean isEST() {
        return "estoquista".equalsIgnoreCase(this.getCategoria());
    }
    
   public boolean isAtivo() {
        return "Ativo".equalsIgnoreCase(this.getAtivo());
    }

    public boolean isNotAtivo() {
        return "Não Ativo".equalsIgnoreCase(this.getAtivo());
    }

    
}
