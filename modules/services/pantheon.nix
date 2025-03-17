{ pkgs, ... }:
{
  services.xserver = {
    enable = true; # Use "Secure Session" to use Wayland
    desktopManager.pantheon.enable = true;
    displayManager.lightdm = {
      enable = true;
      greeters.pantheon.enable = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      baobab # Analyse disk usage
      loupe # Image viewer
      nautilus # File explorer
      sushi # QuickLook from macOS

      # To run GNOME apps
      adwaita-icon-theme
      gnome-themes-extra
    ];
    pantheon.excludePackages =
      with pkgs.pantheon;
      [
        elementary-calculator
        elementary-calendar
        elementary-camera
        elementary-code
        elementary-files
        elementary-mail
        elementary-music
        elementary-photos
        elementary-screenshot
        elementary-tasks
        elementary-terminal
        elementary-videos
        epiphany
      ]
      ++ (with pkgs; [
        evince
        file-roller
      ]);
  };
}
