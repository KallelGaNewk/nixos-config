{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/location.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/services
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow Unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable systemd-boot
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  # Perform garbage collection weekly
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Network
  networking = {
    hostName = "castle";
    networkmanager.enable = true; # group: networkmanager
    firewall.enable = true;
  };

  # Environment
  environment = {
    systemPackages = with pkgs; [
      git
      wget
    ];
  };

  programs.dconf.enable = true;
  fonts.packages = [ pkgs.cascadia-code ];

  # Users
  users.users.newky = {
    isNormalUser = true;
    description = "newky";
    extraGroups = [ "wheel" "networkmanager" ];
    password = "12345";
  };

  system.stateVersion = "24.11";
}
