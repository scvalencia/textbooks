;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.2.1 Linear Recursion and Iteration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 0! = 1
;; n! = n * (n - 1)!

(define (recursive-fact-process n)
	(if (= n 0) 
		1
		(* n (recursive-fact-process (- n 1)))))

(define (iterative-fact-process n)
	(define (iterative-fact-process-aux product counter max-count)
		(if (> counter max-count)
			product
			(iterative-fact-process-aux 
				(* counter product)
				(+ counter 1)
				max-count)))
	(iterative-fact-process-aux 1 1 n))

;; Both procedures computethe same mathematical function,
;; and each requires a number of steps proportional to n
;; The most fundamental difference, is the evolved shape
;; while we compute a particular n!.

;; The recursive process expressed in recursive-fact-process,
;; is characterized by a chain of deferred operations. So the
;; interpreter needs to keep track of the computations to be
;; performed later on

;; The second process, does not grows and shriks. All we need
;; to keep track of is the state of the variables

;; Both processes are expressed as recursive procedures

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.2.2 Tree Recursion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Another common patter of computation is called tree 
;; recursion. The fib function is by simple definition
;; expressed as a recursive process:

;; fib(0) = 0 ; fib(1) = 1; fib(n) = fib(n - 1) + fib(n - 2)

(define (recursive-fib-process n)
	(cond 
		((= n 0) 0)
		((= n 1) 1)
		(else 
			(+ 
				(recursive-fib-process (- n 1))
				(recursive-fib-process (- n 2))))))

;; While it's derived directly from the definition, it's
;; a terrible way to compute the Fibonacci numbers becaue
;; it does so much redundant computation. The number of steps 
;; grows exponentially with the input, and the space growns 
;; linearly with the input. We can compute Fibonacci numbers
;; using an iterative process

(define (iterative-fib-process n)
	(define (iterative-fib-process-aux a b count)
		(if (= count 0) 
			b
			(iterative-fib-process-aux (+ a b) a (- count 1))))
	(iterative-fib-process-aux 1 0 n))

;; Fibonacci is an easy one, because it's definition comes from
;; a matemathical definition. Another problem, would be to
;; compute the umber of ways to change any given amount of money

;; Example:
;; Target: 13
;; Coins: 1, 2, 5, 10
;; (change 13 (1 2 5 10))
;; => (+ (change 13 (2 5 10)) (change (- 13 1) (1 2 5 10)))

(define (count-change amount)
	(define (cc amount kinds-of-coins)
		(cond 
			((= amount 0) 1)
			((or (< amount 0) (= kinds-of-coins 0)) 0)
			(else 
				(+
					(cc amount (- kinds-of-coins 1))
					(cc 
						(- amount (first-denomination kinds-of-coins)) 
						kinds-of-coins)))))

	(define (first-denomination kinds-of-coins)
		(cond 
			((= kinds-of-coins 1) 1)
			((= kinds-of-coins 2) 5)
			((= kinds-of-coins 3) 10)
			((= kinds-of-coins 4) 25)
			((= kinds-of-coins 5) 50)))

	(cc amount 5))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.2.3 Orders of Growth
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; BOOK (42)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.2.4 Exponentiation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; BOOK (42)

(define (recursive-pow-process b n)
	(if (= n 0) 1
		(* b (recursive-pow-process b (- n 1)))))

(define (iterative-pow-process b n)
	(define (iterative-pow-process-aux b counter product)
		(if (= counter 0) product
			(iterative-pow-process-aux
				b
				(- counter 1)
				(* b product))))
	(iterative-pow-process-aux b n 1))

(define (even? n)
	(= (remainder n 2) 0))

(define (fast-pow b n)
	(cond 
		((= n 0) 1)
		((even? n) (square (fast-pow b (/ n 2))))
		(else (* b (fast-pow b (- n 1))))))





