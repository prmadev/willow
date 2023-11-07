{
  config,
  pkgs,
  ...
}: {
  fonts.packages = with pkgs; [
    recursive
    vazir-fonts
    material-design-icons
    commit-mono
    maple-mono-NF
    maple-mono-otf
    cascadia-code

    martian-mono
    (nerdfonts.override {fonts = ["JetBrainsMono" "CascadiaCode" "DaddyTimeMono"];})
  ];
  fonts = {
    # enableDefaultFonts = true; # just to see if it helps with faulty characters.
    fontconfig = {
      defaultFonts = {
        serif = config.global-fonts.main-set;
        sansSerif = config.global-fonts.main-set;
        monospace = config.global-fonts.main-set;
      };
    };
  };
}
