{ config, pkgs, ... }:

{
  imports = [
    ./floorp.nix
    ./vscode.nix
    ./gnome.nix
  ];

  home.username = "newky";
  home.homeDirectory = "/home/newky";

  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # home.file.".xxx".text = ''
  #     xxx
  # '';

  home.packages = with pkgs; [
    telegram-desktop
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
      withTTS = false;
    })

    fastfetch # https://github.com/fastfetch-cli/fastfetch
    ouch # https://github.com/ouch-org/ouch
    bottom # https://github.com/ClementTsang/bottom
    just # https://github.com/casey/just
    lm_sensors

    file
    which
    tree
  ];

  services.spotifyd = {
    enable = true;
    settings.global = {
      device_name = "Newky";
      zeroconf_port = 3535; # TCP
    };
  };

  programs.git = {
    enable = true;
    userName = "KallelGaNewk";
    userEmail = "kallelgn@gmail.com";
  };

  programs.alacritty = {
    enable = true;
    # TODO: Alacritty settings
    # settings = {};
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
