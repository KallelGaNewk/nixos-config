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

  # EasyEffects presets and config
  services.easyeffects.enable = true;
  home.file.".config/easyeffects/input/mic.json" = {
    source = ../../assets/easyeffects-input.json;
  };
  home.file.".config/easyeffects/output/headset.json" = {
    source = ../../assets/easyeffects-output.json;
  };

  home.packages = with pkgs; [
    (vesktop.override { withSystemVencord = true; })
    (osu-lazer-bin.override { nativeWayland = true; })
    clapper # Video/audio app, VLC GTK basically
    fastfetch
    file
    just # Make but better
    lm_sensors
    mousam # Weather app
    ouch # Easy (de)compressing
    pinta
    resources
    telegram-desktop
    tree
    which

    # GTK skins
    #addwater
    #adwsteamgtk

    # Other tools
    #bottles
    #livecaptions
    #authenticator
    #video-trimmer
    #iplookup-gtk
    #binary
  ];

  programs.git = {
    enable = true;
    userName = "KallelGaNewk";
    userEmail = "kallelgn@gmail.com";
  };

  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-copilot ];
    settings = {
      git_protocol = "ssh";
    };
  };
}
