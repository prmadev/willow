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
  home.packages = with pkgs; [
    file # for lf preview
    lsof
    libreoffice
    imagemagick
    imv
    ffmpeg_5-full
    ffmpegthumbnailer
    duf
    du-dust
    ncdu_2
    dutree
    android-file-transfer
    atool # for file extraction
    pigz # file compression
    sd
    viu
    fd
    mediainfo
    ripgrep-all
  ];

  programs.zathura.enable = true;
  programs.zathura.options = {
    #TODO
    # default-bg = "#000000";
    # default-fg = "#FFFFFF";
  };
}
