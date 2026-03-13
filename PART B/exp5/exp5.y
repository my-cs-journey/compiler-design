/* Program to recognize a valid variable with starts with a letter followed by any number of letters or digits */

%{
	#include <stdio.h>
	#include <stdlib.h>
%}
%token DIGIT LETTER UND NL
%%
stmt : variable NL {printf("Variable is valid. \n"); exit(0);};
variable : LETTER alphanumeric ;
alphanumeric : LETTER  alphanumeric
			 | DIGIT alphanumeric
			 | UND alphanumeric
			 | DIGIT
			 | UND
			 | LETTER
			 ;
%%
int yyerror() {printf("Invalid Variable!\n"); exit(0);}
void main(){
	printf("Enter the variable :\n");
	yyparse();
}	
