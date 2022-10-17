sync:
	git add . 
	alejandra -q .
	export NIX_CURL_FLAGS="-x 127.0.0.1:1080"
	sudo proxychains4 -f /home/a/.proxychains/proxychains.conf nixos-rebuild switch --flake .#
	git add .
	git commit -m "auto: syncing"
	hyprctl reload

update:
	alejandra -q .
	git add . 
	export NIX_CURL_FLAGS="-x 127.0.0.1:1080"
	sudo nix flake update
	git add .
	git commit -m "auto: update"
	hyprctl reload

upgrade:
	git commit --amend -m "commit before upgrade"
	alejandra -q .
	git add . 
	export NIX_CURL_FLAGS="-x 127.0.0.1:1080"
	sudo proxychains4  -f /home/a/.proxychains/proxychains.conf nix flake update
	sudo proxychains4 -f /home/a/.proxychains/proxychains.conf  nixos-rebuild switch --flake .#
	git add .
	git commit -m "auto: upgrade"
	hyprctl reload

boot-update:
	alejandra -q .
	git add .
	export NIX_CURL_FLAGS="-x 127.0.0.1:1080"
	sudo proxychains4 -f /home/a/.proxychains/proxychains.conf nixos-rebuild boot --flake .# 
	git add .
	git commit -m "auto: boot-update"
	hyprctl reload

