;; swm-freebsd-battery-modeline.lisp
;;
;; Put %b in your modeline format string to get the percentage of battery power
;; remaing.  If the battery is discharging the value returned will be red,
;; otherwise it will be green.
;;

(in-package #:swm-freebsd-battery-modeline)

(defvar *bat-percent* "0")
(defvar *bat-state* nil)
(defvar *bat-stream* nil)

(defun set-bat-stream ()
  (setf *bat-stream*
	(sb-ext:process-output
	 (sb-ext:run-program "ml_bat.sh" nil
			     :output :stream
			     :search t
			     :wait nil))))

(defun fmt-freebsd-battery-percent (ml)
  "Return the percentage of battery power remaining."
  (declare (ignore ml))
  (when (not *bat-stream*)
    (set-bat-stream))
  (when (listen *bat-stream*)
    (let ((bat-info (stumpwm::split-string
		     (read-line *bat-stream* nil "") " ")))
      (setf *bat-state* (car bat-info))
      (setf *bat-percent* (nth 1 bat-info))))
  (if (or (string= *bat-state* "0") (string= *bat-state* "2"))
      (format nil "^[^2*~3d^]" (read-from-string *bat-percent*))
      (format nil "^[^1*~3d^]" (read-from-string *bat-percent*))))

;; Install formatter
(stumpwm::add-screen-mode-line-formatter #\b #'fmt-freebsd-battery-percent)
