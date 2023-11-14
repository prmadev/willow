{
  lib,
  config,
  ...
}:
with lib; {
  options.notmuch.enable = mkEnableOption "notmuch settings";
  config = mkIf config.notmuch.enable {
    # accounts.email.maildirBasePath = "${config.home.homeDirectory}/.mail";
    accounts.email.accounts.Personal = {
      # maildir = null;
      primary = true;
      address = "me@prma.dev";
      userName = "me@prma.dev";
      realName = "Perma";
      passwordCommand = "cat ~/secrets/k"; # I know! it is embarresing
      # maildir.path = "maildir://~/maildir/prma";
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
      thunderbird = {
        enable = true;
        profiles = ["prma"];
      };

      aerc = {
        enable = true;
        # imapAuth = "oauthbearer";
        smtpAuth = "plain";
      };
      # notmuch.enable = true;
      mbsync = {
        # enable = true;
        # create = "imap";
        # patterns = ["INBOX"];
      };

      neomutt = {
        # enable = true;
      };
    };
    programs.thunderbird = {
      enable = true;
      profiles.prma = {
        isDefault = true;
      };
    };
    # programs.neomutt = {
    #   enable = true;
    # };
  };
}
