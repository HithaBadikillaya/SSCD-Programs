%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token NUM AND OR NOT

%left OR
%left AND
%right NOT

%%

input:
    expr '\n' {
        printf("Result = %d\n", $1);
        exit(0);
    }
;

expr:
      expr OR expr    { $$ = $1 || $3; }
    | expr AND expr   { $$ = $1 && $3; }
    | NOT expr        { $$ = !$2; }
    | '(' expr ')'    { $$ = $2; }
    | NUM             { $$ = $1; }
;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Name: Hitha Badikillaya S U\n");
    printf("USN: 4SF24CS407\n");
    printf("Enter Boolean Expression:\n");

    yyparse();
    return 0;
}