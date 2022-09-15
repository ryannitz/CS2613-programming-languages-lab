#lang slideshow
(require rackunit)

(define (plus x y)
 (- x y)) ;yikes --- this isn’t right!

(define (list-length list)
 (if (empty? list)
 0
 (+ 1 (list-length list)))) ;yikes --- this doesn’t work!



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; tests
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(check-equal? (plus 5 5) 10)

; this just overflows rip
;(list-length (list "a" "b" "c"))