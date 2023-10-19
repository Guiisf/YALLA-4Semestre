/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.senac.uteis;

import at.favre.lib.crypto.bcrypt.BCrypt;

/**
 *
 * @author guilh
 */
public class CryptoUtils {

    public static String gerarhashSenha(String senhaAberta) {
        return BCrypt.withDefaults().hashToString(8, senhaAberta.toCharArray());
    }

    public static boolean verificarSenha(String senhaAberta, String senhaFechada) {
        BCrypt.Result resultado = BCrypt.verifyer().verify(senhaAberta.toCharArray(), senhaFechada);
        return resultado.verified;
    }
}
