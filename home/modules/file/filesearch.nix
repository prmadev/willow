{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    filesearch.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.filesearch.enable {
    home.packages = with pkgs; [
      fd
      ripgrep-all
      ripgrep
      sd
    ];
    programs.exa.enable = true;
    programs.zoxide.enable = true;
  };
}
