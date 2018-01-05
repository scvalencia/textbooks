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


