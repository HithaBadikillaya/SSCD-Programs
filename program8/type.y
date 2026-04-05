%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
int errorflag=0;
%}

%union{
    int type;
}

%token INT FLOAT ID NUM FNUM
%type <type> value

%%
input: stmt '\n' {
    if(errorflag==0)
        printf("Valid Type Assignment\n");
    exit(0);
};

stmt:
INT ID '=' value ';' {
    if($4==1){
        printf("Type Mismatch\n");
        errorflag=1;
    }
}
| FLOAT ID '=' value ';' {
    if($4==0){
        printf("Type Mismatch\n");
        errorflag=1;
    }
}
;

value:
NUM { $$=0; }
| FNUM { $$=1; }
;

%%
void yyerror(const char *s){ printf("Invalid Statement\n"); }

int main(){
    printf("Name: Hitha Badikillaya S U\n");
    printf("USN: 4SF24CS407\n");
    printf("Enter statement:\n");
    yyparse();
    return 0;
}