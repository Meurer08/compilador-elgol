import java_cup.runtime.Symbol;

%%
%cup
%public
%class Yylex
%unicode
%standalone


identificador = [A-Z][A-Za-z][A-Za-z][A-Za-z]*
numeros = [1-9][0-9]*
funcoes = _[A-Z][A-Za-z][A-Za-z][A-Za-z]*
pontuacao = \.
espacos = [ \t\r\n]+
comentario = \#.*

%%

{identificador}   { return new Symbol(sym.IDENT, yyline + 1, yycolumn + 1, yytext()); }
{numeros}         { 
                    int aux = Integer.parseInt(yytext()); 
                    return new Symbol(sym.NUM, yyline + 1, yycolumn + 1, aux); 
                  }
{funcoes}         { return new Symbol(sym.FUNC, yyline + 1, yycolumn + 1); }
{pontuacao}       { return new Symbol(sym.PT, yyline + 1, yycolumn + 1); }
{espacos}         { /* ignora */ }
{comentario}      { /* ignora */ }

"elgio"           { return new Symbol(sym.ELGIO); }
"inteiro"         { return new Symbol(sym.INTEIRO); }
"zero"            { return new Symbol(sym.ZERO); }
"comp"            { return new Symbol(sym.COMP); }
"enquanto"        { return new Symbol(sym.ENQUANTO); }
"se"              { return new Symbol(sym.SE); }
"entao"           { return new Symbol(sym.ENTAO); }
"senao"           { return new Symbol(sym.SENAO); }
"inicio"          { return new Symbol(sym.INICIO); }
"fim"             { return new Symbol(sym.FIM); }
"maior"           { return new Symbol(sym.MAIOR); }
"menor"           { return new Symbol(sym.MENOR); }
"igual"           { return new Symbol(sym.IGUAL); }
"diferente"       { return new Symbol(sym.DIFERENTE); }
","               { return new Symbol(sym.SEPARADOR); }
"+"               { return new Symbol(sym.MAIS); }
"-"               { return new Symbol(sym.MENOS); }
"x"               { return new Symbol(sym.MULT); }
"/"               { return new Symbol(sym.DIV); }
"("               { return new Symbol(sym.PARENTESE1); }
")"               { return new Symbol(sym.PARENTESE2); }

.                 { 
                    System.out.printf("Caractere inválido: %s %s", yytext(), yyline + 1); 
                    return new Symbol(sym.error); 
                  }