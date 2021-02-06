(defpackage :lib
  (:use :common-lisp :sb-alien)
  (:export :new-point :delete-point :with-point :get-x :get-y))

(in-package :lib)

(load-shared-object "target/release/librust_lisp_interop.so")

(define-alien-type nil (struct Point))

(define-alien-routine "new_point" (* (struct Point))
  (x long)
  (y long))

(define-alien-routine "delete_point" void
  (point (* (struct Point))))

(defmacro with-point (name (x y) &body body)
  "creates point with x and y coordinates. Its memory is freed after body is executed"
  `(let ((,name (new-point ,x ,y)))
     (unwind-protect (progn ,@body)
       (delete-point ,name))))

(define-alien-routine "get_x" long
  (point (* (struct Point))))

(define-alien-routine "get_y" long
  (point (* (struct Point))))
