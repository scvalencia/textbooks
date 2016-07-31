(define atom? (lambda (x)
	(and 
		(not (pair? x)) 
		(not (null? x)))
	)
)

(define (summation list) 
	(if (null? list) 0 
		(+ (car list) 
			(summation (cdr list))
		)
	)
)

(define (factorial n)
	(if (zero? n) 1
		(* n (factorial (- n 1)))

	)
)

(cons 1 2)
(cons 1 (cons 2 3))
(cons 1 (cons 2 (cons 3 4)))

(define (range a b) 
	(if (= a (+ b 1)) '() 
		(cons a (range (+ a 1) b))
	)
)