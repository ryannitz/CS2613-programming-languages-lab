#lang racket
(require xml)
(require xml/path)
(require rackunit)
(require explorer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Step 15/PART C-1: Setting Up 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; just loada the data and converts it to an X-expr
(define (load-xexpr path)
 (define cleaner (eliminate-whitespace '(property) not))
 (xml->xexpr (cleaner (document-element (read-xml/document (open-input-file path))))))
;;just binds test1 and test2 to the X-expr.
(define test1 (load-xexpr "test1.xml"))
(define test2 (load-xexpr "test2.xml"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Step 16 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(define entries (se-path*/list '(playlist) test1))
;(explore entries)
;(se-path* '(entry #:in) test1)
;(se-path* '(entry #:out) test1)

;(define entries2 (se-path*/list '(playlist) test2))
;(explore entries2)
;(se-path* '(entry #:in) test2)
;(se-path* '(entry #:out) test2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Step 17/PART C-2: Counting Single Entry Frames
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (entry-frames entry)
  (+ 1 (- (string->number (se-path* '(entry #:out) entry)) (string->number (se-path* '(entry #:in) entry)))))

(module+ test
 (check-equal? (entry-frames '(entry ((in "6") (out "152") (producer "1")))) 147)
 (check-exn exn:fail? (lambda () (entry-frames '(some garbage))))); look to handle this second exception


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Step 18/PART-C-3: Counting Playlist Frames
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;example tail recursion
;(define (my-length lst)
; (define (iter lst len)
;   (cond
;     [(empty? lst) len]
;     [else (iter (rest lst) (+ len 1))]))
; (iter lst 0))
;usage (my-length (list 1 2 3 4 7))


(define (count-frames-worker len lst)
  (cond
    [(empty? lst) len]
    [else (count-frames-worker (+ len (entry-frames (first lst))) (rest lst))]))


(define (count-frames xexpr)
 (define (count-frames-helper lst acc)
   (cond
     [(empty? lst) 0]
     [else(count-frames-worker (+ acc (entry-frames (first lst))) (rest lst))]))
  (count-frames-helper (se-path*/list '(playlist) xexpr) 0))

(module+ test
 (check-equal? (count-frames test1) 147)
 (check-equal? (count-frames test2) 33592))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BONUS STEP/PARTC-Bonus: GET PROPS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (producer-props src)
  (se-path*/list '(producer) src))

(module+ test
  (check-equal? (producer-props test1)
                '((property ((name "resource")) "orange.mkv")
                  (property ((name "resource")) "slide.png"))))


(define (resource-file property)
  (define expected-prop '((name "resource")))
  (define actual-prop (list-ref property 1))
  (cond
    [(not (equal? expected-prop actual-prop)) #f]; could not get match to work :(
    [(not (equal? 3 (length property))) #f]
    [else (list-ref property 2)]))

(module+ test
 (check-false (resource-file '(property ((name "identity")))) "wrong property name")
 (check-false (resource-file '(property ((name "resource")))) "missing resource name")
 (check-equal? (resource-file '(property ((name "resource")) "this")) "this" "resource name returned"))

; filter-map usage
;(filter-map (lambda (x) (and (negative? x) (abs x))) '(1 2 -3 -4 8))

(define (resources src)
  (filter-map (lambda (x) (resource-file x)) (producer-props src)))

(module+ test
 (check-equal? (resources test1) '("orange.mkv" "slide.png"))
 (check-equal? (resources test2) (se-path*/list '(producer property) test2)))