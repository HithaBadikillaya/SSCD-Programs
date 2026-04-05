%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex();

struct var{ char name[50]; int val; } sym[100];
int count = 0;

int getval(char *s){
    for(int i=0;i<count;i++)
        if(strcmp(sym[i].name,s)==0)
            return sym[i].val;
    return 0;
}

void setval(char *s,int v){
    for(int i=0;i<count;i++)
        if(strcmp(sym[i].name,s)==0){
            sym[i].val=v;
            return;
        }
    strcpy(sym[count].name,s);
    sym[count].val=v;
    count++;
}
%}

%union{
    int num;
    char *str;
}

%token <num> NUM
%token <str> ID
%type <num> expr

%left '+' '-'
%left '*' '/'

%%
input: stmt '\n' { exit(0); };

stmt:
      ID '=' expr { setval($1,$3); printf("Value=%d\n",$3); }
    | expr { printf("Value=%d\n",$1); }
;

expr:
      expr '+' expr { $$=$1+$3; }
    | expr '-' expr { $$=$1-$3; }
    | expr '*' expr { $$=$1*$3; }
    | expr '/' expr { $$=$1/$3; }
    | '(' expr ')' { $$=$2; }
    | NUM { $$=$1; }
    | ID { $$=getval($1); }
;

%%
void yyerror(const char *s){ printf("Error:%s\n",s); }

int main(){
    printf("Name: Hitha Badikillaya S U\n");
    printf("USN: 4SF24CS407\n");
    printf("Enter Expression:\n");
    yyparse();
    return 0;
}