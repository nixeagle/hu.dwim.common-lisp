;;; -*- mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; Copyright (c) 2009 by the authors.
;;;
;;; See LICENCE for details.

(load-system :hu.dwim.asdf)

(in-package :hu.dwim.asdf)

(defsystem :hu.dwim.common
  :class hu.dwim.system
  :author ("Attila Lendvai <attila.lendvai@gmail.com>"
           "Levente Mészáros <levente.meszaros@gmail.com>"
           "Tamás Borbély <tomi.borbely@gmail.com>")
  :licence "BSD / Public domain"
  :description "An extended Common Lisp package to the needs of other hu.dwim systems."
  :depends-on (:alexandria
               :anaphora
               :closer-mop
               :hu.dwim.common-lisp
               :iterate
               :metabang-bind)
  :components ((:module "source"
                :components ((:file "common")))))
