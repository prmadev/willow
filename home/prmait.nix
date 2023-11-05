{
  lib,
  config,
  inputs,
  pkgs,
  system,
  ...
}:
with lib; {
  options.prmait.enable = mkEnableOption "prmait settings";
  config = mkIf config.prmait.enable {
    home.packages = [inputs.prmait.packages.${system}.default];
    home.file = let
      content = pkgs.writeTextFile {
        name = "snippets-rust.json";
        text = builtins.toJSON {
          "journal" = {
            path = "${config.repos.notes.path}/journal/";
          };
          "task" = {
            path = "${config.repos.notes.path}/task/";
          };
          destination = "";
        };
      };
    in {
      ".config/prmait/config.json" = {
        source = content;
      };
    };
    programs.fish.interactiveShellInit = ''
      ${inputs.prmait.packages.${system}.default}/bin/prmait completions fish | source
    '';
    programs.zsh.initExtra = ''
      if [[ $options[zle] = on ]]; then
         eval "$(${inputs.prmait.packages.${system}.default}/bin/prmait completions zsh)"
      fi
    '';

    programs.nushell = {
      extraEnv = ''
        let atuin_cache = "${config.xdg.cacheHome}/prmait"
        if not ($atuin_cache | path exists) {
          mkdir $atuin_cache
        }
         ${inputs.prmait.packages.${system}.default}/bin/prmait completions zsh| save --force ${config.xdg.cacheHome}/prmait/init.nu
      '';
      extraConfig = ''
        source ${config.xdg.cacheHome}/prmait/init.nu
      '';
    };
  };
}
