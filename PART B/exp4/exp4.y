/* Program to evaluate an arithmetic expression involving operators + , - , * , /  */

%{
	#include <stdio.h>
	#include <stdlib.h>
%}
%token  NUMBER NL
%left '+' '-'
%left '*' '/'
%%
stmt : exp NL {printf("Value = %d\n" , $1);
		exit(0);
		};
exp : exp '+' exp {$$ = $1 + $3 ;}
	| exp '-' exp {$$ = $1 - $3 ;} 
	| exp '*' exp {$$ = $1 * $3 ;}
	| exp '/' exp {if($3 == 0 ){printf("Cannot divide by zero\n") ; exit(0);} else $$ = $1 / $3 ;}
	| '('exp')' {$$ = $2;}
	| NUMBER {$$ = $1;}
	;
%%
int yyerror(char * msg) { printf("Invalid Arithmetic Expression"); exit(0); }

void main(){ 
	printf("Enter the  Expression : \n");
	yyparse();
}
