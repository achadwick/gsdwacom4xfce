:point_right: **This project has moved to <https://github.com/Zeioth/XFCE-Wacom-Settings>**.

This project is no longer actively maintained here. I don't really have the time properly maintain this repository, and I haven't been running Xfce for many months. Luckily, [@Zeioth](https://github.com/Zeioth) has very kindly offered to take over maintainership.

Please update your Xfce installs to use [XFCE-Wacom-Settings](https://github.com/Zeioth/XFCE-Wacom-Settings) instead. The gsdwacom4xfce repository is now archived for historical purposes. :maple_leaf:

--------------------------------------------------

gsdwacom4xfce
-------------

This is a session modification for the Xfce 4.10 desktop environment
which allows GNOME's Wacom tablet settings to be used in Xfce.
The GNOME configuration tool for Wacom tablets has a nice GUI,
and recognises a large number of devices in detail,
right down to the button layout.

To install **gsdwacom4xfce** for your personal use:

```sh
git clone https://github.com/achadwick/gsdwacom4xfce.git
cd gsdwacom4xfce
make install
```

After installation, you'll find the GNOME Wacom settings
available in the Xfce Settings Manager under the *Hardware* heading.

![Screenshot highlighting the settings' location](screenshot.png?raw=true)

The installer also puts an extra Wacom-related startup application
in *Session and Startup*.
After you log out and back in again,
`gnome-settings-daemon` will be running
and you'll be able to plug in your tablet and configure the extra buttons.

There is a corresponding `uninstall` target in the Makefile,
which removes **gsdwacom4xfce**:

```sh
cd path/to/gsdwacom4xfce
make uninstall
```

This reverts your session to the stock set of `gnome-settings-daemon` plugins
and a normal startup.

NOTE: **gsdwacom4xfce** currently breaks GNOME.
Don't install it if you switch between GNOME and Xfce.

