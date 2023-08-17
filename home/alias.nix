{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.alias.enable = mkEnableOption "alias settings";

  config = mkIf config.alias.enable {
    # programs.exa.enableAliases = mkIf config.filesearch.enable true;

    home.shellAliases = {
      tree = mkIf config.filesearch.enable "exa --tree --icons";
      rg = mkIf config.filesearch.enable "rg --sort path";
      jctl = "journalctl -p 3 -xb";
      df = "df -h";
      cp = "cp -r";
      go = mkIf config.go.enable "richgo";
      # sudo = "sudo -E";
      fzf = mkIf config.fzf.enable "fzf --preview='pistol {}'";
      j = "jobs";
      f = "fg";
      # h = "hx";
      b = "bg";
      n = "nvim";
      pc = "proxychains4 -q";

      # git related stuff
      gl = "git lg";
      gc = "git commit -S -m ";
      ga = "git add --patch";
      gd = "git diff";
      gsi = "git si";

      #tmux
      # t = "${pkgs.tmux}/bin/tmux new -A -s $(${pkgs.gum}/bin/gum input --placeholder=name)";
    };
  };
}
