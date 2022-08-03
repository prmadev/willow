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
        golang.go
        mvllow.rose-pine
        eamodio.gitlens
        redhat.vscode-yaml
        esbenp.prettier-vscode

        christian-kohler.path-intellisense
        coenraads.bracket-pair-colorizer-2
        streetsidesoftware.code-spell-checker
        github.vscode-pull-request-github
        naumovs.color-highlight
        bradlc.vscode-tailwindcss
        oderwat.indent-rainbow
        file-icons.file-icons
        kamadorueda.alejandra
        timonwong.shellcheck
        jnoortheen.nix-ide
      ];
    };
  };
}
