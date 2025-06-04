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
{comentario}      { /* ignora */}

"elgio"           { return new Symbol(sym.ELGIO, yyline + 1, yycolumn + 1); }
"inteiro"         { return new Symbol(sym.INTEIRO, yyline + 1, yycolumn + 1); }
"zero"            { return new Symbol(sym.ZERO, yyline + 1, yycolumn + 1); }
"="               { return new Symbol(sym.RECEBE, yyline + 1, yycolumn + 1); }
"enquanto"        { return new Symbol(sym.ENQUANTO, yyline + 1, yycolumn + 1); }
"se"              { return new Symbol(sym.SE, yyline + 1, yycolumn + 1); }
"entao"           { return new Symbol(sym.ENTAO, yyline + 1, yycolumn + 1); }
"senao"           { return new Symbol(sym.SENAO, yyline + 1, yycolumn + 1); }
"inicio"          { return new Symbol(sym.INICIO, yyline + 1, yycolumn + 1); }
"fim"             { return new Symbol(sym.FIM, yyline + 1, yycolumn + 1); }
"maior"           { return new Symbol(sym.MAIOR, yyline + 1, yycolumn + 1); }
"menor"           { return new Symbol(sym.MENOR, yyline + 1, yycolumn + 1); }
"igual"           { return new Symbol(sym.IGUAL, yyline + 1, yycolumn + 1); }
"diferente"       { return new Symbol(sym.DIFERENTE, yyline + 1, yycolumn + 1); }
","               { return new Symbol(sym.SEPARADOR, yyline + 1, yycolumn + 1); }
"+"               { return new Symbol(sym.MAIS, yyline + 1, yycolumn + 1); }
"-"               { return new Symbol(sym.MENOS, yyline + 1, yycolumn + 1); }
"x"               { return new Symbol(sym.MULT, yyline + 1, yycolumn + 1); }
"/"               { return new Symbol(sym.DIV, yyline + 1, yycolumn + 1); }
"("               { return new Symbol(sym.PARENTESE1, yyline + 1, yycolumn + 1); }
")"               { return new Symbol(sym.PARENTESE2, yyline + 1, yycolumn + 1); }

.                 { 
                    System.out.printf("Caractere inválido: %s %s %s", yytext(), yycolumn + 1, yyline + 1); 
                    return new Symbol(sym.error, yycolumn + 1, yyline + 1); 
                  }