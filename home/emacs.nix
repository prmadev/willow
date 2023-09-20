{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.emacs.enable = mkEnableOption "emacs settings";

  config = mkIf config.emacs.enable {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs29-pgtk;
      extraPackages = epkgs:
        with epkgs; [
          magit
          catppuccin-theme
          evil
          counsel
          swiper
          ivy
          doom-modeline
          doom-themes
          nerd-icons
          nerd-icons-ivy-rich
          nerd-icons-ibuffer
          nerd-icons-dired
          nerd-icons-completion
        ];

      extraConfig = let
        gsk = keys: command: "(global-set-key (kbd \"" + keys + "\") '" + command + " )";
        disableStartup = "(setq inhibit-startup-message t)";
        disableVisibleScrollbar = "(scroll-bar-mode -1)";
        disableTooltipmode = "(tooltip-mode -1)";
        disableToolbar = "(tool-bar-mode -1)";
        disableMenubar = "(menu-bar-mode -1)";
        setFringMode = "(set-fringe-mode 10)";
        setVisualbell = "(setq visible-bell t)";
        setFont = "(set-face-attribute `default nil :font \"monospace\" :height 150)";
        setTheme = "(load-theme 'catppuccin :no-confirm) (setq catppuccin-flavor 'macchiato) (catppuccin-reload)";
        disableFrame = "(setq default-frame-alist '((undecorated . t)))";
        escapeIsJustEscape = "(global-set-key (kbd \"<escape>\") 'keyboard-escape-quit)";
        enableEvil = "(require 'evil) (evil-mode 1)";
        enableIvyMode = "(ivy-mode)(setq ivy-use-virtual-buffers t)(setq enable-recursive-minibuffers t)(setq search-default-mode #'char-fold-to-regexp)";
        counselMBHistoryBind = "(define-key minibuffer-local-map (kbd \"C-r\") 'counsel-minibuffer-history)";
        doomModeline = "(require 'doom-modeline)(doom-modeline-mode 1)";
      in
        builtins.concatStringsSep "\n" [
          disableStartup
          setFont
          escapeIsJustEscape
          disableFrame
          setVisualbell
          disableMenubar
          disableVisibleScrollbar
          disableToolbar
          disableTooltipmode
          setFringMode
          setTheme
          enableEvil
          enableIvyMode
          (gsk "\\C-s" "swiper")
          (gsk "C-c C-r" "ivy-resume")
          (gsk "M-x" "counsel-M-x")
          (gsk "C-x C-f" "counsel-find-file")
          (gsk "<f1> f" "counsel-describe-function")
          (gsk "<f1> v" "counsel-describe-variable")
          (gsk "<f1> o" "counsel-describe-symbol")
          (gsk "<f1> l" "counsel-find-library")
          (gsk "<f2> i" "counsel-info-lookup-symbol")
          (gsk "<f2> u" "counsel-unicode-char")
          (gsk "C-c g" "counsel-git")
          (gsk "C-c j" "counsel-git-grep")
          (gsk "C-c k" "counsel-ag")
          (gsk "C-x l" "counsel-locate")
          (gsk "C-S-o" "counsel-rhythmbox")
          counselMBHistoryBind
          doomModeline
        ];
    };
  };
}
