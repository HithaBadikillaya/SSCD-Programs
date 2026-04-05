%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token INT ID NUM

%%
input: decl '\n' { printf("Valid Declaration\n"); exit(0); };

decl:
INT varlist ';'
;

varlist:
var
| varlist ',' var
;

var:
ID
| ID '=' NUM
;

%%
void yyerror(const char *s){ printf("Invalid Declaration\n"); }

int main(){
    printf("Name: Hitha Badikillaya S U\n");
    printf("USN: 4SF24CS407\n");
    printf("Enter declaration:\n");
    yyparse();
    return 0;
}