{
  description = "my nix configuration ";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nur,
    ...
  }: let
    system = "x86_64-linux";
    user = "a";
    pkgs = import nixpkgs {
      inherit nur system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
    hm = home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true; # uses the packages that comes with nix not home-manager.
      home-manager.useUserPackages = true;
      home-manager.extraSpeialArgs = {inherit user;};
      home-manager.users.${user} = {
        home.stateVersion = "22.11";
      };
    };
  in {
    nixosConfigurations = {
      nixer = lib.nixosSystem {
        inherit system user hm nur;
        modules = [
          ./configuration.nix
          ./modules/browsers
          ./modules/daily
          ./modules/development
          ./modules/hardware
          ./modules/launcher
          ./modules/network
          ./modules/shell
          ./modules/file
          ./modules/terminal
          ./modules/video
          ./modules/wayland
          ./modules/wm
          ./modules/environment
        ];
      };
    };
  };
}
