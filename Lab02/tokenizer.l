%{
#include <stdio.h>

int line_no = 1;
%}

DIGIT [0-9]
ID [a-zA-Z_][a-zA-Z0-9_]*
KEYWORD int|float|if|else|return|while|for|char|double|void
OP ==|!=|<=|>=|\+|\-|\*|\/|>|=
SEPARATOR [;,(){}]

%%

{KEYWORD}     { printf("Keyword: %s\n", yytext); }
{ID}          { printf("Identifier: %s\n", yytext); }
{DIGIT}+      { printf("Number: %s\n", yytext); }
{OP}          { printf("Operator: %s\n", yytext); }
{SEPARATOR}   { printf("Separator: %s\n", yytext); }
\n            { line_no++; }
[ \t\r]+      ;
.             { printf("Unknown symbol at line %d: %s\n", line_no, yytext); }

%%

int main() {
    printf("Enter the code (Ctrl+D to end input):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
