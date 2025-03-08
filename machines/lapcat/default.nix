{ inputs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  # Users
  users.users.newky = {
    isNormalUser = true;
    description = "newky";
    extraGroups = [ "networkmanager" "wheel" ];
    password = "12345";
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
      ../../user/modules/essentials.nix
      ../../user/modules/cursor.nix
      ../../user/modules/gnome.nix

      ../../user/modules/alacritty.nix
      ../../user/modules/floorp.nix
      # ../../user/modules/osu.nix
      # ../../user/modules/spotifyd.nix
      # ../../user/modules/vscode.nix
      ../../user/modules/zed.nix
    ];

    programs.home-manager.enable = true;
    home.stateVersion = "24.11";
  };

  system.stateVersion = "24.11";
}
