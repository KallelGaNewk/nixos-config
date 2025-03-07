{ pkgs, ... }: {
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        appindicator.extensionUuid # Systray Icons
      ];
    };

    # Dark mode interface
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

    # Disable screen dimming
    settings."org/gnome/desktop/session".idle-delay = 0; # default: 300
    settings."org/gnome/settings-daemon/plugins/power".idle-brightness = 100; # default: 30
    settings."org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "nothing"; # default: suspend

    # Fixes cursor themes in gnome apps under hyprland
    settings."org/gnome/desktop/interface" cursor-size = toString home.pointerCursor.size;
    settings."org/gnome/desktop/interface".cursor-theme = config.home.pointerCursor.name;
  };
}
