{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.emacs.enable = mkEnableOption "emacs settings";

  config = mkIf config.emacs.enable {
    # programs.doom-emacs = {
      #   enable = true;
      # doomPrivateDir = ./doom.d;
      # emacsPackage = pkgs.emacs29-pgtk;

      # extraPackages = with pkgs.emacsPackages; [
        #   vterm
        #   org
        #   ob-async
        # ];
        # };

        programs.emacs = {
          enable = true;
          package = pkgs.emacs29-pgtk;

          extraPackages = epkgs:
          with epkgs; [
            magit
            # forge
            eldoc
            treesit-grammars.with-all-grammars
            lsp-tailwindcss
            scss-mode
            # company
            ligature
            sql-indent
            yaml-mode
            lsp-mode
            lsp-ui
            git-timemachine
            auto-compile
            evil-nerd-commenter
            corfu
            catppuccin-theme # configured
            evil # configured
            evil-collection
            hydra
            general
            doom-modeline # configured
            doom-themes # configured
            rainbow-delimiters # configured
            which-key # configured
            go-mode # configured
            indent-guide
            jq-mode
            fish-mode
            # moody
            # consult-eglot
            gcmh
            rainbow-mode
            evil-mc

            git-gutter
            evil-commentary
            web-mode
            consult-lsp
            consult-projectile
            consult-yasnippet
            consult-dir
            json-mode
            key-chord
            markdown-mode
            flycheck
            multiple-cursors
            nix-mode
            nixos-options
            # org-bullets
            protobuf-mode
            smartparens
            vterm
            yaml-mode
            yasnippet
            yasnippet-snippets
            treemacs
            lsp-treemacs
            treemacs-evil
            treemacs-projectile
            treemacs-magit
            treemacs-all-the-icons

            treemacs-icons-dired
            use-package # configured
            rustic
            org
            deadgrep
            all-the-icons
            all-the-icons-dired
            counsel-projectile
            evil-surround
            vertico
            direnv
            vertico-posframe
            marginalia
            consult
            embark
            embark-consult
            orderless
            emacs

            prescient
            corfu-prescient
            vertico-prescient
            projectile
          ];

        };
  };
}
