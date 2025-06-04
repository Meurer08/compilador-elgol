
import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException {
        // Abre o arquivo de entrada
        Reader leitor = new BufferedReader(new FileReader("teste.elgio"));

        try {

            Parser p = new Parser(new Yylex(leitor));
            Object result = p.parse();
            System.exit(0);

            if (result != null) {
                System.out.println(result);
            } else {
                System.out.println(result);
                System.out.println("Erro de sintaxe: parse retornou null");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
}

