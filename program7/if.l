%{
#include "if.tab.h"
%}

%%
"if" { return IF; }
"else" { return ELSE; }

[a-zA-Z][a-zA-Z0-9]* { return ID; }
[0-9]+ { return NUM; }

"(" { return '('; }
")" { return ')'; }
"{" { return '{'; }
"}" { return '}'; }
"<" { return '<'; }
">" { return '>'; }
"==" { return EQ; }

[ \t] ;
\n { return '\n'; }

. { printf("Invalid input\n"); }
%%

int yywrap(){ return 1; }