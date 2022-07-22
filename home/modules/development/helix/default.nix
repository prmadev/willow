{ pkgs
, lib
, config
, ...
}:
with lib;
{
  options = {
    helix.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.helix.enable {
    programs.helix = {
      enable = true;

      languages = [
        {
          name = "nix";
          auto-format = false;
        }
        {
          name = "html";
          file-types = [ "html" "tmpl" ];
        }
      ];

      settings = {
        theme = "rp";
        themes =
          let
            rpc = import ./rosepine.nix;
          in
          {
            rp =
              {
                "ui.background" = { bg = config.colors.base.hex; };
                "ui.menu" = {
                  fg = config.colors.text.hex;
                  bg = config.colors.overlay.hex;
                };
                "ui.menu.selected" = {
                  fg = config.colors.iris.hex;
                  bg = config.colors.surface.hex;
                };
                "ui.linenr" = { fg = config.colors.subtle.hex; };
                "ui.liner.selected" = config.colors.highlight-low.hex;
                "ui.selection" = { bg = config.colors.highlight-med.hex; };
                "comment" = config.colors.subtle.hex;
                "ui.statusline" = {
                  fg = config.colors.foam.hex;
                  bg = config.colors.surface.hex;
                };
                "ui.statusline.insert" = {
                  fg = config.colors.base.hex;
                  bg = config.colors.foam.hex;
                  modifiers = [ "bold" ];
                };
                "ui.statusline.normal" = {
                  fg = config.colors.base.hex;
                  bg = config.colors.rose.hex;
                  modifiers = [ "bold" ];
                };
                "ui.statusline.select" = {
                  fg = config.colors.base.hex;
                  bg = config.colors.iris.hex;
                  modifiers = [ "bold" ];
                };
                "ui.statusline.inactive" = {
                  fg = config.colors.iris.hex;
                  bg = config.colors.surface.hex;
                };
                "ui.cursor" = {
                  fg = config.colors.rose.hex;
                  modifiers = [ "reversed" ];
                };
                "ui.text" = { fg = config.colors.text.hex; };
                "ui.text.focus" = {
                  fg = config.colors.foam.hex;
                  modifiers = [ "bold" ];
                };
                "ui.text.info" = {
                  fg = config.colors.pine.hex;
                  modifiers = [ "bold" ];
                };
                "ui.virtual.whitespace" = config.colors.highlight-med.hex;
                "operator" = config.colors.rose.hex;
                "variable" = config.colors.text.hex;
                "constant.numeric" = config.colors.iris.hex;
                "constant" = config.colors.gold.hex;
                "attributes" = config.colors.gold.hex;
                "type" = config.colors.foam.hex;
                "ui.cursor.match" = {
                  fg = config.colors.gold.hex;
                  modifiers = [ "underlined" ];
                };
                "string" = config.colors.gold.hex;
                "property" = config.colors.foam.hex;
                "constant.character.escape" = config.colors.subtle.hex;
                "function" = config.colors.rose.hex;
                "function.builtin" = config.colors.rose.hex;
                "function.method" = config.colors.foam.hex;
                "constructor" = config.colors.gold.hex;
                "special" = config.colors.gold.hex;
                "keyword" = config.colors.pine.hex;
                "label" = config.colors.iris.hex;
                "namespace" = config.colors.pine.hex;
                "ui.popup" = { bg = config.colors.surface.hex; };
                "ui.popup.info" = { bg = config.colors.surface.hex; };
                "ui.window" = { bg = config.colors.base.hex; };
                "ui.help" = {
                  bg = config.colors.overlay.hex;
                  fg = config.colors.foam.hex;
                };
                config.colors.text = config.colors.text.hex;
                "diff.plus" = config.colors.foam.hex;
                "diff.delta" = config.colors.rose.hex;
                "diff.minus" = config.colors.love.hex;
                "info" = config.colors.gold.hex;
                "hint" = config.colors.gold.hex;
                "debug" = config.colors.rose.hex;
                "diagnostic" = config.colors.rose.hex;
                "error" = config.colors.love.hex;
                "markup.heading.marker" = config.colors.subtle.hex;
                "markup.heading.1" = {
                  fg =
                    config.colors.love.hex;
                  modifiers = [ "bold" ];
                };
                "markup.heading.2" = {
                  fg = config.colors.gold.hex;
                  modifiers = [ "bold" ];
                };
                "markup.heading.3" = {
                  fg = config.colors.rose.hex;
                  modifiers = [ "bold" ];
                };
                "markup.heading.4" = {
                  fg = config.colors.pine.hex;
                  modifiers = [ "bold" ];
                };
                "markup.heading.5" = {
                  fg = config.colors.foam.hex;
                  modifiers = [ "bold" ];
                };
                "markup.heading.6" = {
                  fg = config.colors.iris.hex;
                  modifiers = [ "bold" ];
                };
                "markup.list" = { fg = config.colors.love.hex; };
                "markup.bold" = {
                  fg = config.colors.gold.hex;
                  modifiers = [ "bold" ];
                };
                "markup.italic" = {
                  fg = config.colors.iris.hex;
                  modifiers = [ "italic" ];
                };
                "markup.link.url" = {
                  fg = config.colors.pine.hex;
                  modifiers = [ "underlined" ];
                };
                "markup.link.text" = { fg = config.colors.foam.hex; };
                "markup.quote" = { fg = config.colors.rose.hex; };
                "markup.raw" = { fg = config.colors.foam.hex; };
              };
          };
        editor = {
          auto-format = false;
          line-number = "relative";
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "block";
          };
        };
      };
    };
    home.packages = with pkgs; [
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.vscode-langservers-extracted
      taplo-lsp
    ];
  };
}
