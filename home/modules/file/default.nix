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
    ./filesearch.nix
    ./lf
    ./nnn.nix
    ./office.nix
    ./pdf.nix
    ./rename.nix
    ./xdgconf.nix
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
    filesearch.enable = true;
    lf.enable = true;
    nnn.enable = true;
    office.enable = true;
    pdf.enable = true;
    rename.enable = true;
    xdgconf.enable = true;
  };
}
