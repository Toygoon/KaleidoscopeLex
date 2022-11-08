%{
    #include <stdio.h>

    
%}
%option noyywrap

%%

^#.*\n    ;
<<EOF>>    {printf("-1 "); return 0;}
"def"   {printf("-2 %s\n", yytext);}
"extern"    {printf("-3 %s\n", yytext);}
[a-zA-Z][a-zA-Z0-9]*    {printf("-4 %s\n", yytext);}
[0-9.]+    {printf("-5 %s\n", yytext);}
(.|\n)   ;

%%

int main() {
    yylex();

    return 0;
}