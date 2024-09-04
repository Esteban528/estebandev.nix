default:
  git add . && git commit -m "feat: update" && git push origin main
pelusa:
  sudo nixos-rebuild switch --flake .#pelusa
laptop:
  sudo nixos-rebuild switch --flake .#laptop
