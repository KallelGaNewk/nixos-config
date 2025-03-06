switch target:
  sudo nixos-rebuild switch --flake .#{{target}}

update:
  nix flake update

upswitch:
  sudo nixos-rebuild switch --recreate-lock-file --flake .

gc:
  sudo nix-collect-garbage --delete-older-than 7d

debug:
  sudo nixos-rebuild switch --flake . --show-trace --verbose

[confirm('Are you sure you want to delete all .homemanagerbackupwhichthereisnooptiontodisable files?')]
fixhm:
  sudo find / -type f -name "*.homemanagerbackupwhichthereisnooptiontodisable" -exec rm -f {} \;

genhw target:
  nixos-generate-config --dir ./machines/{{target}}
  rm ./machines/{{target}}/configuration.nix
