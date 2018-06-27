(define texmacs-user (current-module))
(define temp-module (current-module))

(define-macro (with-module module . body)
  `(begin
     (set! temp-module (current-module))
     (set-current-module ,module)
     ,@body
     (set-current-module temp-module)))


(define-macro (import-from . modules)
        `(process-use-modules
          (list ,@(map (lambda (m)
                         `(list ,@(compile-interface-spec m)))
                       modules))))

(define-macro (inherit-modules . which-list)
  (define (module-exports which)
    (let* ((m (resolve-module which))
           (m-public (module-ref m '%module-public-interface)))
      (module-map (lambda (sym var) sym) m-public)))
  (let ((l (apply append (map module-exports which-list))))
    `(begin
       (use-modules ,@which-list)
       (re-export ,@l))))

(define-macro (texmacs-module name . options)
  (define (transform action)
    (cond ((not (pair? action)) (noop))
          ((equal? (car action) :use) (cons 'use-modules (cdr action)))
          ((equal? (car action) :inherit) (cons 'inherit-modules (cdr action)))
          ((equal? (car action) :export)
           (display "Warning] The option :export is no longer supported\n")
           (display "       ] Please use tm-define instead\n"))
          (else '(noop))))
  (let ((l (map-in-order transform options)))
        (set! l (cons `(module-use! (current-module) ,texmacs-user) l))
    (display "loading ") (display name) (display "\n")
    `(begin
       (define-module ,name)
       ,@l)))
