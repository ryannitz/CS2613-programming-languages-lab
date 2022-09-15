#lang slideshow

;usage: (square 5)
(define (square n)
  (filled-rectangle n n))


;map on a list
;usage: (original-rainbow (square 5))
;usage: (apply vc-append (original-rainbow (square 5)))
(define (original-rainbow p)
  (map (lambda (color)
         (colorize p color))
       (list "red" "orange" "yellow" "green" "blue" "purple")))


;usage: (my-rainbow (square 5))
(define (my-rainbow p)
  (define (color-mapper shape colorlist)
    (cond
      [(empty? colorlist) empty]
      [else (cons (colorize shape (first colorlist))
                  (color-mapper shape (rest colorlist)))]))
  (color-mapper p (list "red" "orange" "yellow" "green" "blue" "purple")))


;  this->that

;export the module definitions
(provide square my-rainbow)
