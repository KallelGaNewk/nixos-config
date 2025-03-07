{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./cursor.nix
    ./floorp.nix
    ./gnome.nix
    ./vscode.nix
    ./zed.nix
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
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
      withTTS = false;
    })
    (osu-lazer-bin.override {
      nativeWayland = true;
    })
    telegram-desktop

    bottom # https://github.com/ClementTsang/bottom
    fastfetch # https://github.com/fastfetch-cli/fastfetch
    just # https://github.com/casey/just
    lm_sensors
    ouch # https://github.com/ouch-org/ouch

    file
    tree
    which
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



  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
