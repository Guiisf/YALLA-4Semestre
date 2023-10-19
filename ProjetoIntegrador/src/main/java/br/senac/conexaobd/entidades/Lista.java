/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.conexaobd.entidades;

/**
 *
 * @author guilh
 */
@lombok.Getter
@lombok.Setter
public class Lista {

    private int id_pedido;
    private int quantidade;
    private String nome;
    private double valor;
    private String forma_pagamento;
    private int frete;
    private double valor_total;

    public Lista() {

    }
}