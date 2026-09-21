%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%

input:
      expr '\n'     { printf("result = %d\n" , $1); }
     ;

expr:
       expr '+' expr   { $$ = $1 + $3; }
     | expr '-' expr   { $$ = $1 - $3; }
     | expr '*' expr   { $$ = $1 * $3; }
     | expr '/' expr   { $$ = $1 / $3; }
     | '('  expr ')'   { $$ = $2; }
     | NUMBER          { $$ = $1; }
     ;
%%

int main()
{
    printf("enter arithmetic expressons:\n");
    yyparse();
    return 0;
}

int yyerror(char *s)
{
   printf("invalid expresion\n");
   return 0;
}
