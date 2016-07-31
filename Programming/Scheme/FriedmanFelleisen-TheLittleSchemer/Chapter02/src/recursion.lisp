(define atom? (lambda (x)
	(and 
		(not (pair? x)) 
		(not (null? x)))
))

(define lat? 
	(lambda (l) 
		(cond
			((null? l) #t)
			((atom? (car l)) 
				(lat? (cdr l)))
			(else #f)
)))

(define member?
	(lambda (x xs)
		(cond
			((null? xs) #f)
			(else 
				(or (eq? (car xs) x) 
				(member? x (cdr xs)))
))))	