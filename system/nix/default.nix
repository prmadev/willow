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
    settings.substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
    ];
    settings.trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
  };

  environment.defaultPackages = [
    pkgs.rsync
    pkgs.strace
    pkgs.neovim
  ];
}
