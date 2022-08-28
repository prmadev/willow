{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    newsboat.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.newsboat.enable {
    programs.newsboat = {
      enable = true;
      autoReload = true;
      # browser  ="qutebrowser" ;
      urls = [
        {
          title = "go";
          tags = ["go"];
          url = "https://go.dev/blog/";
        }
      ];
    };
  };
}
