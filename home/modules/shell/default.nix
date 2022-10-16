{
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./alias.nix
    ./doc.nix
    ./fzf.nix
    ./pager.nix
    ./prompt.nix
    ./snippet.nix
    ./bash
    ./fish
    ./nu
    ./zsh
    ./skim.nix
  ];
  options = {
    shell.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.shell.enable {
    alias.enable = true;
    bash.enable = true;
    doc.enable = true;
    fish.enable = true;
    fzf.enable = true;
    nu.enable = true;
    pager.enable = true;
    prompt.enable = true;
    snippet.enable = true;
    zsh.enable = true;
  };
}
