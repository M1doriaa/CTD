%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
%}

%%

[0-9]+    { yylval.ival = atoi(yytext); return TOKEN_INT; }
[0-9]+"."[0-9]* {
  yylval.dval = atof(yytext);
  return TOKEN_DOUBLE;
}
[ \t\n]+  /* skip whitespace */
"+"       { return TOKEN_PLUS; }
"-"       { return TOKEN_MINUS; }
"*"       { return TOKEN_MUL; }
"/"       { return TOKEN_DIV; }
"("       { return TOKEN_LPAREN; }
")"       { return TOKEN_RPAREN; }
";"       { return TOKEN_SEMI; }
.         { return TOKEN_ERROR; }

%%

int yywrap() { return 1; }
