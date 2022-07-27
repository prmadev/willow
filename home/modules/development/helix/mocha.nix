{config, ...}: {
  programs.helix.themes.rp = {
    ###### UI
    "ui.background" = {bg = config.cat.mocha.base.hex;};
    "ui.background.separator" = {
      fg = config.cat.mocha.base.hex;
      modifiers = ["hidden"];
    };
    "ui.cursor" = {
      bg = config.cat.mocha.surface2.hex;
      fg = config.cat.mocha.crust.hex;
    };

    "ui.cursor.primary" = {
      bg = config.cat.mocha.rosewater.hex;
      fg = config.cat.mocha.crust.hex;
    };

    "ui.cursor.match" = {
      bg = config.cat.mocha.surface1.hex;
      fg = config.cat.mocha.crust.hex;
    };

    "ui.menu" = {
      fg = config.cat.mocha.text.hex;
      bg = config.cat.mocha.mantle.hex;
      modifiers = [];
    };
    "ui.menu.selected" = {
      fg = config.cat.mocha.crust.hex;
      bg = config.cat.mocha.surface2.hex;
    };
    "ui.linenr" = {fg = config.cat.mocha.overlay1.hex;};
    "ui.linenr.selected" = {bg = config.cat.mocha.surface2.hex;};
    "ui.selection" = {bg = config.cat.mocha.surface2.hex;};
    "ui.statusline" = {
      fg = config.cat.mocha.crust.hex;
      bg = config.cat.mocha.surface0.hex;
    };
    "ui.statusline.insert" = {
      fg = config.cat.mocha.base.hex;
      bg = config.cat.mocha.text.hex;
      modifiers = ["bold"];
    };
    "ui.statusline.normal" = {
      fg = config.cat.mocha.base.hex;
      bg = config.cat.mocha.green.hex;
      modifiers = [];
    };
    "ui.statusline.select" = {
      fg = config.cat.mocha.base.hex;
      bg = config.cat.mocha.peach.hex;
      modifiers = ["bold"];
    };
    "ui.text" = {fg = config.cat.mocha.text.hex;};
    "ui.text.focus" = {
      fg = config.cat.mocha.text.hex;
      modifiers = [];
    };
    "ui.text.info" = {
      fg = config.cat.mocha.text.hex;
      modifiers = [];
    };

    "ui.virtual.whitespace" = config.cat.mocha.rosewater.hex;
    "ui.popup" = {bg = config.cat.mocha.overlay0.hex;};
    "ui.popup.info" = {bg = config.cat.mocha.overlay0.hex;};
    "ui.window" = {
      bg = config.cat.mocha.base.hex;
      fg = config.cat.mocha.base.hex;
      modifiers = ["hidden"];
    };
    "ui.help" = {
      bg = config.cat.mocha.overlay0.hex;
      fg = config.cat.mocha.text.hex;
    };

    ##### tree-sitter

    "comment" = {
      fg = config.colors.muted.hex;
      modifiers = ["italic" "dim"];
    };
    "operator" = {
      fg = config.colors.gold.hex;
      modifiers = ["bold"];
    };
    "punctuation" = {
      fg = config.colors.gold.hex;
      modifiers = ["bold"];
    };
    "variable" = config.colors.text.hex;
    "constant" = config.colors.gold.hex;
    "constant.numeric" = config.colors.iris.hex;
    "constant.character.escape" = config.colors.subtle.hex;
    "attributes" = config.colors.gold.hex;
    "type" = config.colors.foam.hex;
    "string" = {
      fg = config.colors.foam.hex;
      modifiers = ["italic"];
    };
    "property" = config.colors.foam.hex;

    "function" = config.colors.rose.hex;
    "function.builtin" = config.colors.rose.hex;
    "function.method" = config.colors.rose.hex;
    "constructor" = config.colors.gold.hex;
    "special" = config.colors.gold.hex;
    "keyword" = {
      fg = config.colors.love.hex;
      modifiers = ["bold" "italic"];
    };
    "keyword.control" = {
      fg = config.colors.gold.hex;
      modifiers = [];
    };
    "label" = config.colors.iris.hex;

    "namespace" = config.colors.pine.hex;
    "tag" = config.colors.foam.hex;
    "text" = config.colors.text.hex;

    "diff.plus" = config.colors.foam.hex;
    "diff.delta" = config.colors.rose.hex;
    "diff.minus" = config.colors.love.hex;

    # gutter:
    "info" = {
      fg = config.cat.mocha.base.hex;
      bg = config.colors.pine.hex;
    };
    "hint" = {
      fg = config.cat.mocha.base.hex;
      bg = config.colors.foam.hex;
    };
    "warning" = {
      fg = config.cat.mocha.base.hex;
      bg = config.colors.gold.hex;
    };
    "error" = {
      fg = config.cat.mocha.base.hex;
      bg = config.colors.love.hex;
    };
    "debug" = config.colors.rose.hex;

    "diagnostic.hint" = {
      fg = config.colors.pine.hex;
      modifiers = ["underlined"];
    };
    "diagnostic.info" = {
      fg = config.colors.foam.hex;
      modifiers = ["underlined"];
    };
    "diagnostic.warning" = {
      fg = config.colors.gold.hex;
      modifiers = ["underlined"];
    };
    "diagnostic.error" = {
      fg = config.colors.rose.hex;
      modifiers = ["underlined"];
    };

    "markup.heading.marker" = config.colors.subtle.hex;
    "markup.heading.1" = {
      fg = config.colors.love.hex;
      modifiers = ["bold"];
    };
    "markup.heading.2" = {
      fg = config.colors.gold.hex;
      modifiers = ["bold"];
    };
    "markup.heading.3" = {
      fg = config.colors.rose.hex;
      modifiers = ["bold"];
    };
    "markup.heading.4" = {
      fg = config.colors.pine.hex;
      modifiers = ["bold"];
    };
    "markup.heading.5" = {
      fg = config.colors.foam.hex;
      modifiers = ["bold"];
    };
    "markup.heading.6" = {
      fg = config.colors.iris.hex;
      modifiers = ["bold"];
    };
    "markup.list" = {fg = config.colors.love.hex;};
    "markup.bold" = {
      fg = config.colors.gold.hex;
      modifiers = ["bold"];
    };
    "markup.italic" = {
      fg = config.colors.iris.hex;
      modifiers = ["italic"];
    };
    "markup.link.url" = {
      fg = config.colors.pine.hex;
      modifiers = ["underlined"];
    };
    "markup.link.text" = {fg = config.colors.foam.hex;};
    "markup.quote" = {fg = config.colors.rose.hex;};
    "markup.raw" = {fg = config.colors.foam.hex;};
  };
}
