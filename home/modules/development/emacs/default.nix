{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    emacs.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.emacs.enable {
    programs.emacs = {
      enable = true;
    };
    services.emacs = {
      enable = true;
      client.enable = true;
      socketActivation.enable = true;
    };
    programs.doom-emacs = {
      enable = false;
      # doomPrivateDir = ./doom.d;
      # emacsPackagesOverlay = self: super: {
      # magit-delta = super.magit-delta.overrideAttrs (esuper: {
      # buildInputs = esuper.buildInputs ++ [pkgs.git pkgs.ripgrep pkgs.fd];
      # });
      # };
    };
  };
}
