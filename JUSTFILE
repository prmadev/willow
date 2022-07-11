sync:
	alejandra .
	git add . 
	git commit -m "auto: syncing"
	sudo nixos-rebuild switch --flake .#
update:
	alejandra .
	git add . 
	git commit -m "auto: update"
	nix flake update
upgrade:
	alejandra .
	git add . 
	git commit -m "auto: upgrade"
	nix flake update
	sudo nixos-rebuild switch --flake .#
