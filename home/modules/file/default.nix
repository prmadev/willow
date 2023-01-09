{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  imports = [
    ./android.nix
    ./compression.nix
    ./filesearch.nix
    ./ranger.nix
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
    filesearch.enable = true;
    nnn.enable = true;
    office.enable = true;
    ranger.enable = true;
    mpv.enable = true;
    pdf.enable = true;
    rename.enable = true;
    xdgconf.enable = true;
    brootFile.enable = true;
    home.packages = with pkgs; [
      jql
      trashy
    ];
  };
}
