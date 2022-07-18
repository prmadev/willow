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
    enableDefaultFonts = true; # just to see if it helps with faulty characters.
    fontconfig = {
      defaultFonts = {
        serif = ["DankMono Nerd Font Mono" "Gintronic" "recursive" "vazir"];
        sansSerif = ["DankMono Nerd Font Mono" "Gintronic" "recursive" "vazir"];
        monospace = ["DankMono Nerd Font Mono" "Gintronic" "recursive" "vazir"];
      };
    };
  };
}
