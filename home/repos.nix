{
  config,
  lib,
  ...
}:
with lib; {
  options.repos = {
    enable = mkEnableOption "repos settings";
    path = lib.mkOption {
      type = types.path;
      default = "${config.home.homeDirectory}/repos";
      description = "the path for all the repos";
    };

    notes = {
      enable = mkEnableOption "enable notes repo";

      path = lib.mkOption {
        type = types.path;
        default = "${config.repos.path}/notes";
        description = "the path for the repo";
      };

      remote = lib.mkOption {
        type = types.str;
        default = "https://codeberg.org/prma/notes";
        description = "the remote";
      };

      description = "the path for the note";
    };

    prma = {
      enable = mkEnableOption "enable prma repo";

      path = lib.mkOption {
        type = types.path;
        default = "${config.repos.path}/prma";
        description = "the path for the prma";
      };

      remote = lib.mkOption {
        type = types.str;
        default = "https://github.com/prmadev/prma";
        description = "the remote";
      };

      description = "the path for the prma";
    };

    algae = {
      enable = mkEnableOption "enable algae repo";

      path = lib.mkOption {
        type = types.path;
        default = "${config.repos.path}/algae";
        description = "the path for the algae";
      };

      remote = lib.mkOption {
        type = types.str;
        default = "https://codeberg.org/prma/algae";
        description = "the remote";
      };

      description = "the path for the algae";
    };

    webarchive = {
      enable = mkEnableOption "enable webarchive repo";

      path = lib.mkOption {
        type = types.path;
        default = "${config.repos.path}/webarchive";
        description = "the path for the webarchive";
      };

      remote = lib.mkOption {
        type = types.str;
        default = "https://github.com/prmadev/webarchive";
        description = "the remote";
      };

      description = "the path for the webarchive";
    };

    prmadev = {
      enable = mkEnableOption "enable prmadev repo";

      path = lib.mkOption {
        type = types.path;
        default = "${config.repos.path}/prmadev";
        description = "the path for the prmadev";
      };

      remote = lib.mkOption {
        type = types.str;
        default = "https://codeberg.org/prma/prmadev";
        description = "the remote";
      };

      description = "the path for the prmadev";
    };

    amirographycom = {
      enable = mkEnableOption "enable amirographycom repo";

      path = lib.mkOption {
        type = types.path;
        default = "${config.repos.path}/amirographycom";
        description = "the path for the amirographycom";
      };

      remote = lib.mkOption {
        type = types.str;
        default = "https://github.com/prmadev/amirographycom";
        description = "the remote";
      };

      description = "the path for the amirographycom";
    };

    soapberry = {
      enable = mkEnableOption "enable soapberry repo";

      path = lib.mkOption {
        type = types.path;
        default = "${config.repos.path}/soapberry";
        description = "the path for the soapberry";
      };

      remote = lib.mkOption {
        type = types.str;
        default = "https://codeberg.org/prma/soapberry";
        description = "the remote";
      };

      description = "the path for the soapberry";
    };

    hxkeyboards = {
      enable = mkEnableOption "enable hxkeyboards repo";

      path = lib.mkOption {
        type = types.path;
        default = "${config.repos.path}/hxkeyboards";
        description = "the path for the hxkeyboards";
      };

      remote = lib.mkOption {
        type = types.str;
        default = "https://github.com/prmadev/hxkeyboards";
        description = "the remote";
      };

      description = "the path for the hxkeyboards";
    };
  };

  config = mkIf config.repos.enable {
    home.sessionVariables = {
      REPOS = "${config.repos.path}";

      NOTES = mkIf config.repos.notes.enable "${config.repos.notes.path}";
      NOTES_REPO = mkIf config.repos.notes.enable "${config.repos.notes.remote}";

      PRMA = mkIf config.repos.prma.enable "${config.repos.prma.path}";
      PRMA_REPO = mkIf config.repos.prma.enable "${config.repos.prma.remote}";

      ALGAE = mkIf config.repos.algae.enable "${config.repos.algae.path}";
      ALGAE_REPO = mkIf config.repos.algae.enable "${config.repos.algae.remote}";

      WEBARCHIVE = mkIf config.repos.webarchive.enable "${config.repos.webarchive.path}";
      WEBARCHIVE_REPO = mkIf config.repos.webarchive.enable "${config.repos.webarchive.remote}";

      PRMADEV = mkIf config.repos.prmadev.enable "${config.repos.prmadev.path}";
      PRMADEV_REPO = mkIf config.repos.prmadev.enable "${config.repos.prmadev.remote}";

      AMIROGRAPHYCOM = mkIf config.repos.amirographycom.enable "${config.repos.amirographycom.path}";
      AMIROGRAPHYCOM_REPO = mkIf config.repos.amirographycom.enable "${config.repos.amirographycom.remote}";

      SOAPBERRY = mkIf config.repos.soapberry.enable "${config.repos.soapberry.path}";
      SOAPBERRY_REPO = mkIf config.repos.soapberry.enable "${config.repos.soapberry.remote}";

      HXKEYBOARDS = mkIf config.repos.hxkeyboards.enable "${config.repos.hxkeyboards.path}";
      HXKEYBOARDS_REPO = mkIf config.repos.hxkeyboards.enable "${config.repos.hxkeyboards.remote}";
    };
  };
}
