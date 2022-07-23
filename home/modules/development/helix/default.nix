{ pkgs
, lib
, config
, ...
}:
with lib; {
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

      themes = {
        rp = {
          "ui.background" = { bg = config.colors.base.hex; };
          "ui.background.separator" = { fg = config.colors.base.hex; modifiers = [ "hidden" ]; };
          "ui.cursor" = {
            fg = config.colors.rose.hex;
            modifiers = [ "reversed" ];
          };

          "ui.cursor.primary" = {
            fg = config.colors.love.hex;
            modifiers = [ "reversed" ];
          };

          "ui.cursor.insert" = {
            fg = config.colors.rose.hex;
            modifiers = [ "reversed" ];
          };

          "ui.menu" = {
            fg = config.colors.subtle.hex;
            bg = config.colors.surface.hex;
            modifiers = [ ];
          };
          "ui.menu.selected" = {
            fg = config.colors.text.hex;
            bg = config.colors.pine.hex;
          };
          "ui.linenr" = { fg = config.colors.overlay.hex; };
          "ui.liner.selected" = config.colors.highlight-low.hex;
          "ui.selection" = { bg = config.colors.highlight-med.hex; };
          "ui.statusline" = {
            fg = config.colors.text.hex;
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
            modifiers = [ ];
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


          "ui.text" = { fg = config.colors.subtle.hex; };
          "ui.text.focus" = {
            fg = config.colors.foam.hex;
            modifiers = [ ];
          };
          "ui.text.info" = {
            fg = config.colors.subtle.hex;
            modifiers = [ ];
          };

          "ui.cursor.match" = {
            bg = config.colors.gold.hex;
            modifiers = [ "reversed" ];
          };
          "ui.virtual.whitespace" = config.colors.love.hex;
          "ui.popup" = { bg = config.colors.surface.hex; };
          "ui.popup.info" = { bg = config.colors.surface.hex; };
          "ui.window" = {
            bg = config.colors.base.hex;
            fg = config.colors.base.hex;
            modifiers = [ "hidden" ];
          };
          "ui.help" = {
            bg = config.colors.surface.hex;
            fg = config.colors.foam.hex;
          };

          "comment" = {
            fg = config.colors.muted.hex;
            modifiers = [ "italic" "dim" ];
          };
          "operator" = {
            fg = config.colors.gold.hex;
            modifiers = [ "bold" ];
          };
          "punctuation" = {
            fg = config.colors.gold.hex;
            modifiers = [ "bold" ];
          };
          "variable" = config.colors.text.hex;
          "constant" = config.colors.gold.hex;
          "constant.numeric" = config.colors.iris.hex;
          "constant.character.escape" = config.colors.subtle.hex;
          "attributes" = config.colors.gold.hex;
          "type" = config.colors.foam.hex;
          "string" = {
            fg = config.colors.foam.hex;
            modifiers = [ "italic" ];
          };
          "property" = config.colors.foam.hex;

          "function" = config.colors.rose.hex;
          "function.builtin" = config.colors.rose.hex;
          "function.method" = config.colors.rose.hex;
          "constructor" = config.colors.gold.hex;
          "special" = config.colors.gold.hex;
          "keyword" = {
            fg = config.colors.love.hex;
            modifiers = [ "bold" "italic" ];
          };
          "keyword.control" = {
            fg = config.colors.gold.hex;
            modifiers = [ ];
          };
          "label" = config.colors.iris.hex;

          "namespace" = config.colors.pine.hex;
          "tag" = config.colors.foam.hex;
          "text" = config.colors.text.hex;

          "diff.plus" = config.colors.foam.hex;
          "diff.delta" = config.colors.rose.hex;
          "diff.minus" = config.colors.love.hex;

          "info" = config.colors.gold.hex;
          "hint" = config.colors.gold.hex;
          "debug" = config.colors.rose.hex;
          "diagnostic" = config.colors.rose.hex;
          "error" = {
            fg = config.colors.love.hex;
            bg = config.colors.surface.hex;
          };

          "markup.heading.marker" = config.colors.subtle.hex;
          "markup.heading.1" = {
            bg =
              config.colors.love.hex;
            modifiers = [ "bold" ];
          };
          "markup.heading.2" = {
            bg = config.colors.gold.hex;
            modifiers = [ "bold" ];
          };
          "markup.heading.3" = {
            bg = config.colors.rose.hex;
            modifiers = [ "bold" ];
          };
          "markup.heading.4" = {
            bg = config.colors.pine.hex;
            modifiers = [ "bold" ];
          };
          "markup.heading.5" = {
            bg = config.colors.foam.hex;
            modifiers = [ "bold" ];
          };
          "markup.heading.6" = {
            bg = config.colors.iris.hex;
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
      settings = {
        theme = "rp";
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
