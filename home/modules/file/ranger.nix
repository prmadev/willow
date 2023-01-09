{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    ranger.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.ranger.enable {
    home.packages = with pkgs; [
      ranger
    ];
    programs.pistol = {
      enable = true;
      associations = [
        {
          mime = "text/*";
          command = "wezterm start hx &pistol-filename%";
        }
        {
          mime = "text/x-go";
          command = "wezterm start hx &pistol-filename%";
        }
      ];
    };
  };
}
