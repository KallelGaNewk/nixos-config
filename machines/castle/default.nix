{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/location.nix
    ../../modules/nixos/services
    ../../modules/nixos/steam.nix
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
    firewall = {
      enable = true;
      allowedUDPPorts = [
        5353 # Spotifyd mDNS
      ];
      allowedTCPPorts = [
        3535 # Spotifyd ZeroConf
      ];
    };
  };

  # Environment
  environment = {
    systemPackages = with pkgs; [
      git
      wget
    ];
    sessionVariables = {
      # Enable Ozone Wayland support in Chromium and Electron based applications
      # This doesn't fix GNOME's Client-side decorations (CSD) for Spotify with blue bars.
      NIXOS_OZONE_WL = "1";
    };
  };

  programs.dconf.enable = true;
  fonts.packages = [ pkgs.cascadia-code ];

  # Users
  users.users.newky = {
    isNormalUser = true;
    description = "newky";
    extraGroups = [ "networkmanager" "wheel" ];
    password = "12345";
  };

  system.stateVersion = "24.11";
}
