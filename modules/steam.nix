# Steam and GameMode configuration

# I tried to use Gamescope, but its laggy for whatever reason
# maybe in the future with new versions of drivers, steam and
# the gamescope all works seamless.

{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

  programs.gamemode.enable = true;
  programs.gamemode.settings.general.inhibit_screensaver = 0;

  environment.systemPackages = with pkgs; [
    mangohud
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs =
        pkgs: with pkgs; [
          mangohud
          gamemode
        ];
    };
  };
}
