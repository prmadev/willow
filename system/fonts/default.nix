{
  config,
  pkgs,
  ...
}: {
  fonts.fonts = with pkgs; [
    recursive
    vazir-fonts

    (nerdfonts.override {fonts = ["JetBrainsMono" "Monoid"];})
  ];
  fonts = {
    fontconfig = {
      defaultFonts = {
        serif = ["recursive" "JetBrainsMono Nerd Font" "vazir"];
        sansSerif = ["recursive" "JetBrainsMono Nerd Font" "vazir"];
        monospace = ["recursive" "JetBrainsMono Nerd Font" "vazir"];
      };
    };
  };
}
