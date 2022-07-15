{pkgs, ...}: let
  color = import ../colorscheme;
in {
  # programs.broot.enable = true;

  programs.zoxide.enable = true;

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
    commands = {
      zip = ''
        set -f \
        mkdir $1 \
        cp -r $fx $1 \
        zip -r $1.zip $1 \
        rm -rf $1
      '';
      tar = ''
        set -f
        mkdir $1
        cp -r $fx $1
        tar czf $1.tar.gz $1
        rm -rf $1
      '';
      extract = ''
        set -f
        case $f in
            *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
            *.tar.gz|*.tgz) tar xzvf $f;;
            *.tar.xz|*.txz) tar xJvf $f;;
            *.zip) unzip $f;;
            *.rar) unrar x $f;;
            *.7z) 7z x $f;;
        esac
      '';
      open = ''
        test -L $f && f=$(readlink -f $f)
        case $(file --mime-type $f -b) in
            text/*) $EDITOR $fx;;
            *) for f in $fx; do setsid $OPENER $f > /dev/null 2> /dev/null & done;;
        esac
      '';
      rifle = ''
        set -f
        rifle -l $f
        read -p "Select runner: " runner
        rifle -p $runner $f
      '';
    };
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
