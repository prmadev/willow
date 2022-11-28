{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; {
  options = {
    browser.firefox.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.browser.firefox.enable {
    programs.firefox = {
      enable = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        adnauseam
        bitwarden
        clearurls
        enhanced-github
        enhancer-for-youtube
        switchyomega
        i-dont-care-about-cookies
        snowflake
        sponsorblock
        stylus
        tabliss
      ];
      profiles = {
        default = {
          name = "default";
          bookmarks = [
            {
              name = "home-manager options search";
              keyword = "nix";
              url = "https://mipmip.github.io/home-manager-option-search/";
            }
            # {
            #   name = "";
            #   keyword = "";
            #   url = "";
            # }
            # {
            #   name = "";
            #   keyword = "";
            #   url = "";
            # }
            # {
            #   name = "";
            #   keyword = "";
            #   url = "";
            # }
            # {
            #   name = "";
            #   keyword = "";
            #   url = "";
            # }
            # {
            #   name = "";
            #   keyword = "";
            #   url = "";
            # }
          ];
          extraConfig = ''

          '';
          isDefault = true;
          settings = {
            "browser.startup.homepage" = "https://nixos.org";

            # --- UI
            "browser.search.separatePrivateDefault.urlbarResult.enabled" = false;

            # --- newtab
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.newtabpage.activity-stream.showSearch" = false;

            # --- bookmarking
            "browser.bookmarks.addedImportButton" = false;
            "browser.bookmarks.restore_default_bookmarks" = false;

            # --- behavior
            "browser.contentblocking.category" = "standard";
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "browser.ping-centre.telemetry" = false;
            "network.trr.confirmation_telemetry_enabled" = false;
            # --- to avoid location personalization which I hate
            "browser.search.region" = "US";
            "browser.search.isUS" = true;
            "distribution.searchplugins.defaultLocale" = "en-US";
            "general.useragent.locale" = "en-US";
            "browser.region.update.region" = "US";
          };

          userChrome = '''';
          userContent = '''';

          search = {
            default = "you";
            force = true;
            engines = {
              "you" = {
                urls = [
                  {
                    template = "https://you.com/search?q={searchTerms}";
                  }
                ];
              };

              "Nix Packages" = {
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "type";
                        value = "packages";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                definedAliases = ["@np"];
              };

              "NixOS Wiki" = {
                urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = ["@nw"];
              };
              "Bing".metaData.hidden = true;
            };
          };
        };
      };
    };
  };
}
