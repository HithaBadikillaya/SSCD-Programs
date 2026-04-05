%{
#include "type.tab.h"
%}

%%
"int" { return INT; }
"float" { return FLOAT; }

[a-zA-Z][a-zA-Z0-9]* { return ID; }
[0-9]+"."[0-9]+ { return FNUM; }
[0-9]+ { return NUM; }

"=" { return '='; }
";" { return ';'; }

[ \t] ;
\n { return '\n'; }

. { printf("Invalid input\n"); }
%%

int yywrap(){ return 1; }