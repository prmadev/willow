sudo:="doas"
flake_path:=justfile_directory()+"#"

rebuild:
	{{sudo}} nixos-rebuild switch --flake  {{flake_path}} -v --show-trace --print-build-logs --verbose

rebuild-boot:
	{{sudo}} nixos-rebuild switch --install-bootloader --flake  {{flake_path}} -v 

rebuild-fast:
	{{sudo}} nixos-rebuild switch --flake  {{flake_path}} -v --fast



update: update-flake update-channel 

update-flake:
	{{sudo}} nix flake update 

update-channel: 
	nix-channel --update

