;;; -*- mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; Copyright (c) 2009 by the authors.
;;;
;;; See LICENCE for details.

(in-package :common-lisp-user)

(defpackage :hu.dwim.common-lisp
  (:use :alexandria
        :anaphora
        :closer-mop
        :common-lisp
        :iterate
        :metabang-bind))

(in-package :hu.dwim.common-lisp)

(dolist (package (package-use-list (find-package :hu.dwim.common-lisp)))
  (do-external-symbols (symbol package)
    (unless (member symbol '(common-lisp:time common-lisp:set))
      (export (list symbol)))))
