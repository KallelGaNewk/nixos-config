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

    settings = {
      "org/gnome/desktop/interface" = {
        # Dark mode interface
        color-scheme = "prefer-dark";

        # Fixes cursor themes
        cursor-size = toString config.home.pointerCursor.size;
        cursor-theme = config.home.pointerCursor.name;
      };

      # Mouse acceleration
      "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";

      # VRR
      "org/gnome/mutter".experimental-features = [ "variable-refresh-rate" ];

      # Disable screen dimming
      "org/gnome/desktop/session".idle-delay = 0; # default: 300
      "org/gnome/settings-daemon/plugins/power" = {
        idle-brightness = 100; # default: 30
        sleep-inactive-ac-type = "nothing"; # default: suspend
      };
    };
  };
}
