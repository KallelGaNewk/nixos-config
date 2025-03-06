{ config, pkgs, ... }:

{
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
    "org/gnome/desktop/session".idle-delay = 0; # default: 300
    "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "nothing"; # default: suspend
    "org/gnome/settings-daemon/plugins/power".idle-brightness = 100; # default: 30
  };
}
