sync:
	git add . 
	alejandra -q .
	# sudo proxychains4 -f /home/a/.proxychains/proxychains.conf nixos-rebuild switch --flake .#
	# sudo NIX_CURL_FLAGS="-x socks5://127.0.0.1:1080" nixos-rebuild switch --flake .#
	NIX_CURL_FLAGS="-x 127.0.0.1:1080" sudo proxychains4 -f /home/a/.proxychains/proxychains.conf  nixos-rebuild switch --flake .#
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
	NIX_CURL_FLAGS="-x 127.0.0.1:1080" sudo proxychains4 -f /home/a/.proxychains/proxychains.conf nix flake update
	NIX_CURL_FLAGS="-x 127.0.0.1:1080" sudo proxychains4 -f /home/a/.proxychains/proxychains.conf  nixos-rebuild switch --flake .#
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

