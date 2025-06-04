public class Main {
    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Uso: elgolc <arquivo.elgio>");
            return;
        }

        String caminhoArquivo = args[0];

        try {
            java.io.Reader reader = new java.io.FileReader(caminhoArquivo);
            Yylex lexer = new Yylex(reader);
            Parser p = new Parser(lexer);
            p.parse();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}