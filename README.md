# First install on a fresh NixOS machine
```sh
sudo nixos-rebuild switch --extra-experimental-features "nix-command flakes" --flake .#castle
```
