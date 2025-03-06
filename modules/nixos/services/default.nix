{ config, ... }: {
  imports = [
    ./gnome.nix
    ./openssh.nix
    ./pipewire.nix
    ./printing.nix
  ];
}
