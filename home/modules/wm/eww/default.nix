{
  pkgs,
  config,
  libs,
  ...
}:
with libs; {
  options = {
    eww.enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
  config = mkIf config.eww.enable {
    home.packages = with pkgs; [
      eww-wayland
    ];
  };
}
