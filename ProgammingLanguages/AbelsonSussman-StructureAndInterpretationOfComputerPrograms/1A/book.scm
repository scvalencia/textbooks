;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.1.1 Expressions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; One kind of primitiv expression is a number

486

;; Expressions representing numbers may be combined with
;; an expression representing a primitive procedure (+, *, -, ...)
;; to form a compound expression: application of procedures
;; to those numbers. The value of a compound expression,
;; is obteined by applying the procedure to the arguments

(+ 137 349)

(+ 1000 334)

(* 5 99)

(/ 10 5)

(+ 2.7 10)

(+ 21 35 12 7)

(* 25 4 12)

;; Since the operator is always the leftmost operator of
;; an entire compund expression surrounded by parentheses
;; no ambiguity can arise. We can even nest expressions

(+ (* 3 5) (- 10 6))

(+ (* 3 
		(+ 
			(* 2 4) 
			(+ 3 5))) 
	(+ (- 10 7) 6))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.1.2 Naming and the environment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; We can bind a variable name, to a value. Once we do that
;; we can refer to the binded value, by the given name

(define size 2)

(* 5 size)

(define pi 3.14159)

(define radius 10)

(define circumference (* 2 pi radius))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.1.4 Compound procedures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; A compound procedure is a much more powerful abstraction
;; technique by which a compound operation can be given a 
;; name and then referred to as a unit

(define (square x) (* x x))

(square 21)

(square (+ 2 5))

(square (square 3))

(define (sum-of-squares x y)
	(+ (square x) (square y)))

(sum-of-squares 3 4)

(define (f a)
	(sum-of-squares (+ a 1) (* a 2)))

(f 5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.1.6 Conditional expressions and predicates
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The set of expressions presented thus far, is very imited,
;; since we can't make tests and perform different operations
;; depending on the result of a test. To do so, we 'd need both
;; predicates, as a way to test whether an expression is true or 
;; false, and special forms that allow us to select a set of 
;; expressions to execute depending on the result of the test.

;; cond: (cond (<p1> <e1>) .. (<pn> <en>))
;; It's evaluated by evaluating p1, if p1 evaluates to true, then
;; the expressions returns e1, otherwise, it test p2. The process
;; continues until a predicate is found whose value is true, in 
;; which case the interpreter returns the value of the corresponding
;; consequent expression. If none of the predicates is found to 
;; be true, the value of the cond is undefined. We're not required
;; to include an exhaustive list of predicates to test. If we
;; include as a final clause, a form (else <e>), then if no previous
;; predicate is found to be true, we return the evaluation of e

(define (abs x)
	(cond 
		((< x 0) (- x))
		((= x 0) 0)
		((> x 0) x)))

(define (elsed-abs x)
	(cond 
		((< x 0) (- x))
		(else x)))

;; Another, special form to addres the same issue, if only two
;; predicates (a predicate p, and the negation of such predicate)
;; are going to be neddeed, is the IF form, a restricted type of 
;; the form (if <p> <e1> <e2>), that evaluates depedning the value
;; of p. If p is found to be true, the value of e1 is evaluated,
;; otherwise, e2 is evaluated and returned

(define (ifed-abs x)
	(if (< x 0) (- x) x))

;; There's a minor difference between if and cond. Every expression
;; is a cond clause may be a sequence of expressions, that are evaluated
;; and the whole expression evaluated to the final expression in that 
;; list. In an if expression, both e1, and e2 must be single expressions

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.1.7 Example: Square Roots by Newton's Method
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; We can describe the square root of a number, by giving a definition
;; of such quantity in terms of the number:

;; sqrt(x) = y such that y >= 0 and y * y = x

;; If our task is to find the sqare root of a number, a predicate
;; telling us whether or not a number is the square root of another
;; does not suffices, we'd need an imperative description (a recipe)
;; to be able to find the square root. A good approach would be 
;; Newton's method: If we hava a guess y for sqrt(x), we can get a 
;; better guess by averaging y with x/y

(define (sqrt-iter guess x)
	(if (good-enough? guess x) guess
		(sqrt-iter (improve guess x) x)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x))

(sqrt 9)

(sqrt (+ 100 37))

(sqrt (+ (sqrt 2) (sqrt 3)))

(square (sqrt 1000))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.1.8 Procedures as Black-Box Abstractions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Note that the problem of computing the sqaure rrot of a number,
;; is broken naturally into a number of subproblems. Each of these,
;; is accomplished by a separate procedure. Every parameter name
;; of a procedure, should be local to the body of the procedure. We
;; can hide the definition of auxiliar functions while computing
;; a square root by including the definition of aux procedures
;, inside the most important one.
;; Book has a great explanation on lexial scoping!!!

(define (sqrt x)
	(define (good-enough? guess)
		(< (abs (- (square guess) x)) 0.001))
	(define (improve guess)
		(average guess (/ x guess)))
	(define (sqrt-iter guess)
		(if (good-enough? guess) guess
			(sqrt-iter (improve guess))))
	(sqrt-iter 1.0))

