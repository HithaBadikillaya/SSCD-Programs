%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token IF ELSE ID NUM EQ

%%
input: stmt '\n' { printf("Valid If-Else\n"); exit(0); };

stmt:
IF '(' cond ')' '{' '}' elsepart
;

elsepart:
ELSE '{' '}'
|
;

cond:
ID '<' NUM
| ID '>' NUM
| ID EQ NUM
;

%%
void yyerror(const char *s){ printf("Invalid If-Else\n"); }

int main(){
    printf("Name: Hitha Badikillaya S U\n");
    printf("USN: 4SF24CS407\n");
    printf("Enter if-else statement:\n");
    yyparse();
    return 0;
}