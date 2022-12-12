{
  description = "my nix configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-std.url = "github:chessai/nix-std";

    nix-alien.url = "github:thiagokokada/nix-alien";
    # nix-ld.url = "github:Mic92/nix-ld/main";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixme = {
      url = "github:amirography/nixme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ragenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:pta2002/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland-contrib = {
    #   url = "github:hyprwm/contrib";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    zellij = {
      url = "github:zellij-org/zellij";
      inputs. nixpkgs.follows = "nixpkgs";
    };

    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixago = {
      url = "github:nix-community/nixago";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # naersk = {
    #   url = "github:nmattia/naersk";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nnn-plugins = {
      url = "github:jarun/nnn";
      flake = false;
    };
    ## zsh plugins
    zsh-windows-title = {
      url = "github:mdarocha/zsh-windows-title";
      flake = false;
    };
    zsh-terminal-title = {
      url = "github:AnimiVulpis/zsh-terminal-title";
      flake = false;
    };

    zsh-skim = {
      url = "github:casonadams/skim.zsh";
      flake = false;
    };

    zsh-tab-title = {
      url = "github:trystan2k/zsh-tab-title";
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
    ## for go
    gomod2nix = {
      url = "github:tweag/gomod2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    inherit (nixpkgs) lib;
  in
    with inputs; {
      nixosConfigurations = {
        nixer = lib.nixosSystem {
          inherit system;
          modules = [
            {
              nixpkgs.overlays = [
                nur.overlay
              ];
            }
            nur.nixosModules.nur
            # importing style defnitions
            (import ./style)

            # ragenix module to provide encryption and secret keeping inside the flake
            ragenix.nixosModules.age
            {
              age.identityPaths = ["/home/a/keys/id_ed25519"];
              age.secrets.bwid = {
                file = ./secrets/bwid.age;
              };
              age.secrets.bwsec = {
                file = ./secrets/bwsec.age;
              };
            }

            # importing system configurations
            ./system

            # importing nixvim modules
            # inputs.nixvim.nixosModules.nixvim

            # importing hyprland module
            inputs.hyprland.nixosModules.default

            #importing home-manager module
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
                  inputs.nix-doom-emacs.hmModule
                  # inputs.nix-ld.nixosModules.nix-ld
                  inputs.nixvim.homeManagerModules.nixvim
                  inputs.hyprland.homeManagerModules.default
                ];
              };
            }
          ];
        };
      };
    };
}
