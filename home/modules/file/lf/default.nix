{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    lf.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.lf.enable {
    programs.lf = {
      enable = true;
      keybindings = {
        "<enter>" = "shell";
        ad = "push :mkdir<space>";
        "<c-r>" = "reload";
        D = "delete";
        E = "extract";
        V = "push :!nvim<space>";
        "<c-f>" = "fzf_jump";
        "gs" = "fzf_search";
        Z = "push aj<space>";
        R = "bulkrename";
      };
      commands = {
        mkdir = builtins.readFile ./mkdir;
        extract = builtins.readFile ./extract;
        open = builtins.readFile ./open;
        aj = builtins.readFile ./aj;
        delete = builtins.readFile ./delete;
        fzf_jump = builtins.readFile ./fzf_jump;
        fzf_search = builtins.readFile ./fzf_search;
        paste = builtins.readFile ./paste;
        rifle = builtins.readFile ./rifle;
        tar = builtins.readFile ./tar;
        zip = builtins.readFile ./zip;
      };
      settings = {
        drawbox = false;
        dirfirst = true;
        icons = true;
        preview = true;
        ratios = "2:3:1";
        shell = "${pkgs.fish}/bin/fish";
        shellopts = "-i";
        ifs = "\n";
        scrolloff = 10;
      };
      previewer.source = ./lfkittypreview;
      previewer.keybinding = "i";
      extraConfig = ''
        set cleaner ~/dofi/home/modules/file/lf/lfkittycleaner
      '';
    };
    home.sessionVariables = {
      LF_ICONS = import ./icons.nix;
    };
    home.packages = with pkgs; [
      ranger # for its rifle
      file # for lf preview
    ];

    programs.pistol.enable = true;
  };
}
