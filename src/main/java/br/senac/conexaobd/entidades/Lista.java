

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

