;;; -*- mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; Copyright (c) 2009 by the authors.
;;;
;;; See LICENCE for details.

(in-package :common-lisp-user)

(defpackage :hu.dwim.common
  (:use :alexandria
        :anaphora
        :closer-mop
        :hu.dwim.common-lisp
        :iterate
        :metabang-bind)

  (:export #:export-external-symbols
           #:export-external-symbols-of-used-packages))

(in-package :hu.dwim.common)

(defun export-external-symbols (source-package target-package &key filter)
  (setf target-package (find-package target-package))
  (do-external-symbols (symbol source-package)
    (when (or (not filter)
              (funcall filter symbol))
      ;; do take care of the symbol nil: (list nil)!
      (let ((symbol (or symbol (list nil))))
        (import symbol target-package)
        (export symbol target-package)))))

(defun export-external-symbols-of-used-packages (package &key filter)
  (dolist (used-package (package-use-list (find-package package)))
    (export-external-symbols used-package package :filter filter)))

(export-external-symbols-of-used-packages :hu.dwim.common)
