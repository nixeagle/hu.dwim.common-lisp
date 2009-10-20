;;; -*- mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; Copyright (c) 2009 by the authors.
;;;
;;; See LICENCE for details.

(load-system :hu.dwim.asdf)

(in-package :hu.dwim.asdf)

(defsystem :hu.dwim.common-lisp.documentation
  :class hu.dwim.documentation-system
  :author ("Levente Mészáros <levente.meszaros@gmail.com>"
           "Attila Lendvai <attila.lendvai@gmail.com>"
           "Tamás Borbély <tomi.borbely@gmail.com>")
  :licence "BSD / Public domain"
  :description "Documentation for hu.dwim.common-lisp"
  :depends-on (:hu.dwim.common-lisp
               :hu.dwim.wui)
  :components ((:module "documentation"
                :components ((:file "common-lisp" :depends-on ("package"))
                             (:file "package")))))
