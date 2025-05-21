
import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException {
        // Abre o arquivo de entrada
        Reader leitor = new BufferedReader(new FileReader("teste/teste.elgio"));

        try {

            Parser p = new Parser(new Yylex(leitor));
            Object result = p.parse().value;

        } catch (Exception e) {
            System.out.println("Entrou aqui");
            System.out.println(e);
        }
        
    }
}

