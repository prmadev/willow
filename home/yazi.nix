{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.yazi.enable = mkEnableOption "yazi";

  config = mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
      keymap = {
        manager.keymap = [
          {
            exec = "shell \"$SHELL\" --block --confirm";
            on = ["<C-c>"];
          }
        ];
      };
      settings = {};
    };
    home.packages = with pkgs; [
      ffmpegthumbnailer # for video thumbnails
      unar # for archive preview
      poppler # for PDF
    ];
  };
}
