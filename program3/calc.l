%{
#include "calc.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%
[a-zA-Z][a-zA-Z0-9]* { yylval.str = strdup(yytext); return ID; }
[0-9]+ { yylval.num = atoi(yytext); return NUM; }
"=" { return '='; }
"+" { return '+'; }
"-" { return '-'; }
"*" { return '*'; }
"/" { return '/'; }
"(" { return '('; }
")" { return ')'; }
[ \t] ;
\n { return '\n'; }
. { printf("Invalid input\n"); }
%%

int yywrap(){ return 1; }