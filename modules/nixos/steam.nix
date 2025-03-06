# Steam and Gamescope configuration

{ config, pkgs, ... }: {
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
        "--rt"
        "--mangoapp"
        "--fullscreen"
        "--adaptive-sync"
        "-W 1920"
        "-H 1080"
      ];
    };
  };
}
