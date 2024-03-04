{
  lib,
  config,
  ...
}:
with lib; {
  options.pdf.enable = mkEnableOption "pdf settings";

  config = mkIf config.pdf.enable {
    programs.zathura.enable = true;
    programs.zathura.options = {
      default-bg = config.colors.moon.base.hex;
      default-fg = config.colors.moon.text.hex;
      recolor-darkcolor = config.colors.moon.text.hex;
      recolor-lightcolor = config.colors.moon.base.hex;
      recolor-keephue = true;
      recolor = true;
    };
  };
}
