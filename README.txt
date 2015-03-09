Put %b in your StumpWM mode-line format string (*screen-mode-line-format*) to
get the percentage of battery power remaing.  If the battery is discharging the
value returned will be red, otherwise it will be green.

In addition to the lisp code, there is a small Bourne shell script, ml_bat.sh.
Make sure this script is executable by the user running StumpWM and within the
user's $PATH.  Have a look at the script to customize certain settings, such as
the interval between updates.

FAQ

Q: So, why use a separate script.  Couldn't all the code be contained within the
module.

A: Yes, it could.  I tried doing that with and without threads.  I found StumpWM
became less responsive in both cases.