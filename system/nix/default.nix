{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11";
  nix = {
    # for the initial setup of flakes
    package = pkgs.nixVersions.stable;
    extraOptions = "experimental-features = nix-command flakes";
    optimise.automatic = true;
    settings.auto-optimise-store = true;
    # settings.substituters = [
    #   "https://nix-community.cachix.org"
    #   "https://cache.nixos.org"
    # ];
    # # settings.trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];

    settings = {
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };

  environment.defaultPackages = [
    pkgs.rsync
    pkgs.strace
    pkgs.neovim
  ];
}
