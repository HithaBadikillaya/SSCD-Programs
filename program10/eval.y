%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token NUM

%left '+' '-'
%left '*' '/'

%%
input: expr '\n' { printf("Result=%d\n",$1); exit(0); };

expr:
expr '+' expr { $$=$1+$3; }
| expr '-' expr { $$=$1-$3; }
| expr '*' expr { $$=$1*$3; }
| expr '/' expr { $$=$1/$3; }
| '(' expr ')' { $$=$2; }
| NUM { $$=$1; }
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