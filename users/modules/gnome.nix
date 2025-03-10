{
  config,
  pkgs,
  lib,
  ...
}:
{
  # https://discourse.nixos.org/t/icons-missing-in-gnome-applications/49835/7
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
  };

  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        appindicator.extensionUuid
        dash-to-dock.extensionUuid
        easyeffects-preset-selector.extensionUuid
      ];
    };

    settings = {
      "org/gnome/shell/extensions/dash-to-dock" = {
        show-trash = false;
        show-mounts = false;
        custom-theme-shrink = true;
        running-indicator-style = "DASHES";
        running-indicator-dominant-color = true;
        disable-overview-on-startup = true;
        transparency-mode = "DYNAMIC";
        customize-alphas = true;
        min-alpha = 0.2;
        max-alpha = 0.8;
      };

      "org/gnome/desktop/background" =
        let
          # Can also be a local asset:
          #background = "file://" + ../../assets/background.png;
          background = "https://kallelganewk.github.io/background.jpg";
        in
        {
          picture-uri = background;
          picture-uri-dark = background;
        };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";

        # Fixes cursor themes
        cursor-size = config.home.pointerCursor.size;
        cursor-theme = config.home.pointerCursor.name;
      };

      "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";

      "org/gnome/mutter" = {
        edge-tiling = true;
        experimental-features = [ "variable-refresh-rate" ];
      };

      # Disable screen dimming
      "org/gnome/desktop/session".idle-delay = lib.gvariant.mkUint32 0; # default: 300
      "org/gnome/settings-daemon/plugins/power" = {
        idle-brightness = 100; # default: 30
        sleep-inactive-ac-type = "nothing"; # default: suspend
      };

      # Nautilus configuration
      "org/gtk/gtk4/settings/file-chooser".show-hidden = true;
      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        show-delete-permanently = true;
      };
      "org/gnome/nautilus/list-view" = {
        use-tree-view = true;
        default-zoom-level = "small";
        default-visible-columns = [
          "name"
          "size"
          "owner"
          "group"
          "permissions"
          "date_modified"
        ];
      };

      /*
        /org/gnome/desktop/background/color-shading-type
          'solid'
        /org/gnome/desktop/background/picture-options
          'zoom'
        /org/gnome/desktop/background/picture-uri
          'file:///nix/store/gl7x0j74n3d5m6gbwqcn8pmvrp3x6xnj-simple-blue-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-blue.png'
        /org/gnome/desktop/background/picture-uri-dark
          'file:///nix/store/yjpn56dw54f44r88fbbbdzayqwb1m7az-simple-dark-gray-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-dark-gray.png'
        /org/gnome/desktop/background/primary-color
          '#3a4ba0'
        /org/gnome/desktop/background/secondary-color
          '#2f302f'
      */
    };
  };
}
