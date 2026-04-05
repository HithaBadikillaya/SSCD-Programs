%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token ID NUM EQ NE

%%
input: expr '\n' { printf("Valid Relational Expression\n"); exit(0); };

expr:
ID '<' ID
| ID '>' ID
| ID EQ ID
| ID NE ID
| ID '<' NUM
| ID '>' NUM
| ID EQ NUM
| ID NE NUM
;

%%
void yyerror(const char *s){ printf("Invalid Expression\n"); }

int main(){
    printf("Name: Hitha Badikillaya S U\n");
    printf("USN: 4SF24CS407\n");
    printf("Enter expression:\n");
    yyparse();
    return 0;
}