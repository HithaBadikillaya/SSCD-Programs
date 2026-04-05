%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%%
input: S '\n' { printf("Balanced\n"); exit(0); };

S:
      '(' S ')' S
    | '[' S ']' S
    | '{' S '}' S
    | 
;

%%
void yyerror(const char *s){ printf("Not Balanced\n"); }

int main(){
    printf("Name: Hitha Badikillaya S U\n");
    printf("USN: 4SF24CS407\n");
    printf("Enter parentheses:\n");
    yyparse();
    return 0;
}