sync:
	sudo nixos-rebuild switch --flake .#
update:
	nix flake update
upgrade:
	nix flake update
	sudo nixos-rebuild switch --flake .#
