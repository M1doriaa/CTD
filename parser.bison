%{
#include <stdio.h>
void yyerror(const char* msg);
int yylex();
%}

%union {
    double dval;
    int ival;
}

%token <dval> TOKEN_DOUBLE
%token <ival> TOKEN_INT
%token TOKEN_PLUS
%token TOKEN_MINUS
%token TOKEN_MUL
%token TOKEN_DIV
%token TOKEN_LPAREN
%token TOKEN_RPAREN
%token TOKEN_SEMI
%token TOKEN_ERROR

%%
program : program expr TOKEN_SEMI
         	| expr TOKEN_SEMI
         	;

expr : expr TOKEN_PLUS term
     	| expr TOKEN_MINUS term
     	| term
     	;

term : term TOKEN_MUL factor
     	| term TOKEN_DIV factor
     	| factor
     	;

factor : TOKEN_MINUS factor
       	| TOKEN_LPAREN expr TOKEN_RPAREN
       	| TOKEN_DOUBLE
		| TOKEN_INT
       	;
%%

void yyerror(const char* msg) {
  	fprintf(stderr, "%s\n", msg);
}
