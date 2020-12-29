(defpackage :lib
  (:use :common-lisp :sb-alien))

(in-package :lib)

(load-shared-object "target/release/librust_lisp_interop.so")

(define-alien-routine "add" int
  (x int)
  (y int))
