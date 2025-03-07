# GNOME configuration

{ pkgs, ... }: {
  services.xserver = {
    enable = false; # Only using Wayland
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    geary # email reader
    gedit # text editor
    gnome-characters
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    hitori # sudoku game
    iagno # go game
    tali # poker game
    totem # video player
  ];

  # Systray Icons
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
}
