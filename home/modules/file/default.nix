{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./android.nix
    ./compression.nix
    ./clifm.nix
    ./filesearch.nix
    ./lf
    ./mpv.nix
    ./nnn.nix
    ./office.nix
    ./pdf.nix
    ./rename.nix
    ./xdgconf.nix
    ./broot.nix
  ];
  options = {
    file.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.file.enable {
    android.enable = true;
    compression.enable = true;
    clifm.enable = true;
    filesearch.enable = true;
    lf.enable = true;
    nnn.enable = true;
    office.enable = true;
    mpv.enable = true;
    pdf.enable = true;
    rename.enable = true;
    xdgconf.enable = true;
    brootFile.enable = true;
    home.packages = with pkgs; [xplr];

    home.file = {
      ".config/xplr/init.lua" = {
        source = ./xplr.lua;
      };
    };
  };
}
