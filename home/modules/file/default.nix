{
  pkgs,
  inputs,
  config,
  ...
}: let
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
      src = inputs.nnn-plugins + "/plugins";
    };
  };

  programs.lf = {
    #TODO needs improvement
    enable = true;
    keybindings = {
      "<enter>" = "shell";
      # o = "&mimeopen $f";
      # O = "&mimeopen --ask $f";
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
  home.sessionVariables = {
    LF_ICONS = import ./icons.nix;
  };
  programs.pistol.enable = true;
  home.packages = with pkgs; [
    p7zip
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
    zip
    unzip
    rar
    pigz # file compression
    sd
    viu
    fd
    mediainfo
    ripgrep-all
    ripgrep
    gimp
  ];

  programs.zathura.enable = true;
  programs.zathura.options = {
    default-bg = color.rosepine.base;
    default-fg = color.rosepine.text;
  };
}
