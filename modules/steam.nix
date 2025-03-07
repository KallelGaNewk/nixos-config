# Steam and Gamescope configuration

{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.mangohud ];
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--adaptive-sync"
        "--fullscreen"
        "--mangoapp"
        "--rt"
        "-W 1920"
        "-H 1080"
      ];
    };
  };
}
