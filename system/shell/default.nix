{pkgs, ...}: {
  environment.pathsToLink = ["/share/zsh"];

  environment.systemPackages = with pkgs; [
    vim #just in case I need it at system level
    curl # obvious
    systeroid
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
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.git.enable = true;
  security.polkit.enable = true;
  programs.dconf.enable = true;
  programs.mtr.enable = true;
  environment.localBinInPath = true;
  environment.homeBinInPath = true;
}
