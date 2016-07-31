/*
 *	multiple clauses
*/

%token  IDENTIFIER
%token	IF
%token 	THEN
%token	SUM

%%

statement
		: IDENTIFIER '=' expression
		| IF condition THEN statement

condition
		: expression
		| SUM '<' SUM

expression
		: SUM '<' SUM
		| SUM

/* Fix:
 *
 * 	statement
 *			: IDENTIFIER '=' expression
 *			| IF expression THEN statement
 *
 * 	expression
 *			: SUM '<' SUM
 *			| SUM
*/
