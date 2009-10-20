;;; -*- mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; Copyright (c) 2009 by the authors.
;;;
;;; See LICENCE for details.

(in-package :common-lisp-user)

(defpackage :hu.dwim.common-lisp)

(defpackage :hu.dwim.common
  (:use :alexandria
        :anaphora
        :closer-mop
        :hu.dwim.common-lisp
        :iterate
        :metabang-bind)

  (:export #:export-external-symbols
           #:export-external-symbols-of-used-packages))

;;;;;;
;;; We can not (in-package :hu.dwim.common) yet, because we are just setting it up now.
;;; So, we do all this in :common-lisp-user and intern a few symbols there needed for the implementation below.

(defparameter hu.dwim.common::*common-lisp-symbols-absent-in-hu.dwim.common-lisp*
  '(common-lisp:time
    ;; common-lisp:get computed-class uses it for now
    common-lisp:set
    ))

(defun hu.dwim.common::export-external-symbols (source-package target-package &key filter)
  (setf target-package (find-package target-package))
  (unless filter
    (setf filter (constantly t)))
  (do-external-symbols (symbol source-package)
    (when (funcall filter symbol)
      ;; do take care of the symbol nil: (list nil)!
      (let ((symbol (or symbol (list nil))))
        (import symbol target-package)
        (export symbol target-package)))))

(defun hu.dwim.common::export-external-symbols-of-used-packages (package &key filter)
  (dolist (used-package (package-use-list (find-package package)))
    (hu.dwim.common::export-external-symbols used-package package :filter filter)))

(hu.dwim.common::export-external-symbols
 :common-lisp :hu.dwim.common-lisp
 :filter (lambda (symbol)
           (not (member symbol hu.dwim.common::*common-lisp-symbols-absent-in-hu.dwim.common-lisp*))))

(hu.dwim.common::export-external-symbols-of-used-packages :hu.dwim.common)
