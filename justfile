default:
    echo 'Hello, world!'
build:
  sudo nixos-rebuild switch --flake .#pelusa
