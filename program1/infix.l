%{
#include "infix.tab.h"
#include <stdlib.h>
%}

%%

[a-zA-Z]    { yylval.id = yytext[0]; return ID; }
[0-9]+      { yylval.num = atoi(yytext); return NUM; }

"+"         return PLUS;
"-"         return MINUS;
"*"         return MUL;
"/"         return DIV;
"("         return LPAREN;
")"         return RPAREN;

[ \t]       ;   // ignore spaces
\n          return '\n';

.           { printf("Invalid character\n"); }

%%

int yywrap() {
    return 1;
}