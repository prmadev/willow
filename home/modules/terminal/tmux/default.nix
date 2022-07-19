{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;
    newSession = true;
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "z";
    tmuxp.enable = true;
	sensibleOnTop = true;
	extraConfig = ''

	'';
  };
}
