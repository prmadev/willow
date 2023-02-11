{
  lib,
  config,
  ...
}:
with lib; {
  options = {
    pdf.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.pdf.enable {
    programs.zathura.enable = true;
    programs.zathura.options = {
      default-bg = config.colors.macchiato.base.hex;
      default-fg = config.colors.macchiato.text.hex;
    };
  };
}
