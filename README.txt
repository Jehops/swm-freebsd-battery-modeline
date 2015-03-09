Put %b in your StumpWM mode-line format string (*screen-mode-line-format*) to
get the percentage of battery power remaing.  If the battery is discharging the
value returned will be red, otherwise it will be green.

In addition to the lisp code, there is a small Bourne shell script, ml_bat.sh.
Make sure this script is executable by the user running StumpWM and within the
user's $PATH.  Have a look at the script to customize certain settings, such as
the interval between updates.

FAQ

Q: What do I need to put in my ~/.stumpwmrc to get this working?

A: First, make sure the source is in your load-path.  To add it, use something
like (add-to-load-path "/usr/home/jrm/scm/swm-freebsd-battery-modeline").  Next,
load the module with (load-module "swm-freebsd-battery-modeline").  Finally
create a mode-line format string with %b in it, e.g., (setf *screen-mode-line-format*
"^[^8*Battery: ^] %b").

Q: So, why use a separate script.  Couldn't all the code be contained within the
module.

A: Yes, it could.  I tried doing that with and without threads.  I found StumpWM
became less responsive in both cases.  Don't you prefer a snappy StumpWM?

Q: Will this only run on FreeBSD.

A: By default, yes, but it should be quite simple to modify ml_bat.sh to get it
working on your OS.