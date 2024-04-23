{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.git.enable = mkEnableOption "git settings";

  config = mkIf config.git.enable {
    home.packages = with pkgs; [
      git-gone # trim stale branches :: Cleanup stale Git branches of pull requests
      git-open # :: Type `git open` to open the GitHub page or website for a repository in your browser.
      git-bug # bug reporting right inside the repo :: Distributed, offline-first bug tracker embedded in git, with bridges
      git-workspace # workspace management
      codeberg-cli
      git-get # :: A better way to clone, organize and manage multiple git repositories
      gitleaks # :: Protect and discover secrets using Gitleaks
      git-graph # :: Command line tool to show clear git graphs arranged for your branching model
      git-ps-rs # :: Git Patch Stack command line interface, gps
      git-trim # :: Automatically trims your branches whose tracking remote refs are merged or stray
      # gitrs # :: A simple, opinionated, tool, written in Rust, for declaratively managing Git repos on your machine
      mani # :: CLI tool to help you manage multiple repositories
      # git-interactive-rebase-tool # :: Native cross platform full feature terminal based sequence editor for git interactive rebase
      stgit # :: A patch manager implemented on top of Git
    ];

    programs.git = {
      enable = true;
      package = pkgs.gitFull;
      userEmail = "me@prma.dev";
      userName = "Perma Alesheikh";
      hooks = {
        "prepare-commit-msg" = pkgs.writeShellScript "signOffCheck.sh" ''
          NAME=$(git config user.name)
          EMAIL=$(git config user.email)
          COMMIT_MSG_FILE=$1
          COMMIT_SOURCE=$2
          SHA1=$3

          if [ -z "$NAME" ]; then
              echo "empty git config user.name"
              exit 1
          fi

          if [ -z "$EMAIL" ]; then
              echo "empty git config user.email"
              exit 1
          fi



          # Ensure the trailers are properly interpreted, just as before
          git interpret-trailers --if-exists doNothing --trailer \
              Signed-off-by:" $NAME <$EMAIL>" \
              --in-place "$COMMIT_MSG_FILE"

          exit 0

          # git interpret-trailers --if-exists doNothing --trailer \
          #     \
          #     "Signed-off-by: $NAME <$EMAIL>" \
          #     --in-place "$1"
        '';
        # "pre-commit" = pkgs.writeShellScript "pre-commit.sh" ''
        # exec ${pkgs.pre-commit}/bin/pre-commit run
        # '';
      };
      ignores = [
        ".env"
        ".vscode"
        "target/"
        "result/"
        ".idea/"
      ];
      aliases = {
        cs = "commit --signoff --gpg-sign";
        ai = "add -p";
        ra = "rebase -i";
      };
      extraConfig = {
        format.signOff = true;
        stgit = {
          autostash = true;
          gpgsign = true;
          pull-policy = "rebase";
          alias = {
            ns = "new --signoff";
          };
        };

        # commit.template = "${config.home.homeDirectory}/.config/git/gitmessage";
        commit.template = "${pkgs.writeTextFile
          {
            name = "git";
            text = ''

              # When applied, this commit will… ━━━━━━━━━━━━━━━┙



              # I made this change to…━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┙

              #
              # More on good Git messages:
              # How to Write a Git Commit Message: https://chris.beams.io/posts/git-commit/
              # Tips for a disciplined git workflow: https://drewdevault.com/2019/02/25/Using-git-with-discipline.html
            '';
            destination = "";
          }}";
        sendemail.annotate = true;
        pull.rebase = true;
        init = {
          defaultBranch = "main";
        };
        merge.conflictStyle = "zdiff3";
        rebase.autosquash = true;
        rebase.autoSquash = true;
        rebase.autoStash = true;
        rerere.enabled = true;
        url = {
          "ssh://git@codeberg.org".insteadOf = "https://codeberg.org";
          "ssh://git@gitlab.iranairs.com".insteadOf = "https://gitlab.iranairs.com";
          "ssh://git@gitlab.com".insteadOf = "https://gitlab.com";
          "ssh://git@github.com".insteadOf = "https://github.com";
          "https://github.com/" = {
            insteadOf = [
              "gh:"
              "github:"
            ];
          };
          "https://codeberg.org/" = {
            insteadOf = [
              "cb:"
              "codeberg:"
            ];
          };
        };
      };
      signing = {
        key = "6F22A2C7CFE7AF61";
        signByDefault = true;
      };

      delta.enable = true;
      lfs.enable = true;
      aliases = {
        lg = "log --pretty=\"%C(green bold)%h%C(reset) %C(blue)%d%C(reset) %C(italic)%s%C(reset) %C(Cyan)(%ar)%C(reset)\" --graph";
        gsi = "stash save --keep-index";
        new = "lg main..HEAD";
        missing = "lg HEAD..main";
      };
    };

    programs.fish.interactiveShellInit = ''
      ${pkgs.stgit}/bin/stg completion fish | source;
    '';
    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = false;
      extensions = [
        pkgs.gh-dash
        pkgs.gh-eco
        # gh-poi # not yet available
        pkgs.gh-cal
        pkgs.gh-markdown-preview
      ];
    };
  };
}
