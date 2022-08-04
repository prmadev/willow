{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    vscode.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      # package = pkgs.vscode-with-extensions;
      extensions = with pkgs.vscode-extensions; [
        bradlc.vscode-tailwindcss
        christian-kohler.path-intellisense
        eamodio.gitlens
        esbenp.prettier-vscode
        github.vscode-pull-request-github
        golang.go
        jnoortheen.nix-ide
        kamadorueda.alejandra
        mvllow.rose-pine
        naumovs.color-highlight
        oderwat.indent-rainbow
        redhat.vscode-yaml
        timonwong.shellcheck
        bbenoist.nix
      ];
    };
  };
}
