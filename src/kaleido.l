%{
    #include <stdio.h>
%}
%option noyywrap

%%

^#.*\n    ;
<<EOF>>    {printf("-1\t EOF\n"); return 0;}
"def"   {printf("-2\t %s\n", yytext);}
"extern"    {printf("-3\t %s\n", yytext);}
[a-zA-Z][a-zA-Z0-9]*    {printf("-4\t %s\n", yytext);}
[0-9.]+    {printf("-5\t %s\n", yytext);}
[+;()<>,*-] {printf("%d\t %s\n", yytext[0], yytext);}
[\t\n ] {}

%%

int main() {
    printf("NUM\t TOK\n----------------\n");
    yylex();

    return 0;
}
