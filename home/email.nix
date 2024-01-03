{
  lib,
  config,
  pkgs,
  inputs,
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
      passwordCommand = "${pkgs.coreutils}/bin/cat ~/secrets/k"; # I know! it is embarresing
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
          envelope.list.backend = "imap";
          backend = "maildir";
          "maildir-root-dir" = "${config.home.homeDirectory}/mail/prma";
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
        sendMailCommand = "${pkgs.go-graft}/bin/gg ${pkgs.msmtp}/bin/msmtpq --read-envelope-from --read-recipients";
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
      # package = inputs.himalaya.packages.x86_64-linux.musl;
      settings = {
        Personal = {
          "maildir-root-dir" = "${config.home.homeDirectory}/mail";
        };
      };
    };

    programs.fish.interactiveShellInit = ''
      ${inputs.himalaya.packages.x86_64-linux.musl}/bin/himalaya completions fish | ${pkgs.sd}/bin/sd "Shell script successfully generated for shell fish!" "" | source;
    '';
    programs.neomutt = {
      enable = true;
      vimKeys = true;
    };
    programs.msmtp = {
      enable = true;
    };
  };
}
