{
  config,
  pkgs,
  ...
}: {
  # users.defaultUserShell = pkgs.zsh;
  users.users.a = {
    createHome = true;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video" # for wayland light support
    ];
  };
}
