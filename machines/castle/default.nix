{ inputs, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "castle";

  # Users
  users.defaultUserShell = pkgs.zsh;
  users.users.newky = {
    isNormalUser = true;
    description = "newky";
    useDefaultShell = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
    ];
  };

  # Home-manager settings
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "homemanagerbackupwhichthereisnooptiontodisable";
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.newky = {
    home.username = "newky";
    home.homeDirectory = "/home/newky";

    imports = [
      ../../users/modules/general.nix
      ../../users/modules/gnome.nix

      ../../users/modules/alacritty.nix
      ../../users/modules/floorp.nix
      ../../users/modules/spotifyd.nix
      ../../users/modules/vscode.nix
      ../../users/modules/zed.nix
    ];

    programs.home-manager.enable = true;
    home.stateVersion = "24.11";
  };

  system.stateVersion = "24.11";
}
