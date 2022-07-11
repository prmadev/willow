{
  pkgs,
  home,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.recursive;
      name = "Recursive Sans Linear";
      size = 10;
    };
  };
}
