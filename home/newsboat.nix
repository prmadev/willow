{
  lib,
  config,
  ...
}:
with lib; {
  options.newsboat.enable = mkEnableOption "newsboat settings";

  config = mkIf config.newsboat.enable {
    programs.newsboat = {
      enable = true;
      autoReload = true;
      # browser  ="qutebrowser" ;
      urls = [
        {
          title = "Rob Pike";
          tags = ["blog"];
          url = "https://commandcenter.blogspot.com/feeds/posts/default";
        }
        {
          title = "Dave Cheney";
          tags = ["blog"];
          url = "https://dave.cheney.net/feed/atom";
        }
      ];
    };
  };
}
