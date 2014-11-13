#!/bin/sh
# Turn non-Wacom gnome-settings-daemon plugins on or off.


PREFIX="org.gnome.settings-daemon.plugins"
PATTERN='wacom'
SCRIPTNAME=`basename "$0"`

case "$1" in 
    wacom-only|wacom_only|wacomonly)
        echo "Inactivating your non-Wacom gnome-settings-daemon plugins ..."
        gsettings list-recursively "$PREFIX" | sort | uniq \
        | grep -v "$PATTERN" \
        | while read schema key value; do
            if test "x$key" = "xactive"; then
                echo "$schema -> off"
                gsettings set "$schema" active false
            fi
        done
        echo "Activating your Wacom gnome-settings-daemon plugin ..."
        gsettings list-recursively "$PREFIX" | sort | uniq \
        | grep "$PATTERN" \
        | while read schema key value; do
            if test "x$key" = "xactive"; then
                echo "$schema -> on"
                gsettings set "$schema" active true
            fi
        done
        echo "Done. gnome-settings-daemon can now be used to manage Wacom "
        echo "devices' configuration in Xfce, but expect GNOME to be broken."
        ;;
    reset)
        echo "Reinstating all plugins under $PREFIX ..."
        gsettings reset-recursively "$PREFIX"
        echo "Done. GNOME should work now after logging out and back in."
        ;;
    *)
        echo "Usage: $SCRIPTNAME {wacom-only|reset}" >&2
        exit 2
        ;;
esac

