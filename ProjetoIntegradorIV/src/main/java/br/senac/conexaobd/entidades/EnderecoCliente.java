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
public class EnderecoCliente extends Cliente {

    private String CEP;
    private String rua;
    private String bairro;
    private String cidade;
    private String uf;
    private String complemento;
    private int numero;

    public EnderecoCliente() {

    }

}
