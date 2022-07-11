sync:
	alejandra -q .
	git add . 
	git commit -m "auto: syncing"
	sudo nixos-rebuild switch --flake .#
update:
	alejandra -q .
	git add . 
	git commit -m "auto: update"
	nix flake update
upgrade:
	alejandra -q .
	git add . 
	git commit -m "auto: upgrade"
	nix flake update
	sudo nixos-rebuild switch --flake .#
