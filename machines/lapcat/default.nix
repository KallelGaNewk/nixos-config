{ inputs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "lapcat";

  users.users.newky = {
    isNormalUser = true;
    description = "newky";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    password = "12345";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "homemanagerbackupwhichthereisnooptiontodisable";
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.newky = {
    home.username = "newky";
    home.homeDirectory = "/home/newky";

    imports = [
      ../../users/modules/general.nix
      ../../users/modules/pantheon-dconf.nix
      ../../users/modules/cursor.nix

      ../../users/modules/alacritty.nix
      ../../users/modules/floorp.nix
      ../../users/modules/zed.nix
    ];

    programs.home-manager.enable = true;
    home.stateVersion = "24.11";
  };

  system.stateVersion = "24.11";
}
