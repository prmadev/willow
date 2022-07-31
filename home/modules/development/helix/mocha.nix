{config, ...}: {
  programs.helix.themes.catppuccin-mocha = {
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
      # pops up when running a command
      fg = config.cat.mocha.text.hex;
      bg = config.cat.mocha.surface0.hex;
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
      fg = config.cat.mocha.text.hex;
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
    "ui.popup" = {bg = config.cat.mocha.surface0.hex;};
    "ui.popup.info" = {bg = config.cat.mocha.surface0.hex;};
    "ui.window" = {
      bg = config.cat.mocha.base.hex;
      fg = config.cat.mocha.base.hex;
      modifiers = ["hidden"];
    };
    "ui.help" = {
      bg = config.cat.mocha.overlay0.hex;
      fg = config.cat.mocha.crust.hex;
    };

    ##### tree-sitter

    "comment" = {
      fg = config.cat.mocha.overlay1.hex;
      modifiers = ["italic" "dim"];
    };
    "operator" = {
      fg = config.cat.mocha.sky.hex;
      modifiers = ["bold"];
    };
    "punctuation" = {
      fg = config.cat.mocha.teal.hex;
      modifiers = ["bold"];
    };
    "variable" = config.cat.mocha.text.hex;
    "constant" = config.cat.mocha.yellow.hex;
    "constant.numeric" = config.cat.mocha.peach.hex;
    "constant.character.escape" = config.cat.mocha.subtext1.hex;
    "attributes" = config.cat.mocha.yellow.hex;
    "type" = config.cat.mocha.blue.hex;
    "string" = {
      fg = config.cat.mocha.flamingo.hex;
      modifiers = ["italic"];
    };
    "property" = config.cat.mocha.sapphire.hex;

    "function" = config.cat.mocha.lavender.hex;
    "function.builtin" = config.cat.mocha.lavender.hex;
    "function.method" = config.cat.mocha.lavender.hex;
    "constructor" = config.cat.mocha.yellow.hex;
    "special" = config.cat.mocha.green.hex;
    "keyword" = {
      fg = config.cat.mocha.red.hex;
      modifiers = ["bold" "italic"];
    };
    "keyword.control" = {
      fg = config.cat.mocha.flamingo.hex;
      modifiers = [];
    };
    "label" = config.cat.mocha.mauve.hex;

    "namespace" = config.cat.mocha.rosewater.hex;
    "tag" = config.cat.mocha.teal.hex;
    "text" = config.cat.mocha.text.hex;

    "diff.plus" = config.cat.mocha.green.hex;
    "diff.delta" = config.cat.mocha.yellow.hex;
    "diff.minus" = config.cat.mocha.red.hex;

    # gutter:
    "info" = {
      fg = config.cat.mocha.crust.hex;
      bg = config.cat.mocha.sapphire.hex;
    };
    "hint" = {
      fg = config.cat.mocha.crust.hex;
      bg = config.cat.mocha.green.hex;
    };
    "warning" = {
      fg = config.cat.mocha.crust.hex;
      bg = config.cat.mocha.yellow.hex;
    };
    "error" = {
      fg = config.cat.mocha.crust.hex;
      bg = config.cat.mocha.red.hex;
    };
    "debug" = config.cat.mocha.red.hex;

    "diagnostic.hint" = {
      fg = config.cat.mocha.green.hex;
      modifiers = ["underlined"];
    };
    "diagnostic.info" = {
      fg = config.cat.mocha.sapphire.hex;
      modifiers = ["underlined"];
    };
    "diagnostic.warning" = {
      fg = config.cat.mocha.yellow.hex;
      modifiers = ["underlined"];
    };
    "diagnostic.error" = {
      fg = config.cat.mocha.red.hex;
      modifiers = ["underlined"];
    };

    "markup.heading.marker" = config.cat.mocha.subtext0.hex;
    "markup.heading.1" = {
      fg = config.cat.mocha.red.hex;
      modifiers = ["bold"];
    };
    "markup.heading.2" = {
      fg = config.cat.mocha.peach.hex;
      modifiers = ["bold"];
    };
    "markup.heading.3" = {
      fg = config.cat.mocha.yellow.hex;
      modifiers = ["bold"];
    };
    "markup.heading.4" = {
      fg = config.cat.mocha.green.hex;
      modifiers = ["bold"];
    };
    "markup.heading.5" = {
      fg = config.cat.mocha.teal.hex;
      modifiers = ["bold"];
    };
    "markup.heading.6" = {
      fg = config.cat.mocha.blue.hex;
      modifiers = ["bold"];
    };
    "markup.list" = {fg = config.cat.mocha.maroon.hex;};
    "markup.bold" = {
      fg = config.cat.mocha.peach.hex;
      modifiers = ["bold"];
    };
    "markup.italic" = {
      fg = config.cat.mocha.mauve.hex;
      modifiers = ["italic"];
    };
    "markup.link.url" = {
      fg = config.cat.mocha.rosewater.hex;
      modifiers = ["underlined"];
    };
    "markup.link.text" = {fg = config.cat.mocha.flamingo.hex;};
    "markup.quote" = {fg = config.cat.mocha.pink.hex;};
    "markup.raw" = {fg = config.cat.mocha.sky.hex;};
  };
}
