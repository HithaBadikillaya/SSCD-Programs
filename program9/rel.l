%{
#include "rel.tab.h"
%}

%%
[a-zA-Z][a-zA-Z0-9]* { return ID; }
[0-9]+ { return NUM; }

"==" { return EQ; }
"!=" { return NE; }
"<" { return '<'; }
">" { return '>'; }

[ \t] ;
\n { return '\n'; }

. { printf("Invalid input\n"); }
%%

int yywrap(){ return 1; }