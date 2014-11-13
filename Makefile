PROJECT=gsdwacom4xfce
AUTOSTART_DIR=~/.config/autostart
APPS_DIR=~/.local/share/applications

all:
	@echo "usage: make {install|uninstall}"

install:
	mkdir -p $(APPS_DIR) $(AUTOSTART_DIR)
	cp autostart.desktop $(AUTOSTART_DIR)/$(PROJECT).desktop
	cp settingsdialog.desktop $(APPS_DIR)/$(PROJECT).desktop
	./gsdplugins.sh wacom-only
	@echo "Don't forget to install the necessary bits of GNOME:"
	@echo " >>> sudo apt-get install --no-install-recommends --no-install-suggests gnome-settings-daemon gnome-control-center <<<"


uninstall:
	rm -f $(AUTOSTART_DIR)/$(PROJECT).desktop
	rm -f $(APPS_DIR)/$(PROJECT).desktop
	./gsdplugins.sh reset
