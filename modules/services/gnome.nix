# GNOME configuration

{ pkgs, ... }:
{
  services.xserver = {
    enable = false; # Only using Wayland
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Install extensions, enable on home-manager
  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    dash-to-dock
  ];

  environment.gnome.excludePackages = with pkgs; [
    # baobab # Analyse disk usage
    # loupe # Image viewer
    # nautilus # File explorer
    # sushi # QuickLook from macOS

    ## Necessary apps, I think
    # adwaita-icon-theme
    # gnome-bluetooth
    # gnome-color-manager
    # gnome-menus # Library that implements freedesktops's Desktop Menu Specification in GNOME
    # gnome-shell-extensions
    # gtk3.out # for gtk-launch program
    # xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/

    atomix # puzzle game
    cheese # webcam tool
    epiphany # WebKit based web browser
    evince # Document viewer
    file-roller # Archive manager, use Ouch instead
    geary # Mail client
    gedit # text editor
    glib # for gsettings program
    hitori # sudoku game
    iagno # go game
    orca # Screen reader
    seahorse # Manage encryption keys and passwords in the GnomeKeyring
    snapshot # Webcam photo and video
    sysprof # System-wide profiler for Linux
    tali # poker game
    totem # Movie player
    xdg-user-dirs-gtk # Used to create the default bookmarks
    yelp # GNOME help
    gnome-backgrounds
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-connections # Remote Desktop
    gnome-console
    gnome-contacts
    gnome-control-center # Settings app
    gnome-disk-utility # Udisks graphical front-end
    gnome-font-viewer
    gnome-logs
    gnome-music
    gnome-software
    gnome-system-monitor # Use bottom (btm) instead
    gnome-text-editor
    gnome-tour
    gnome-user-docs
    gnome-weather

    # Enable only on LapCat
    # gnome-clocks
    # gnome-maps
    # simple-scan
  ];

  # Systray Icons
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
}
