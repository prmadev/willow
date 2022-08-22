{
  config,
  pkgs,
  ...
}: {
  fonts.fonts = with pkgs; [
    recursive
    vazir-fonts

    (nerdfonts.override {fonts = ["JetBrainsMono" "CascadiaCode" "DaddyTimeMono"];})
  ];
  fonts = {
    # enableDefaultFonts = true; # just to see if it helps with faulty characters.
    fontconfig = {
      localConf = ''
        <alias>
            <family>monospace</family>
            <prefer>
                <family>${config.global-fonts.main-family}</family>
            </prefer>
        </alias>
      '';
      defaultFonts = {
        serif = config.global-fonts.main-set;
        sansSerif = config.global-fonts.main-set;
        monospace = config.global-fonts.main-set;
      };
    };
  };
}
