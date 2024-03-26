#include <stdio.h>

extern int yyparse();
extern int yylex();
extern char *yytext;
extern void yyerror(const char* msg);

int main() {
  if (yyparse() == 0) {
    printf("Parse Successful!\n");
  } else {
    printf("Parse Failed!\n");
  }
}
