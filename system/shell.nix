{pkgs, ...}: {
  environment.pathsToLink = ["/share/zsh"];

  environment.systemPackages = with pkgs; [
    vim #just in case I need it at system level
    curl # obvious
    systeroid
    parallel
  ];

  console.colors = [
    "403c58"
    "ea6f91"
    "9bced7"
    "f1ca93"
    "34738e"
    "c3a5e6"
    "eabbb9"
    "faebd7"
    "6f6e85"
    "ea6f91"
    "9bced7"
    "f1ca93"
    "34738e"
    "c3a5e6"
    "eabbb9"
    "ffffff"
  ];
  services.atd.enable = true;
  services.dbus.enable = true;
  # services.dbus.packages = [pkgs.gcr];

  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";

    NIXOS_OZONE_WL = "1";
  };

  programs.git.enable = true;
  security.polkit.enable = true;
  programs.dconf.enable = true;
  programs.mtr.enable = true;
  environment.localBinInPath = true;
  environment.homeBinInPath = true;

  programs.bash = {
    blesh.enable = false;
    undistractMe.enable = true;

    enableCompletion = true;
  };
  # documentation = {
  #   man = {
  #     # generateCaches = true;
  #   };
  #   # dev.enable = true;
  #   # nixos = {
  #   #   includeAllModules = true;
  #   # };
  # };
}
