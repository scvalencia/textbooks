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
			((eq? 
				(car xs) x) 
					(cdr xs))
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

(define insertR
	(lambda (new old xs)
		(cond 
			((null? xs) '())
			(else
				(cond
					((eq? (car xs) old) 
						(cons 
							old 
							(cons new (cdr xs))))
					(else 
						(cons 
							(car xs) 
							(insertR new old (cdr xs))))))
)))

(define insertL
	(lambda (new old xs)
		(cond 
			((null? xs) '())
			(else
				(cond 
					((eq? (car xs) old)
						(cons 
							new 
							(cons old (cdr xs)))
					(else
						(cons 
							(car xs) 
							(insertL new old (cdr xs)))))))
)))

(define replace
	(lambda (new old xs)
		(cond 
			((null? xs) '())
			((eq? (car xs) old) (cons new (cdr xs)))
			(else (cons (car xs) (replace new old (cdr xs))))
)))

(define replace2
	(lambda (new old1 old2 xs)
		(cond 
			((null? xs) '())
			((eq? old1 (car xs))
				(cons new (cdr xs)))
			((eq? old2 (car xs))
				(cons new (cdr xs)))
			(else 
				(cons 
					(car xs) 
					(replace2 
						new old1 old2 
						(cdr xs))))
)))

(define replace22
	(lambda (new old1 old2 xs)
		(cond 
			((null? xs) '())
			((or 
				(eq? old1 (car xs)) 
				(eq? old2 (car xs))) 
					(cons new (cdr xs)))
			(else 
				(cons 
					(car xs) 
					(replace22 
						new old1 old2 
						(cdr xs))))
)))

(define multirember
	(lambda (x xs)
		(cond
			((null? xs) '())
			((eq? (car xs) x)
				(multirember x (cdr xs)))
			(else
				(cons 
					(car xs) 
					(multirember 
						x 
						(cdr xs))))
)))
