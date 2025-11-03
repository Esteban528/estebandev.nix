.PHONY: desktop laptop

desktop:
	@echo "Rebuilding..."
	@sudo nixos-rebuild switch --flake .#desktop
laptop:
	@echo "Rebuilding..."
	@sudo nixos-rebuild switch --flake .#laptop
update:
	@echo "Updating flake"
	@nix flake update
commit:
	@git add .
	@git commit -m "chore: update"
	@git push
