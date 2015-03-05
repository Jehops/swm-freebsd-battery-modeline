;;;; swm-freebsd-battery.asd

(asdf:defsystem #:swm-freebsd-battery
  :description "StumpWM modeline battery status for FreeBSD"
  :author "Joseph Mingrone <jrm@ftfl.ca>"
  :license "2-CLAUSE BSD (see COPYRIGHT file for details)"
  :depends-on (#:stumpwm)
  :serial t
  :components ((:file "package")
               (:file "swm-freebsd-battery")))

