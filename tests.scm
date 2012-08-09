;;; Test Cases for the Scheme Project 

;; To run all tests:
;;     python3 scheme_test.py tests.scm
;;


;; The following should work for the initial files.

3
; expect 3

-123
; expect -123

1.25
; expect 1.25

#t
; expect #t

#f
; expect #f

)
; expect Error

;; In the following sections, you should provide test cases, so that by 
;; running 
;;     python3 scheme_test.py tests.scm
;; you can test the portions of the project you've completed.  In fact, 
;; you might consider writing these tests BEFORE tackling the associated
;; problem!

; Problem 1  (the reader)
;   Initially, the project skeleton simply reads and prints the expressions
;   entered.  Later on, it starts evaluating them.  You may therefore need
;   to modify the tests you initially provide for this section when you get
;   to later sections.  For example, initially, entering the symbol x will
;   simply cause the evaluator to print "x" rather than attempting to evaluate
;   it (and getting an error).  Therefore, you may later have to modify
;   x to (e.g.) 'x

; YOUR TEST CASES HERE

'(1 2 3)

; expect (1 2 3)

'(1 2 . 3)

; expect (1 2 . 3)


'('a 2 3)

; expect ((quote a) 2 3)

'('a 'b 3 'c)

; expect ((quote a) (quote b) 3 (quote c))

'hello

; expect hello

; Problem A2 and B2 (symbol evaluation and simple defines)

; YOUR TEST CASES HERE

+
; expect <primitive procedure>

-
; expect <primitive procedure>

(define x 5)
(define y 6)
x
; expect 5

y
; expect 6

x
; expect 5

(define x 8)
x
; expect 8

(define 1 4)
; expect Error

; Problem 3 (primitive function calls)

; YOUR TEST CASES HERE

(+ 1 5)
; expect 6
(- 3)
; expect -3

(- 5 1 2)
; expect 2
(quotient 5)
; expect Error
(/ 13)
; expect Error
(> 5 3)
; expect #t
(* 1 2 3 4)
; expect 24
(/ 13 0)
; expect Error
(+ 5)
; expect 5
(eqv? 5 5)
; expect #t
(<= 1 3)
; expect #t



; Problem A4, B4, A5, B5, and 6 (calls on user-defined functions)

; YOUR TEST CASES HERE
(lambda (x) (set! y x) (+ x y))
; expect <(lambda (x) (begin (set! y x) (+ x y))), <Global frame at...>>
((lambda (x) (+ (+ x 1) (+ x 1))) 11)
; expect 24

(define hi (lambda (x) (+ x 1)))
hi
; expect <(lambda (x) (begin (+ x 1))), <Global frame at...>>


((lambda (x) (* (+ x 1) 2)) 5)
; expect 12

; Problem 7 (set!)

(set! x 5)
x
; expect 5
(set! y x)
y
; expect 5

(define a '(1 2 3))
(car a)
; expect 1
(set! a 12)
a
; expect 12


; Problem A8 (if, and)

; YOUR TEST CASES HERE

(and #t #f)
; expect #f

(and 'hello 5 #t 'hi)
; expect (quote hi)

(and 'hello 5 #t #f 'hi)
; expect #f

(if (and #t #f) 12 15)
; expect 15

(define z 0)
(if (eqv? z 0) 1 2)
; expect 1

(if (eqv? z 0) (+ z 1) (- z 1))
; expect 1

(if (and (eqv? z 0) #t) (and #t #f) 'hi)
; expect #f

(define (foo n) 10)

(+ (if (and (eqv? z 0) #t) (foo (+ 10 (foo 5))) 1) (if (or #f #t) 10 1))
; expect 20


; Problem B8 (cond, or)

(or #t #f)
; expect #t

(or #f #f 'hello #t)
; expect (quote hello)

(if (or #f #t) 12 15)
; expect 12
(cond ((and #t #f) 12)
      ((- 1 2) => -)
      (else 13))

; expect 1
(cond ((and #t #t) 12)
      ((- 1 2) => -)
      (else 13))

; expect 12

(cond ((and #t #f) 12)
      ((eqv? z 1) => -)
      (else 13))

; expect 13



; Problem 9 (let)

; YOUR TEST CASES HERE
(let ((z 11) (x z)) (set! z (+ z 1)) (list z x))

; expect (12 0)

x
; expect 5
z
; expect 0



; Extra Credit 1 (let*)

; YOUR TEST CASES HERE

(define x 3) (define y 10)


(let* ((x y) (y (+ x 5))) (set! x (+ x 1)) (list x y))

; expect (11 15)
x

; expect 3

y 

; expect 10

; Extra Credit 2 (case)

; YOUR TEST CASES HERE


(case (+ 5 3) ((2 3 5 7) 'prime) ((1 4 6 8 9) 'composite))

; expect composite

(case (car '(s v)) ((a e i o u) 'vowel) ((w y) 'semivowel) (else 'consonant))
; expect consonant

(case (car '(- * +)) ((- sub) (+ x y)) ((* mult) (* 1 1)) ((/ div) (+ 1 2)))
; expect 13

; Problem A10

;; The subsequence of list S for which F outputs a true value (i.e., one
;; other than #f), computed destructively
(define (filter! f L)
  (cond ((NULL? L) L)
        ((not (f (car L))) (set! L (cdr L)) (filter! f L))
        (else (set-cdr! L (filter! f (cdr L))) L)))
         





         ;(cond ((f (cadr L)) (filter3 f (cdr L)))
         ;           (else (set-cdr! L (cddr L)) (filter3 f L))))))

;(define (filter! f lst)
;  (define (filterer f L)
;    (cond ((NULL? (cdr L)) #f)
;          ((f (cadr L)) (filterer f (cdr L)))
;          (else (set-cdr! L (cddr L)) (filterer f L))))
;  (cond ((NULL? lst) '())
;        ((not (f (car lst))) (set! lst (filter! f (cdr lst))) lst)
;        (else (filterer f lst) lst)))


(define a (list 1 2 3 4 5 6 7 8 9 10))
(define b (list 3 4 5 6 7 8 9 10 11 12 13))

(define (mulofthree n) (eqv? (remainder n 3) 0))

(mulofthree 5)
; expect #f

(mulofthree 6)
; expect #t

(filter! mulofthree a)
; expect (3 6 9)

(filter! mulofthree b)
; expect (3 6 9 12)

(define (big x) (> x 5))

(define ints (list 1 10 3 8 4 7))
(define ints1 (cdr ints))

(define filtered-ints (filter! big ints))
filtered-ints
; expect (10 8 7)


(eq? filtered-ints ints1)
; expect #t


; Problem A11.

;; The number of ways to change TOTAL with DENOMS
;; At most MAX-COINS total coins can be used.
(define (count-change total denoms max-coins)
  (define (change-count total denoms max-coins count)
  (cond ((> count max-coins) 0)
        ((eqv? total 0) 1)
        ((or (< total 0) (NULL? denoms)) 0)
        (else (+ (change-count (- total (car denoms)) denoms max-coins (+ count 1)) 
                 (change-count total (cdr denoms) max-coins count)))
        )
    )
  (change-count total denoms max-coins 0))

; (change-count (- total (car denoms)) denoms max-coins (+ count 1)) 
; (change-count total (cdr denoms) max-coins count)
                  
(define us-coins '(50 25 10 5 1))

(< 50 0)
(NULL? '(50 25 10 5 1))
(eqv? (or (< 50 0) (NULL? '(50 25 10 5 1))) #f)
(or (< 50 0) (NULL? '(50 25 10 5 1)))

(count-change 20 us-coins 18)
; expect 8

; Problem B10

; Reverse list L destructively, creating no new pairs.  May modify the 
; cdrs of the items in list L.
(define (reverse! L)
  (if (null? (cdr L)) L (begin (let ((pointer (cdr L)) (reversedlist (reverse! (cdr L)))) (set-cdr! pointer L) (set-cdr! L '()) reversedlist)))
       )
      
(define L (list 1 2 3 4))
(define LR (reverse! L))
LR
; expect (4 3 2 1)

(eq? L (list-tail LR 3))
; expect #t

; Problem B11

;; The number of ways to partition TOTAL, where 
;; each partition must be at most MAX-VALUE

(define (count-partitions total max-value)
  (define (counting n m)
    (cond 
      ((< n 0) 0)
      ((<= m 0) 0) 
      ((eqv? n 0) 1)
      (else (+ (counting (- n m) m) (counting n (- m 1))))))
  (counting total max-value)
  )

(count-partitions 5 3)
; expect 5
; Note: The 5 partitions are [[3 2] [3 1 1] [2 2 1] [2 1 1 1] [1 1 1 1 1]]

; Problem 12

;; A list of all ways to partition TOTAL, where  each partition must 
;; be at most MAX-VALUE and there are at most MAX-PIECES partitions.
(define (list-partitions total max-pieces max-value)
  ; *** YOUR CODE HERE ***
)

(list-partitions 5 2 4)
; expect ((4 1) (3 2))
(list-partitions 7 3 5)
; expect ((5 2) (5 1 1) (4 3) (4 2 1) (3 3 1) (3 2 2))



