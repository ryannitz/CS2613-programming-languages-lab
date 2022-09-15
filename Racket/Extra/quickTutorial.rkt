#lang slideshow
(define c (circle 10))
(define r (rectangle 10 20))

(define (square n)
  ; A semi-colon starts a line comment.
  ; The expression below is the function body.
  (filled-rectangle n n))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;part 5 - Local Binding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;usage: (four r)
(define (four p)
  (define two-p (hc-append p p))
  (vc-append two-p two-p))

;usage: (checker (colorize (square 10) "red")(colorize (square 10) "black"))
(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))

;usage: (checkerboard (square 10))
(define (checkerboard p)
  (let* ([rp (colorize p "red")]
         [bp (colorize p "black")]
         [c (checker rp bp)]
         [c4 (four c)])
    (four c4)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;part 6 - Functions are values
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;usage: (series circle) or (series square)
;lambda usage: (series (lambda (size) (checkerboard (square size))))
(define (series mk)
  (hc-append 4 (mk 5) (mk 10) (mk 20)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;part 7 - Lexical Scope
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;usage: (rgb-series circle) or (rgb-series square)
(define (rgb-series mk)
  (vc-append
   (series (lambda (sz) (colorize (mk sz) "red")))
   (series (lambda (sz) (colorize (mk sz) "green")))
   (series (lambda (sz) (colorize (mk sz) "blue")))))

;Here’s another example, where rgb-maker takes a function and returns a new one that remembers and uses the original function.
;usage: (series (rgb-maker circle))
(define (rgb-maker mk)
  (lambda (sz)
    (vc-append (colorize (mk sz) "red")
               (colorize (mk sz) "green")
               (colorize (mk sz) "blue"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;part 8 - Lists
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;usage: (list "red" "green" "blue")
;usage: (list (circle 10) (square 10))

;map on a list
;usage: (rainbow (square 5))
(define (rainbow p)
  (map (lambda (color)
         (colorize p color))
       (list "red" "orange" "yellow" "green" "blue" "purple")))

;apply on a list
;usage: (apply vc-append (rainbow (square 5)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;part 9 - Modules
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;usage: (filled-flash 40 30)
(require pict/flash)

;exporting the definition
  ;(provide rainbow square)

;in a new file, refer to this file to be imported
  ;#lang racket
  ;(require "quickTutorial.rkt")
  ;(rainbow (square 5))