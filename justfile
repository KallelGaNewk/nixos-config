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

fixhm:
  echo "Are you sure you want to delete all .homemanagerbackupwhichthereisnooptiontodisable files? (y/N)"
  read -r confirm && [[ "$confirm" == "y" ]] && sudo find / -type f -name "*.homemanagerbackupwhichthereisnooptiontodisable" -exec rm -f {} \; || echo "Operation cancelled."
