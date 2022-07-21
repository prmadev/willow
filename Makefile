sync:
	git add . 
	alejandra -q .
	sudo nixos-rebuild switch --flake .#
	git commit -m "auto: syncing"
update:
	alejandra -q .
	git add . 
	sudo nix flake update
	git commit -m "auto: update"
upgrade:
	alejandra -q .
	git add . 
	sudo nix flake update
	sudo nixos-rebuild switch --flake .#
	git commit -m "auto: upgrade"
boot-update:
	alejandra -q .
	git add .
	sudo nixos-rebuild boot --flake .# 
	git commit -m "auto: boot-update"

