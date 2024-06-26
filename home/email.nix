{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.email.enable = mkEnableOption "email settings";
  config = mkIf config.email.enable {
    accounts.email.maildirBasePath = "${config.home.homeDirectory}/mail";
    accounts.email.accounts.Personal = {
      # maildir = null;
      primary = true;
      address = "me@prma.dev";
      userName = "me@prma.dev";
      realName = "Perma";
      # passwordCommand = "${pkgs.coreutils}/bin/cat ~/secrets/k"; # I know! it is embarresing
      passwordCommand = "${pkgs.pass-wayland}/bin/pass show email/me@prma.dev | ${pkgs.coreutils}/bin/head -1";
      maildir.path = "prma";
      # folder.inbox = "virtual.all";
      imap = {
        host = "imap.migadu.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.migadu.com";
        port = 465;
        tls.enable = true;
      };
      himalaya = {
        enable = true;
        settings = {
          default = true;
          "display-name" = "Perma Alesheikh";
          email = "me@prma.dev";
          signature = "Warm regards,";
          "signature-delim" = "▒▒▒▒▒▒▒\n";
          sync = {
            enable = true;
            dir = "/home/a/email";
            backend = "imap-cache";
          };
          maildir.root-dir = "/home/a/.local/share/pimalaya/email/sync/66125b2ca7b164f4";
          folder.sync.filter = "all";

          backend = "maildir";
          envelope = {
            list = {
              backend = "maildir";
              "page-size" = 20;
            };
          };
          message = {
            send = {
              backend = "smtp";
              "save-copy" = true;
            };
          };
          imap = {
            host = "imap.migadu.com";
            port = 993;
            auth = "passwd";
            login = "me@prma.dev";
            encryption = "tls";
            passwd.cmd = "${pkgs.gopass}/bin/gopass show -o email/me@prma.dev";
          };
          smtp = {
            host = "smtp.migadu.com";
            port = 465;
            login = "me@prma.dev";
            encryption = "tls";
            auth = "passwd";
            passwd.cmd = "${pkgs.gopass}/bin/gopass show -o email/me@prma.dev";
          };
          # "maildir-root-dir" = "${config.home.homeDirectory}/mail/prma";
        };
      };
      thunderbird = {
        enable = true;
        profiles = ["prma"];
      };
      msmtp = {
        enable = true;
      };

      aerc = {
        enable = true;
        # imapAuth = "oauthbearer";
        smtpAuth = "plain";
      };
      # notmuch.enable = true;

      neomutt = {
        enable = true;
        # sendMailCommand = "${pkgs.go-graft}/bin/gg ${pkgs.msmtp}/bin/msmtpq --read-envelope-from --read-recipients";
        sendMailCommand = "${pkgs.msmtp}/bin/msmtpq --read-envelope-from --read-recipients";
      };
    };
    programs.thunderbird = {
      enable = true;
      profiles.prma = {
        isDefault = true;
      };
    };
    programs.himalaya = {
      enable = true;
      settings = {
        accounts.personal = {
          default = true;
          email = "me@prma.dev";
          envelope.list.backend = "imap";
          message.send.backend = "smtp";
          backend = "imap";
          imap = {
            host = "imap.migadu.com";
            port = 993;
            auth = "passwd";
            login = "me@prma.dev";
            encryption = "tls";
            passwd.cmd = "${pkgs.gopass}/bin/gopass show -o email/me@prma.dev";
          };
          smtp = {
            host = "smtp.migadu.com";
            port = 465;
            login = "me@prma.dev";
            encryption = "tls";
            auth = "passwd";
            passwd.cmd = "${pkgs.gopass}/bin/gopass show -o email/me@prma.dev";
          };
        };
      };
      # "maildir-root-dir" = "${config.home.homeDirectory}/mail/prma";
      # package = inputs.himalaya.packages.x86_64-linux.linux;
    };
    services.himalaya-watch = {
      enable = true;
      environment = {
        "PASSWORD_STORE_DIR" = "/home/a/repos/pass";
      };
    };

    # programs.fish.interactiveShellInit = ''
    #   ${pkgs.himalaya}/bin/himalaya completion fish | sd "Shell script successfully generated for shell fish!" "" | source;
    # '';
    # programs.fish.interactiveShellInit = ''
    # ${pkgs.himalaya}/bin/himalaya completion fish | source;
    # '';
    programs.neomutt = {
      enable = true;
      vimKeys = true;
    };
    programs.msmtp = {
      enable = true;
    };
  };
}
