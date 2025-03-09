{ pkgs, ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      device = "nodev";
      configurationLimit = 10;
      theme = pkgs.catppuccin-grub;

      # Also a cool theme
      # theme = pkgs.sleek-grub-theme.override { withStyle = "bigSur"; };
    };
  };
}
