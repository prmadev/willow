{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    nixdev.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.nixdev.enable {
    home.packages = with pkgs; [
      alejandra
      niv
      nix-prefetch
      nix-prefetch-git
    ];

    programs.nix-index.enable = true;
  };
}
