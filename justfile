default:
  git add . && git commit -m "feat: update" && git push origin main
update:
  sudo nix flake update && just pelusa
pelusa:
  sudo nixos-rebuild switch --flake .#pelusa
laptop:
  sudo nixos-rebuild switch --flake .#laptop
