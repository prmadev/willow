{
  description = "my nix configuration ";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nnn-plugins = {
      url = "github:jarun/nnn";
      flake = false;
    };
    ## zsh plugins
    ansible-zsh = {
      url = "github:sparsick/ansible-zsh";
      flake = false;
    };
    cd-ls = {
      url = "github:zshzoo/cd-ls";
      flake = false;
    };
    fzf-tab = {
      url = "github:Aloxaf/fzf-tab";
      flake = false;
    };
    colorize = {
      url = "github:zpm-zsh/colorize";
      flake = false;
    };
    fzf-finder = {
      url = "github:leophys/zsh-plugin-fzf-finder";
      flake = false;
    };
    ## fish plugins
    fzf-fish = {
      url = "github:PatrickF1/fzf.fish";
      flake = false;
    };
    done-fish = {
      url = "github:franciscolourenco/done";
      flake = false;
    };
    sponge-fish = {
      url = "github:andreiborisov/sponge";
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
            nur.nixosModules.nur
            ./system
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true; # uses the packages that comes with nix not home-manager.
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs;
              }; #TODO figure out how to add NUR to home-manager
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
