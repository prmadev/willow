{
  lib,
  config,
  # inputs,
  ...
}:
with lib; {
  options = {
    wezterm.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.wezterm.enable {
    programs.wezterm = {
      enable = true;
      # package = inputs.stable.legacyPackages."x86_64-linux".wezterm;
      extraConfig = "${builtins.readFile ./wezterm.lua}";
    };
  };
}
