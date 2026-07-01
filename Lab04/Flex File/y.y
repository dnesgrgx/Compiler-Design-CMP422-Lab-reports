%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
int has_error = 0;
%}
/* Define semantic value type */
%union {
int num;
}
/* Token declarations */
%token <num> NUMBER
/* Non-terminal value types */
%type <num> expr term factor
%%
/* Starting symbol */
input:
/* empty */
| input line
;
line:
'\n'
| expr '\n'
{
if (!has_error)
{
printf("Result = %d\n", $1);
}
has_error = 0;
}
;
/* Addition and subtraction */
expr:
expr '+' term
{
$$ = $1 + $3;
}
| expr '-' term
{
$$ = $1 - $3;
}
| term
{
$$ = $1;
}
;
/* Multiplication and division */
term:
term '*' factor
{
$$ = $1 * $3;
}
| term '/' factor
{
if ($3 == 0)
{
printf("Error: Division by zero = 0\n");
has_error = 1;
$$ = 0;
}
else
{
$$ = $1 / $3;
}
}
| factor
{
$$ = $1;
}
;
/* Parentheses and numbers */
factor:
'(' expr ')'
{
$$ = $2;
}
| NUMBER
{
$$ = $1;
}
;
%%
/* Error handling function */
void yyerror(const char *s)
{
fprintf(stderr, "Error: %s\n", s);
}
/* Main function */
int main(void)
{
printf("=================================\n");
printf(" Arithmetic Expression Parser\n");
printf("=================================\n");
printf("Examples:\n");
printf(" 2+3*4\n");
printf(" (1+2)*(3+4)\n");
printf(" 10/0\n");
printf("\nPress Ctrl+Z (Windows) or Ctrl+D (Linux) to exit.\n\n");
yyparse();
return 0;
}
