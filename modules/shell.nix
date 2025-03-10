# Configure Zsh
{ pkgs, ... }:
{
  environment = {
    shellAliases = {
      ll = "ls -lAhp";
    };

    # /etc/shells
    shells = with pkgs; [
      bashInteractive
      zsh
    ];
    systemPackages = [ pkgs.thefuck ];
  };

  programs.zsh = {
    enable = true;
    histSize = 10000;
    enableBashCompletion = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "bureau";
      plugins = [
        "rust"
        "sudo"
        "thefuck"
        "gh"
      ];
    };

    # https://linux.die.net/man/1/zshoptions
    setOptions = [
      "EXTENDED_HISTORY"
      "SHARE_HISTORY"
      "HIST_FCNTL_LOCK"
      "RM_STAR_WAIT"
      "AUTO_CD"
    ];
  };
}
