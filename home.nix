{ pkgs, ... }: {
  home.packages = with pkgs; [
    htop
    gcc
    rustup
    alejandra
    zig
  ];
  home.stateVersion = "22.11";

  programs.broot.enable = true;
  programs.broot.enableZshIntegration = true;

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  programs.just.enable = true;
  programs.just.enableZshIntegration = true;

  programs.nix-index.enable = true;
  programs.nix-index.enableZshIntegration = true;

  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  services.gpg-agent.enable = true;
  services.gpg-agent.enableZshIntegration = true;

  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.enableVteIntegration = true;
  programs.zsh.autocd = true;

  programs.zsh.oh-my-zsh.enable = true;

  programs.taskwarrior.enable = true;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "river-session.target";
    settings = {
      mainBar = {
        gtk-layer-shell = true;
        position = "top";
        height = 0;
        modules-left = [
          "river/mode"
          "river/tags"
        ];
        modules-center = [
          "clock"
          "custom/joljol"
        ];

        modules-right = [
          "tray"
          "network"
          "pulseaudio"
          "battery"
        ];

        "river/tags" = {
          num-tags = 9;
        };
        "river/mode" = {
          format = "Mode: {}";
        };
        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d}";
        };

        "battery" = {
          interval = 60;
          states = {
            hundred = 100;
            ninty = 90;
            eighty = 80;
            seventy = 70;
            sixty = 60;
            fifty = 50;
            fourty = 40;
            thirty = 30;
            twenty = 20;
            ten = 10;
            five = 5;
            three = 3;
          };
          format = "{ capacity }";
          format-charging = "{capacity}";
          format-discharging = "{capacity}";
          format-plugged = "{capacity}";
          format-full = "{capacity}";
        };

      };
    };

  };
}
