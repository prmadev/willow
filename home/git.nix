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
      git-gone # trim stale branches
      git-bug # bug reporting right inside the repo
      git-workspace # workspace management
      codeberg-cli
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

          # Check if it is a merge commit
          if [ "$COMMIT_SOURCE" = "merge" ]; then
              # Avoid adding template text to merge commits
              TEMPLATE=""
          else
              # Prepare the reason template to append to the commit message
              TEMPLATE="\n\n# Mention the reasons for this change in bullet points:
          # Consider this prompt:
          # This is to...
          Reasons:
          - .
          "
          fi

          # Prepare signature with an empty line before it
          SIGN_OFF="
          Signed-off-by: $NAME <$EMAIL>"

          # Append the change reason template if not a merge commit and the template is not already included
          if ! grep -q "Reasons:" "$COMMIT_MSG_FILE" && [ -n "$TEMPLATE" ]; then
              echo -e "$TEMPLATE" >> "$COMMIT_MSG_FILE"
          fi

          # Ensure the trailers are properly interpreted, just as before
          git interpret-trailers --if-exists doNothing --trailer \
              "\n\nSigned-off-by: $NAME <$EMAIL>" \
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

        sendemail.annotate = true;
        pull.rebase = true;
        init = {
          defaultBranch = "main";
        };
        rebase.autosquash = true;
        rebase.autoStash = true;
        url = {
          "ssh://git@codeberg.org".insteadOf = "https://codeberg.org";
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
