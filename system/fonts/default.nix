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
        serif = ["DankMono Nerd Font" "Dank Mono" "Gintronic" "recursive" "JetBrainsMono Nerd Font" "CascadiaCode Nerd Font" "vazir"];
        sansSerif = ["DankMono Nerd Font" "Dank Mono" "Gintronic" "recursive" "JetBrainsMono Nerd Font" "CascadiaCode Nerd Font" "vazir"];
        monospace = ["DankMono Nerd Font" "Dank Mono" "Gintronic" "recursive" "JetBrainsMono Nerd Font" "CascadiaCode Nerd Font" "DaddyTimeMono Nerd Font" "vazir"];
      };
    };
  };
}
