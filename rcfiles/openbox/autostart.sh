# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# Set a keyboard repeat-delay of 500 ms and a repeat-rate of 50 hz.
/usr/bin/xset r rate 500 50

# Set a background color
# BG=/usr/bin/xsetroot
# test -z $BG || $BG -solid SteelBlue
/usr/bin/xsetroot -solid "#002550"

# D-bus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
  eval `dbus-launch --sh-syntax --exit-with-session`
fi

if test -x /usr/bin/fbpanel >/dev/null; then
  /usr/bin/fbpanel &
fi
