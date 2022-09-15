#lang racket
(require rackunit)


; credit: Oscar Lopez on Stack overflow: https://stackoverflow.com/questions/21272678/divisible-function-scheme
; used to check divisibility for the main drop-divisible definition
(define (divisible? x n)
  (zero? (remainder x n)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PART B-1 - creating drop divisible
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; this function assumes n>=2
;(define (drop-divisible n lst)
; (filter (lambda (x) (how the function acts on x, and possibly n)) lst))

(define (drop-divisible n lst)
  (filter (lambda (x) (if (equal? x n) #t (not(divisible? x n)))) lst))
;(drop-divisible 3 (list 2 3 4 5 6 7 8 9 10))

; test for drop-divisible function - works :)
(module+ test
  (check-equal? (drop-divisible 3 (list 2 3 4 5 6 7 8 9 10)) (list 2 3 4 5 7 8 10))
  ; test empty list check - works :)
  (check-equal? (drop-divisible 3 (list)) (list)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PART B-2 - creating sieve-with
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;template
;(define (sieve-with divisors candidates)
; (cond
; [(empty? ----) ----]
; [else (sieve-with ---- (drop-divisible ---- ----))]))

; ways to remove all identical instances from a list:
;(filter (lambda (x) (not (equal? x 2))) (list 1 2 2 3 4 2 5))
;(remove* (list 2) (list 1 2 2 3 4 2 5))

;usage: (sieve-with '(2 3) (list 2 3 4 5 6 7 8 9 10))
(define (sieve-with divisors candidates)
  (cond
    ; Because we are taking out a divisor on each iteration, when we reach 0 divisors remaining, then the remaining candidates are good :)
    [(empty? divisors) candidates]
    ; the following else should be somthing like:
    ; else (sieve-with (list divisors-theDiviserWeAreTakingOut) (drop-divisible theDiviserWeAreTakingOut candidates))
    [else
     (define removedDivisor (list-ref divisors 0))
     ; should use list first and list rest instead of the above define removedDivisor
     ;sieve-with (rest divisors) (drop-divisible (first divisors) candidates)])); not sure you can call rest THEN first. Have to checkith
     (sieve-with (remove* (list removedDivisor) divisors) (drop-divisible removedDivisor candidates))]))
;(sieve-with '(2 3) (list 2 3 4 5 6 7 8 9 10))


; test for sieve-with function - works :)
(module+ test
 (check-equal? (sieve-with '(2 3) (list 2 3 4 5 6 7 8 9 10)) (list 2 3 5 7)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PART B-3 - creating sieve to check for primes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;SUDOCODE brainstorming
     ;(for ([i (in-range 2 (+ 1 (integer-sqrt n)))])
     ;  (display i)
     ;  )
     ;])
  ;if(n == 2), return (list 2)
  ;if(n == 3), return (list 2 3)
  ;for(i = 2 to n){
  ;is i prime?
  
  ;}

  ;for i = 2 to sqrtn{
  ;  if n/i = 0, then n is not prime
  ;}
  ;return n is prime

;Testing making of a list given some range.
;(in-range 2 (+ 1 (integer-sqrt 10)))
;(for/list ([1 (integer-sqrt 10)]))
;(for/list ([i (in-range 2 (+ 1 (integer-sqrt 10)))])i)
;(for/list ([i (in-range 1 11)])i)
;(build-list 10 values)

(define (sieve n)
  (cond
    [(positive? (- 2 n)) (list)]; this should check for n<2 and return empty list
    [(equal? n 2) (list 2)]
    [(equal? n 3) (list 2 3)]
    [else
     ; sieve-with (list (2 to sqrt(n))) (list (2 to n))
     ; could have made this more efficient with "cons" list and such
     (sieve-with (range 2 (+ 1 (integer-sqrt n))) (range 2 (+ 1 n)))
     ;(sieve-with (for/list ([i (in-range 2 (+ 1 (integer-sqrt n)))])i) (for/list ([i (in-range 2 (+ 1 n))])i))
    ]
   )
 )

  

;(display "Expected:")
;(sieve 20)
;output: '(2 3 5 7 11 13 17 19)
;checked n= 1,2,3,4,5,10,20. All seems well in the world :)

;test sieve
(module+ test
 (check-equal? (sieve 10) (list 2 3 5 7))
 ;test sieve n<2
 (check-equal? (sieve 1) (list)))