;;; -*- mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; Copyright (c) 2009 by the authors.
;;;
;;; See LICENCE for details.

(in-package :hu.dwim.common-lisp.documentation)

(def project :hu.dwim.common-lisp :path (system-pathname :hu.dwim.common-lisp))

(def book user-guide (:title "User guide")
  (chapter (:title "Introduction")
    "TODO")
  (chapter (:title "Supported Common Lisp Implementations")
    (paragraph ()
      "SBCL"))
  (chapter (:title "Supported Operating Systems")
    (paragraph ()
      "Linux"))
  (chapter (:title "Tutorial")
    (paragraph ()
      "TODO")))
