{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11";
  nix = {
    # for the initial setup of flakes
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    optimise.automatic = true;
    settings.auto-optimise-store = true;
    settings.substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
    ];
  };

  environment.defaultPackages = with pkgs; [
    rsync
    strace
    neovim
  ];
}
