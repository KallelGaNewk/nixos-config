switch:
  sudo nixos-rebuild switch --flake .\#$(m)

update:
  nix flake update

upswitch:
  sudo nixos-rebuild switch --recreate-lock-file --flake .

gc:
  sudo nix-collect-garbage --delete-older-than 7d

debug:
  sudo nixos-rebuild switch --flake . --show-trace --verbose
