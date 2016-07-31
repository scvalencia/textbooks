(define buggy-rember
	(lambda (x xs)
		(cond
			((null? xs) '())
			(else (cond
					((eq? x (car xs)) 
						(cdr xs))
					(else (buggy-rember x 
						(cdr xs)))
)))))

(define rember
	(lambda (x xs)
		(cond 
			((null? xs) '())
			((eq? (car xs) x) (cdr xs))
			(else (cons (car xs)
						(rember x (cdr xs))))
)))

(define first
	(lambda (xs)
		(cond 
			((null? xs) '())
			(else
				(cons 
					(car (car xs)) 
					(first (cdr xs))))
)))

(define insert
	(lambda (xs new old)
		(cond 
			((null? xs) '())
			(else
				(cond
					((eq? (car xs) old) (cons old (cons new (cdr xs))))
					(else (cons (car xs) 
						(insert (cdr xs) new old)))
)))))

