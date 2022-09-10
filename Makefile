sync:
	git add . 
	alejandra -q .
	sudo nixos-rebuild switch --flake .#
	git add .
	git commit -m "auto: syncing"
	hyprctl reload

update:
	alejandra -q .
	git add . 
	sudo nix flake update
	git add .
	git commit -m "auto: update"
	hyprctl reload

upgrade:
	git commit --amend -m "commit before upgrade"
	alejandra -q .
	git add . 
	sudo nix flake update
	sudo nixos-rebuild switch --flake .#
	git add .
	git commit -m "auto: upgrade"
	hyprctl reload

boot-update:
	alejandra -q .
	git add .
	sudo nixos-rebuild boot --flake .# 
	git add .
	git commit -m "auto: boot-update"
	hyprctl reload

