{ pkgs, ... }:
{
  services.xserver = {
    enable = false; # Only using Wayland
    desktopManager.pantheon.enable = true;
  };

  services.pantheon.apps.enable = false;

  environment.systemPackages = with pkgs; [
    baobab # Analyse disk usage
    loupe # Image viewer
    nautilus # File explorer
    sushi # QuickLook from macOS
    elementary-screenshot
  ];

  fonts.packages = [
    pkgs.pantheon.elementary-redacted-script
  ];
}
