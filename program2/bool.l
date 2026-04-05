%{
#include "bool.tab.h"
#include <stdlib.h>
%}

%%

"&&"        return AND;
"||"        return OR;
"!"         return NOT;

"1"         { yylval = 1; return NUM; }
"0"         { yylval = 0; return NUM; }

[ \t]       ;
\n          return '\n';

.           { printf("Invalid input\n"); }

%%

int yywrap() {
    return 1;
}