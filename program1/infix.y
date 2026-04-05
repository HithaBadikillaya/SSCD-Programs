%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    int num;
    char id;
}

%token <id> ID
%token <num> NUM
%token PLUS MINUS MUL DIV LPAREN RPAREN

%%

input:
    expr '\n' {
        printf("\nPostfix Expression Generated\n");
        exit(0);
    }
;

expr:
      expr PLUS term   { printf("+ "); }
    | expr MINUS term  { printf("- "); }
    | term
;

term:
      term MUL factor  { printf("* "); }
    | term DIV factor  { printf("/ "); }
    | factor
;

factor:
      LPAREN expr RPAREN
    | ID   { printf("%c ", $1); }
    | NUM  { printf("%d ", $1); }
;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Name: Hitha Badikillaya S U\n");
    printf("USN: 4SF24CS407\n");
    printf("Enter Infix Expression:\n");

    yyparse();
    return 0;
}