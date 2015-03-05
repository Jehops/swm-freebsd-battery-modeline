;; swm-freebsd-battery.lisp
;;
;; Put %b in your modeline format string to get the percentage of battery power
;; remaing.  If the battery is discharging the value returned will be red,
;; otherwise it will be green.
;;

(in-package #:swm-freebsd-battery)

(defvar *bat-precent* 0)
(defvar *bat-prev-time* 0)
(defvar *bat-state* nil)

(defun fmt-freebsd-battery-percent (ml)
  "Return the percentage of battery power remaining."
  (declare (ignore ml))
  (let ((now (/ (get-internal-real-time) internal-time-units-per-second)))
    (when (or (= 0 *bat-prev-time*) (>= (- now *bat-prev-time*) 15))
      (setf *bat-prev-time* now)
      (let ((battery-info
	     (stumpwm::split-string
	      (stumpwm::run-prog-collect-output "/sbin/sysctl" "-n" "hw.acpi.battery.state" "hw.acpi.battery.life"))))
;;	       stumpwm::*shell-program* "-c"
;;	       "/sbin/sysctl -n hw.acpi.battery.state hw.acpi.battery.life"))))
	(setf *bat-state* (car battery-info))
	(setf *bat-percent* (nth 1 battery-info)))))
	(if (or (string= *bat-state* "0") (string= *bat-state* "2"))
	    (format nil "^[^2*~d^]" *bat-percent*)
	    (format nil "^[^1*~d^]" *bat-percent*)))

;; Install formatter
(stumpwm::add-screen-mode-line-formatter #\b #'fmt-freebsd-battery-percent)
