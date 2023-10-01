{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.emacs.enable = mkEnableOption "emacs settings";

  config = mkIf config.emacs.enable {
    home.packages = with pkgs; [python3];
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
      package = pkgs.emacs29-pgtk.override {withPgtk = pkgs.stdenv.isLinux;};

      extraPackages = epkgs:
        with epkgs; [
          magit
          # forge
          eldoc
          evil-org
          treesit-grammars.with-all-grammars
          # lsp-tailwindcss
          scss-mode
          exec-path-from-shell
          # company
          ligature
          org-superstar
          ox-hugo
          sql-indent
          yaml-mode
          # lsp-mode
          # lsp-ui
          git-timemachine
          auto-compile
          evil-nerd-commenter
          elisp-autofmt
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
          go-eldoc
          indent-guide
          jq-mode
          fish-mode
          fish-completion
          moody
          consult-eglot
          gcmh
          rainbow-mode
          evil-mc

          posframe
          which-key-posframe

          git-gutter
          evil-commentary
          web-mode
          # consult-lsp
          # consult-projectile
          # consult-yasnippet
          # consult-flycheck
          # consult-dir
          json-mode
          key-chord
          markdown-mode
          flycheck
          flycheck-golangci-lint
          flycheck-yamllint
          flycheck-rust
          flycheck-projectile
          flycheck-posframe

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
          # treemacs
          # lsp-treemacs
          # treemacs-evil
          # treemacs-projectile
          # treemacs-magit
          # treemacs-all-the-icons
          # treemacs-icons-dired

          corfu
          # corfu-terminal
          corfu-prescient
          # corfu-candidate-overlay

          orderless

          vertico
          # vertico-prescient

          embark
          embark-consult

          consult
          consult-flycheck
          # consult-lsp
          consult-dir
          consult-yasnippet
          consult-projectile
          # consult
          format-all

          eglot
          eglot-tempel
          flycheck-eglot

          # marginalia

          cape
          tempel
          tempel-collection

          dirvish
          use-package # configured
          rustic
          org
          deadgrep
          all-the-icons
          all-the-icons-dired
          counsel-projectile
          evil-surround
          direnv

          vertico
          # vertico-posframe
          marginalia
          # consult
          # embark
          # embark-consult
          # orderless

          # diminish
          delight
          ivy
          nerd-icons-ivy-rich
          lsp-ivy
          ivy-yasnippet
          ivy-xref
          ivy-rich
          ivy-prescient
          ivy-posframe
          ivy-dired-history
          all-the-icons-ivy-rich
          all-the-icons-ivy

          swiper

          counsel
          counsel-projectile
          counsel-org-capture-string
          counsel-jq
          counsel-fd
          counsel-css
          counsel-ag-popup

          company
          company-box
          company-shell
          company-restclient
          company-prescient
          company-posframe
          company-org-block
          company-nixos-options
          company-go
          company-fuzzy

          restclient

          emacs

          prescient
          projectile
          org-contrib
          ob-rust
          ob-restclient
          ob-nix
          ob-mongo
          ob-http
          ob-go
        ];
    };
  };
}
