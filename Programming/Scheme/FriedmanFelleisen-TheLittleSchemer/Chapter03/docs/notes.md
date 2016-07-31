# Do it, do it again, and again, and again...

```scheme
;; rember, takes an atom an a list as its arguments, and makes, a new list
;; with the first occurrence of the atom in the old list removed

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

> (buggy-rember 'a '(b a c d a))
(c d a)
```

![](img/second_commandment.png)

```scheme
(define rember
	(lambda (x xs)
		(cond 
			((null? xs) '())
			(else 
				(cond
					((eq? (car xs) x) (cdr xs))
					(else (cons (car xs)
						(rember x (cdr xs))))
)))))

> (rember 'a '(b j u h a c d a))
(b j u h c d a)

;; The function forst, takes one argument, a list, which is either null, 
;; or contains only non-empty lists. It builds another list, composed of
;; the first S-expression of each nested list

(define first
	(lambda (xs)
		(cond 
			((null? xs) '())
			(else
				(cons 
					(car (car xs)) 
					(first (cdr xs))))
)))
					
> (first '((five plum) (de e w w) (i h h k k))
(five de i)
```

![](img/third_commandment.png)

```scheme
;; The function insert, takes three arguments, a list xs and two 
;; atoms old and new. It then builds another list with new inserted
;; to the right of the first occurrence of the atom old in the list

 
```