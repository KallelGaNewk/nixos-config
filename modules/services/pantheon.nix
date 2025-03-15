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

  services.pantheon.apps.enable = false;

  environment.systemPackages = with pkgs; [
    baobab # Analyse disk usage
    loupe # Image viewer
    nautilus # File explorer
    sushi # QuickLook from macOS
    pantheon.elementary-screenshot
  ];

  fonts.packages = [
    pkgs.pantheon.elementary-redacted-script
  ];
}
