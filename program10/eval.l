%{
#include "eval.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+ { yylval=atoi(yytext); return NUM; }

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