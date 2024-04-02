{
  lib,
  config,
  ...
}:
with lib; {
  options.centerpiece.enable = mkEnableOption "centerpiece settings";
  config = mkIf config.centerpiece.enable {
    programs.centerpiece = {
      enable = true;
      config = {
        plugin = {
          applications.enable = true;
          brave_bookmarks.enable = false;
          brave_history.enable = false;
          brave_progressive_web_apps.enable = false;
          clock.enable = true;
          git_repositories = {
            enable = true;
            commands = [
              ["foot" "-D" "$GIT_DIRECTORY" "fish" "-C" "hx" "."]
              ["foot" "-D" "$GIT_DIRECTORY"]
            ];
          };
          wifi.enable = true;

          resource_monitor_battery.enable = false;
          resource_monitor_cpu.enable = false;
          resource_monitor_disks.enable = false;
          resource_monitor_memory.enable = false;
          system.enable = true;
        };
      };
    };

    # enables a systemd service to index git-repositories

    # services.index-git-repositories = {
    #   enable = true;
    #   interval = "5min";
    # };
  };
}
