%{
#include "paren.tab.h"
%}

%%
"(" { return '('; }
")" { return ')'; }
"[" { return '['; }
"]" { return ']'; }
"{" { return '{'; }
"}" { return '}'; }

[ \t] ;
\n { return '\n'; }

. { printf("Invalid input\n"); }
%%

int yywrap(){ return 1; }