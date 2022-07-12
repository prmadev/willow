{pkgs, ...}: {
  # programs.broot.enable = true;

  programs.zoxide.enable = true;

  programs.lf = {
    enable = true;
    settings = {
      drawbox = false;
      dirfirst = true;
      icons = true;
      preview = true;
      ratios = "2:3:1";
      shell = "bash";
    };
    previewer.source = ./lfkittypreview;
    previewer.keybinding = "i";
    extraConfig = ''
      set cleaner ~/dofi/home/modules/file/lfkittycleaner
    '';
  };
  programs.pistol.enable = true;
  home.packages = with pkgs; [file];

  programs.zathura.enable = true;
  programs.zathura.options = {
    #TODO
    # default-bg = "#000000";
    # default-fg = "#FFFFFF";
  };
}
