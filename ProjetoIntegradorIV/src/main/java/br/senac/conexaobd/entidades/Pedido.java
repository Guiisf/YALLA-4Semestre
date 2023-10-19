/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.entidades;

import java.util.Date;

/**
 *
 * @author guilh
 */
@lombok.Getter
@lombok.Setter
public class Pedido {

    private int id;
    private int id_cliente;
    private Date data;
    private double frete;
    private double valor;
    private String status;

    public Pedido(){
        
    }
}
