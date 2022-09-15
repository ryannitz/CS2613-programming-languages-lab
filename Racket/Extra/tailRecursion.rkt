#lang racket
(define (my-length lst)
 (define (iter lst len)
   (cond
     [(empty? lst) len]
     [else (iter (rest lst) (+ len 1))]))
 (iter lst 0))


(my-length (list 1 2 3 4 7))

