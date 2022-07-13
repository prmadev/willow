{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    envFile.text = ''
      starship init nu | save ~/.cache/starship/init.nu
    '';
    configFile.text = ''
      source ~/.cache/starship/init.nu
    '';
  };
}
