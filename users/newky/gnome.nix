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
  };
}
