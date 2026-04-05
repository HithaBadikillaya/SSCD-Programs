%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token FOR INT ID NUM INC DEC

%%
input: stmt '\n' { printf("Valid for loop\n"); exit(0); };

stmt:
FOR '(' init ';' cond ';' inc ')' '{' '}'
;

init:
INT ID '=' NUM
| ID '=' NUM
;

cond:
ID '<' NUM
| ID '>' NUM
;

inc:
ID INC
| ID DEC
;

%%
void yyerror(const char *s){ printf("Invalid for loop\n"); }

int main(){
    printf("Name: Hitha Badikillaya S U\n");
    printf("USN: 4SF24CS407\n");
    printf("Enter for loop:\n");
    yyparse();
    return 0;
}