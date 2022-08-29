{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    alias.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.alias.enable {
    programs.exa.enableAliases = mkIf config.filesearch.enable true;
    home.shellAliases = {
      tree = mkIf config.filesearch.enable "exa --tree --icons";
      rg = mkIf config.filesearch.enable "rg --sort path";
      jctl = "journalctl -p 3 -xb";
      df = "df -h";
      go = mkIf config.go.enable "richgo";
      sudo = "sudo -E";
      fzf = mkIf config.fzf.enable "fzf --preview='pistol {}'";
      j = "jobs";
      f = "fg";
      h = "hx";
      b = "bg";
    };
  };
}
