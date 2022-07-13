{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
    };
    vteIntegration = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  environment.pathsToLink = ["/share/zsh"];

  environment.systemPackages = with pkgs; [
    neovim #just in case I need it at system level
    curl # obvious
  ];

  services.atd.enable = true;

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.git.enable = true;

  security.polkit.enable = true;
  programs.mtr.enable = true;
}
