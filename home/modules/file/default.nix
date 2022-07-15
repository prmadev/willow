{pkgs, inputs, ...}: let
  color = import ../colorscheme;
in {
  # programs.broot.enable = true;

  programs.zoxide.enable = true;
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override {withNerdIcons = true;};
    bookmarks = {
      d = "~/Downloads";
      p = "~/Documents/projects";
      g = "~/Videos/golearn/";
    };
    extraPackages = with pkgs; [
      ffmpegthumbnailer
      mediainfo
    ];
    plugins = {
      src = inputs.nnn-plugins;
    };
  };

  programs.lf = {
    #TODO needs improvement
    enable = true;
    keybindings = {
      "<enter>" = "shell";
      o = "&mimeopen $f";
      O = "&mimeopen --ask $f";
    };
    settings = {
      drawbox = false;
      dirfirst = true;
      icons = true;
      preview = true;
      ratios = "2:3:1";
      shell = "bash";
      shellopts = "-eu";
      ifs = "\n";
      scrolloff = 10;
    };
    previewer.source = ./lfkittypreview;
    previewer.keybinding = "i";
    extraConfig = ''
      set cleaner ~/dofi/home/modules/file/lfkittycleaner
    '';
  };
  programs.pistol.enable = true;
  home.packages = with pkgs; [
    ranger # for its rifle
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
    ripgrep
  ];

  programs.zathura.enable = true;
  programs.zathura.options = {
    default-bg = color.rosepine.base;
    default-fg = color.rosepine.text;
  };
}
