/* Program to recognize the string a^nb (n>=10) */

%{
	#include <stdio.h>
	#include <stdlib.h>
%}
%token A B NL
%%
stmt : A A A A A A A A A A S B NL {printf("Valid String.\n");exit(0);}
S : S A
  | 
  ;
%%
int yyerror(char * msg){printf("Invalid String!\n");exit(0);}
void main(){
	printf("Enter the string:\n");
	yyparse();
}
