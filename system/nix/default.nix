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
  };
  environment.defaultPackages = with pkgs; [
    rsync
    strace
    neovim
  ];
}
