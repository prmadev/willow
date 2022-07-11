sync:
	git add . 
	git commit -m "auto: syncing"
	sudo nixos-rebuild switch --flake .#
update:
	git add . 
	git commit -m "auto: update"
	nix flake update
upgrade:
	git add . 
	git commit -m "auto: upgrade"
	nix flake update
	sudo nixos-rebuild switch --flake .#
