{
  description = "my nix configuration";
  inputs = {
    lix = {
      url = "git+https://git@git.lix.systems/lix-project/lix?ref=refs/tags/2.90-beta.1";
      flake = false;
    };
    lix-module = {
      url = "git+https://git.lix.systems/lix-project/nixos-module";
      inputs.lix.follows = "lix";
      # Note that this assumes you have a flake-input called nixpkgs,
      # which is often the case. If you've named it something else,
      # you'll need to change the `nixpkgs` below.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stable.url = "github:nixos/nixpkgs/nixos-23.11";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs";
    nixpkgs.url = "git+file:/home/a/repos/nixpkgs?ref=nixos-unstable";
    # neovim-nightly-overlay = {
    #   url = "github:nix-community/neovim-nightly-overlay";
    #   inputs.nixpkgs.url = "github:nixos/nixpkgs?rev=fad51abd42ca17a60fc1d4cb9382e2d79ae31836";
    # };
    nix-std.url = "github:chessai/nix-std";

    # centerpiece.url = "git+file:/home/a/repos/centerpiece";
    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    # nix-alien.url = "github:thiagokokada/nix-alien";
    # nix-ld.url = "github:Mic92/nix-ld/main";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # garden = {
    #   url = "github:davvid/garden";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    nur = {
      url = "github:nix-community/NUR";
    };
    himalaya = {
      url = "github:soywod/himalaya";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ragenix = {
    #   url = "github:yaxitech/ragenix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # zig.url = "github:mitchellh/zig-overlay";
    # zls.url = "github:zigtools/zls";
    leafslug.url = "git+https://git.sr.ht/~prma/leafslug";

    # nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    # nixneovim.url = "github:nixneovim/nixneovim";
    # emacs-overlay.url = "github:nix-community/emacs-overlay";

    # nix-doom-emacs.url = "github:prmadev/nix-doom-emacs";
    # ghS = {
    #   url = "github:gennaro-tedesco/gh-s";
    #   flake = false;
    # };

    # zellij = {
    #   url = "github:zellij-org/zellij";
    #   inputs. nixpkgs.follows = "nixpkgs";
    # };

    helix = {
      url = "github:helix-editor/helix";
      # inputs.nixpkgs.follows = "nixpkgs";
      # helix.inputs.nixpkgs.follows = "nixpkgs";
      # in
    };

    niri.url = "github:sodiboo/niri-flake";

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixago = {
    #   url = "github:nix-community/nixago";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
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

    catppuccin-zsh = {
      url = "github:catppuccin/zsh-syntax-highlighting";
      flake = false;
    };

    zsh-tab-title = {
      url = "github:trystan2k/zsh-tab-title";
      flake = false;
    };
    zsh-nix-shell = {
      url = "github:chisui/zsh-nix-shell";
      flake = false;
    };
    zsh-nix-completion = {
      url = "github:nix-community/nix-zsh-completions";
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
    catppuccin-fish = {
      url = "github:catppuccin/fish";
      flake = false;
    };
    rosepine-fish = {
      url = "github:rose-pine/fish";
      flake = false;
    };
    bat-catppuccin = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    snippets-ls = {
      url = "git+https://git.sr.ht/~prma/snippets-ls";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    lix-module,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    inherit (nixpkgs) lib;
  in
    with inputs; {
      nixosConfigurations.
        nixer = lib.nixosSystem {
        inherit system;
        modules = [
          lix-module.nixosModules.default
          {
            nixpkgs.overlays = [
              # inputs.nixneovim.overlays.default
              inputs.nur.overlay
              # (final: prev: {zigpkg = inputs.zig.packages.${prev.system}.master;})
              # inputs.emacs-overlay.overlays.default
              # inputs.neovim-nightly-overlay.overlay
              (final: prev: {external.snippets-ls = snippets-ls.packages.${prev.system}.snippets-ls;})
            ];
          }
          nur.nixosModules.nur
          # importing style defnitions
          (import ./style)

          niri.nixosModules.niri
          {
            specialisation.niri.configuration = {
              programs.niri.enable = true;

              #   systemd.user.services.niri-flake-polkit.enable = false;
            };
          }

          # ragenix module to provide encryption and secret keeping inside the flake
          # ragenix.nixosModules.age
          # {
          #   age.identityPaths = ["/home/a/secrets/prma_id_ed25519"];
          #   age.secrets.bwid.file = ./secrets/bwid.age;
          #   age.secrets.bwsec.file = ./secrets/bwsec.age;
          # }

          # importing system configurations
          ./system

          # importing nixvim modules
          # inputs.nixvim.nixosModules.nixvim

          #importing home-manager module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true; # uses the packages that comes with nix not home-manager.
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit system;
            };
            home-manager.users.a = {
              home.stateVersion = "22.11";
              imports = [
                # niri.homeModules.niri
                ./home
                # nixvim.homeManagerModules.nixvim

                # inputs.centerpiece.hmModules.${system}.default
                nix-index-database.hmModules.nix-index

                {programs.nix-index-database.comma.enable = true;}
                # inputs.nixvim.nixosModules.default
              ];
            };
          }
        ];
      };
    };
}
