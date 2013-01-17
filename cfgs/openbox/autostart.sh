# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# Set a background color
# BG=/usr/bin/xsetroot
# test -z $BG || $BG -solid SteelBlue
/usr/bin/xsetroot -solid "#002550"

# D-bus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# # Preload stuff for KDE apps
# if which start_kdeinit >/dev/null; then
# LD_BIND_NOW=true start_kdeinit --new-startup +kcminit_startup &
# fi

# Run XDG autostart things.  By default don't run anything desktop-specific
# See xdg-autostart --help more info
DESKTOP_ENV="OPENBOX"
if which /usr/lib/openbox/xdg-autostart >/dev/null; then
  /usr/lib/openbox/xdg-autostart $DESKTOP_ENV
fi

if test -x /usr/bin/fbpanel >/dev/null; then
  /usr/bin/fbpanel &
fi
