{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  options.skim.enable = mkOption {
    type = types.bool;
    default = false;
  };
  config = mkIf config.skim.enable {
    programs.skim.enable = true;
    home.packages = with pkgs; [fd fzf];
  };
}
