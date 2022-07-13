{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    envFile.text = ''
      starship init nu | save ~/.cache/starship/init.nu
    '';
    configFile.text = ''
      let-env $config = {
           filesize_metric: false
           table_mode: rounded
           use_ls_colors: true
         }
           source ~/.cache/starship/init.nu
    '';
  };
}
