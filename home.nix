{pkgs,...}:
{
    home.packages = with pkgs; [
      htop
	  gcc
	  cargo
	  rustup
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
};

}
