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
        serif = ["Dank Mono" "Gintronic" "recursive" "JetBrainsMono Nerd Font" "CascadiaCode Nerd Font" "vazir"];
        sansSerif = ["Dank Mono" "Gintronic" "recursive" "JetBrainsMono Nerd Font" "CascadiaCode Nerd Font" "vazir"];
        monospace = ["Dank Mono" "Gintronic" "recursive" "JetBrainsMono Nerd Font" "CascadiaCode Nerd Font" "DaddyTimeMono Nerd Font" "vazir"];
      };
    };
  };
}
