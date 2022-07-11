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
  home.packages = with pkgs; [pistol file];
}
