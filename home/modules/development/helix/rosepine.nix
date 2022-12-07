{config, ...}: {
  programs.helix.themes.rp = {
    ###### UI
    "ui.background" = {bg = config.colors.base.hex;};
    "ui.background.separator" = {
      fg = config.colors.base.hex;
      modifiers = ["hidden"];
    };
    "ui.cursor" = {
      # fg = config.colors.rose.hex;
      modifiers = ["reversed"];
    };

    "ui.cursor.primary" = {
      # fg = config.colors.love.hex;
      modifiers = ["reversed" "bold"];
    };

    "ui.cursor.match" = {
      # fg = config.colors.iris.hex;
      modifiers = ["reversed"];
    };

    "ui.menu" = {
      fg = config.colors.text.hex;
      bg = config.colors.surface.hex;
      modifiers = [];
    };
    "ui.menu.selected" = {
      fg = config.colors.text.hex;
      bg = config.colors.pine.hex;
    };
    "ui.linenr" = {
      fg = config.colors.muted.hex;
      bg = config.colors.surface;
    };
    "ui.linenr.selected" = {bg = config.colors.highlight-high.hex;};
    "ui.selection" = {bg = config.colors.highlight-med.hex;};
    "ui.statusline" = {
      fg = config.colors.subtle.hex;
      bg = config.colors.surface.hex;
      modifiers = ["bold"];
    };
    "ui.statusline.insert" = {
      fg = config.colors.base.hex;
      bg = config.colors.love.hex;
      modifiers = ["bold"];
    };
    "ui.statusline.normal" = {
      fg = config.colors.base.hex;
      bg = config.colors.rose.hex;
      modifiers = ["bold"];
    };
    "ui.statusline.select" = {
      fg = config.colors.base.hex;
      bg = config.colors.iris.hex;
      modifiers = ["bold"];
    };
    "ui.statusline.inactive" = {
      fg = config.colors.iris.hex;
      bg = config.colors.surface.hex;
    };
    "ui.text" = {fg = config.colors.text.hex;};
    "ui.text.focus" = {
      fg = config.colors.text.hex;
      modifiers = [];
    };
    "ui.text.info" = {
      fg = config.colors.text.hex;
      modifiers = [];
    };
    "ui.bufferline" = {
      fg = config.colors.muted.hex;
      bg = config.colors.base.hex;
      modifiers = ["bold"];
    };
    "ui.bufferline.active" = {
      fg = config.colors.base.hex;
      bg = config.colors.pine.hex;
      modifiers = ["bold"];
    };

    # "ui.virtual.whitespace" = {bg = config.colors.love.hex;};
    "ui.virtual.indent-guide" = {fg = config.colors.highlight-high.hex;};
    "ui.popup" = {bg = config.colors.surface.hex;};
    "ui.popup.info" = {bg = config.colors.surface.hex;};
    "ui.window" = {
      bg = config.colors.base.hex;
      fg = config.colors.base.hex;
      modifiers = ["hidden"];
    };
    "ui.help" = {
      bg = config.colors.surface.hex;
      fg = config.colors.subtle.hex;
    };

    ##### tree-sitter

    "comment" = {
      bg = config.colors.muted.hex;
      fg = config.colors.base.hex;
      modifiers = ["italic" "dim"];
    };
    "operator" = {
      fg = config.colors.text.hex;
      modifiers = ["bold"];
    };
    "punctuation" = {
      fg = config.colors.subtle.hex;
      modifiers = ["bold"];
    };
    "variable" = config.colors.text.hex;
    "constant" = config.colors.gold.hex;
    "constant.numeric" = config.colors.iris.hex;
    "constant.character.escape" = config.colors.subtle.hex;
    "attributes" = config.colors.gold.hex;
    "type" = config.colors.foam.hex;
    "string" = {
      fg = config.colors.gold.hex;
      modifiers = ["italic"];
    };
    "property" = config.colors.foam.hex;

    "function" = config.colors.text.hex;
    "function.builtin" = config.colors.rose.hex;
    "function.method" = config.colors.text.hex;
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

    "namespace" = config.colors.muted.hex;
    "tag" = config.colors.foam.hex;
    "text" = config.colors.text.hex;

    "diff.plus" = config.colors.foam.hex;
    "diff.delta" = config.colors.rose.hex;
    "diff.minus" = config.colors.love.hex;

    # gutter:
    "info" = {
      fg = config.colors.base.hex;
      bg = config.colors.pine.hex;
    };
    "hint" = {
      fg = config.colors.base.hex;
      bg = config.colors.foam.hex;
    };
    "warning" = {
      fg = config.colors.base.hex;
      bg = config.colors.gold.hex;
    };
    "error" = {
      fg = config.colors.base.hex;
      bg = config.colors.love.hex;
    };
    "debug" = config.colors.rose.hex;

    "diagnostic.hint" = {
      fg = config.colors.pine.hex;
      modifiers = ["underlined"];
    };
    "diagnostic.info" = {
      # modifiers = ["underlined"];
      bg = config.colors.highlight-high.hex;
    };
    "diagnostic.warning" = {
      #fg = config.colors.gold.hex;
      # modifiers = ["underlined"];
      bg = config.colors.highlight-high.hex;
    };
    "diagnostic.error" = {
      bg = config.colors.highlight-high.hex;
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
