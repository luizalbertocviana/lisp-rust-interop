(defpackage :lib
  (:use :common-lisp :sb-alien))

(in-package :lib)

(load-shared-object "target/release/librust_lisp_interop.so")

(define-alien-routine "add" long
  (x long)
  (y long))

(define-alien-routine "hello" c-string)

(define-alien-type nil
    (struct Point
            (x long)
            (y long)))

(define-alien-routine "new_point" (* (struct Point))
  (x long)
  (y long))

(define-alien-routine "get_x" long
  (point (* (struct Point))))

(define-alien-routine "get_y" long
  (point (* (struct Point))))
