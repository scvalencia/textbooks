/*
 *	dangling else
*/

%token  IF...THEN
%token	ELSE

%%

statement
		: ';'
		| IF...THEN statement
		| IF...THEN statement ELSE statement