/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LexicRules;

import java.io.File;

/**
 *
 * @author Angel Diaz
 */
public class Principal {
    public static void main(String[] args) {
        String path = "C:/Users/Angel Diaz/Documents/NetBeansProjects/LexicalAnalyzer/src/LexicRules/Lexer.flex";
        generarLexer(path);
    }
    
    public static void generarLexer (String path) {
        File file = new File(path);
        JFlex.Main.generate(file);
    }
}
