{ pkgs, ... }:
{
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Setup Vesktop configuration and plugins
  home.file.".config/vesktop/settings.json".source = ../../assets/vesktop-settings.json;
  home.file.".config/vesktop/settings/settings.json".source = ../../assets/vesktop-plugins.json;

  home.packages = with pkgs; [
    (vesktop.override { withSystemVencord = true; })
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

  programs.git = {
    enable = true;
    userName = "KallelGaNewk";
    userEmail = "kallelgn@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}
