{
  description = "my nix configuration ";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ansible-zsh = {
      url = "github:sparsick/ansible-zsh";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    user = "a";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
    with inputs; {
      nixosConfigurations = {
        nixer = lib.nixosSystem {
          inherit system;
          modules = [
            ./system
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true; # uses the packages that comes with nix not home-manager.
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
              home-manager.users.a = {
                home.stateVersion = "22.11";
                imports = [
                  ./home
                ];
              };
            }
          ];
        };
      };
    };
}
