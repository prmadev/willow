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
          # all-the-icons-ivy
          # all-the-icons-ivy-rich
          # company
          # company-box
          # company-fuzzy
          # company-go
          # company-nixos-options
          # company-org-block
          # company-posframe
          # company-prescient
          # company-restclient
          # company-shell
          # consult
          # consult-lsp
          # corfu-candidate-overlay
          # counsel
          # counsel-ag-popup
          # counsel-css
          # counsel-fd
          # counsel-jq
          # counsel-org-capture-string
          # counsel-projectile
          # deadgrep
          # diminish
          # dirvish
          # forge
          # ivy
          # ivy-dired-history
          # ivy-posframe
          # ivy-prescient
          # ivy-rich
          # ivy-xref
          # ivy-yasnippet
          # lsp-ivy
          # lsp-mode
          # lsp-tailwindcss
          # lsp-treemacs
          # lsp-ui
          # nerd-icons-ivy-rich
          # orderless
          # org-bullets
          # swiper
          # treemacs
          # treemacs-all-the-icons
          # treemacs-evil
          # treemacs-icons-dired
          # treemacs-magit
          # treemacs-projectile
          # vertico-posframe
          # vertico-prescient
          all-the-icons
          all-the-icons-dired
          all-the-icons-completion
           auto-compile
          cape
          catppuccin-theme # configured
          consult
          consult-dir
          consult-eglot
          consult-flycheck
          consult-projectile
          consult-yasnippet
          corfu
          corfu-prescient
          corfu-terminal
          counsel-projectile
          delight
          direnv
          doom-modeline # configured
          doom-themes # configured
          eglot
          eglot-tempel
          eldoc
          eldoc-toml
          css-eldoc
          elisp-autofmt
          emacs
          embark
          embark-consult
          evil # configured
          evil-collection
          evil-commentary
          evil-mc
          evil-nerd-commenter
          evil-org
          evil-surround
          easy-hugo
          fish-completion
          fish-mode
          flycheck
          flycheck-eglot
          flycheck-golangci-lint
          flycheck-posframe
          flycheck-projectile
          flycheck-rust
          eldoc-box

          flycheck-yamllint
          format-all
          gcmh
          general
          git-gutter
          git-timemachine
          go-eldoc
          go-mode # configured
          hydra
          indent-guide
          jq-mode
          json-mode
          key-chord
          ligature
          magit
          marginalia
          markdown-mode
          # moody
          multiple-cursors
          nix-mode
          nixos-options
          ob-go
          ob-http
          ob-mongo
          ob-nix
          ob-restclient
          ob-rust
          orderless
          org
          org-contrib
          org-superstar
          ox-hugo
          posframe
          prescient
          projectile
          protobuf-mode
          rainbow-delimiters # configured
          rainbow-mode
          restclient
          rustic
          scss-mode
          smartparens
          sql-indent
          tempel
          tempel-collection
          treesit-grammars.with-all-grammars
          use-package # configured
          vertico
          vterm
          vterm-toggle
          restart-emacs
          multi-vterm
          mastodon
          web-mode
          which-key # configured
          which-key-posframe
          yaml-mode
          yasnippet
          yasnippet-snippets
          ement
        ];
    };
  };
}
