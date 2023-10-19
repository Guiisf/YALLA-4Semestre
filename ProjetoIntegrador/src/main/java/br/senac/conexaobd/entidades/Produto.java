/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.entidades;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author guilh
 */
@Getter
@Setter

public class Produto {

    private int codigo;
    private String nome;
    private int quantidade;
    private float avaliacao;
    private double valor;
    private String ativo;
    private String descricao;
    private String imgReferencia;
    private String caminho;

    public boolean isAtivo() {
        return "Ativo".equalsIgnoreCase(this.getAtivo());
    }

    public boolean isNotAtivo() {
        return "Não Ativo".equalsIgnoreCase(this.getAtivo());
    }

}