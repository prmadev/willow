{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    envFile.text = ''
      starship init nu | save ~/.cache/starship/init.nu
          max_history_size: 15000
    '';
    configFile.text = ''
          source ~/.cache/starship/init.nu
    '';
  };
}
