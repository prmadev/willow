{
  pkgs,
  lib,
  config,
  ...
}: let
  color = import ../../colorscheme;
in
  with lib; {
    options = {
      gui.browser.qutebrowser.enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
    config = {
      programs.qutebrowser = mkIf config.gui.browser.qutebrowser.enable {
        enable = true;
        aliases = {
          "adblock-toggle" = "config-cycle -t content.blocking.enabled";
          "mpv" = "spawn --detach mpv {url}";
        };

        searchEngines = {
          DEFAULT = "https://google.com/search?hl=en&q={}";
        };
        settings = {
          content.cookies.accept = "all";
          content.default_encoding = "utf-8";
          content.desktop_capture = "ask";
          # content.dns_prefetch = true;
          # content.frame_flattening = true;
          content.geolocation = "ask";
          content.headers.accept_language = "en-US,en;q=0.9";
          content.headers.do_not_track = true;
          content.headers.referer = "same-domain";
          content.headers.user_agent = "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}";
          content.blocking.enabled = true;
          content.blocking.adblock.lists = [
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
          ];
          content.images = true;
          content.javascript.can_access_clipboard = true;
          content.javascript.enabled = true;
          content.javascript.prompt = true;
          content.local_content_can_access_file_urls = true;
          content.local_storage = true;
          content.mouse_lock = "ask";
          content.proxy = "socks5://127.0.0.1:9050/";
          content.proxy_dns_requests = true;
          content.webgl = true;
          content.webrtc_ip_handling_policy = "default-public-interface-only";
          downloads.position = "bottom";
          downloads.remove_finished = 30000;
          editor.command = ["kitty" "nvim" "{file}"];
          editor.encoding = "utf-8";
          fonts.default_family = [
            "DankMono Nerd Font Mono"
            "Dank Mono"
            "Gintronics"
            "JetBrainsMono Nerd Font"
            "monospace"
            "Fixed"
          ];
          fonts.default_size = "15px";
          fonts.web.family.cursive = "DankMono Nerd Font Mono";
          fonts.web.family.fantasy = "DankMono Nerd Font Mono";
          fonts.web.family.fixed = "DankMono Nerd Font Mono";
          fonts.web.family.sans_serif = "DankMono Nerd Font Mono";
          fonts.web.family.serif = "DankMono Nerd Font Mono";
          fonts.web.family.standard = "DankMono Nerd Font Mono";
          # fonts.web.family.monospace = "JetBrainsMono Nerd Font";
          fonts.web.size.default = 15;
          fonts.web.size.default_fixed = 13;
          hints.auto_follow = "always";
          hints.chars = "asdfghjkl";
          hints.find_implementation = "javascript";
          hints.hide_unmatched_rapid_hints = true;
          hints.leave_on_load = true;
          hints.mode = "letter";
          input.insert_mode.auto_enter = true;
          input.insert_mode.auto_leave = true;
          input.insert_mode.auto_load = false;
          input.insert_mode.leave_on_load = true;
          input.spatial_navigation = true;
          new_instance_open_target = "tab-bg";
          qt.args = ["ozone-platform-hint=auto"];
          scrolling.bar = "when-searching";
          scrolling.smooth = true;
          statusbar.widgets = ["url" "progress" "keypress"];
          tabs.background = true;
          tabs.show = "multiple";
          tabs.title.format = "{audio} {current_title}";
          tabs.tooltips = false;
          tabs.tabs_are_windows = true;

          url.default_page = "file:///home/a/.config/startpage/index.html";
          url.open_base_url = true;
          url.start_pages = [
            "file:///home/a/.config/startpage/index.html"
          ];
          window.hide_decoration = true;
          window.title_format = "qutebrowser";

          colors.completion.category.bg = color.rosepine.base;

          # Bottom border color of the completion widget category headers.
          colors.completion.category.border.bottom = color.rosepine.base;

          # Top border color of the completion widget category headers.
          colors.completion.category.border.top = color.rosepine.base;

          # Foreground color of completion widget category headers.
          colors.completion.category.fg = color.rosepine.text;

          # Background color of the completion widget for even rows.
          colors.completion.even.bg = color.rosepine.base;

          # Background color of the completion widget for odd rows.
          colors.completion.odd.bg = color.rosepine.base;

          # Text color of the completion widget.
          colors.completion.fg = color.rosepine.text;

          # Background color of the selected completion item.
          colors.completion.item.selected.bg = color.rosepine.pine;

          # Bottom border color of the selected completion item.
          colors.completion.item.selected.border.bottom = color.rosepine.highlight-high;

          # Top border color of the completion widget category headers.
          colors.completion.item.selected.border.top = color.rosepine.highlight-high;

          # Foreground color of the selected completion item.
          colors.completion.item.selected.fg = color.rosepine.text;

          # Foreground color of the matched text in the completion.
          colors.completion.match.fg = color.rosepine.gold;

          # Color of the scrollbar in completion view
          colors.completion.scrollbar.bg = color.rosepine.base;

          # Color of the scrollbar handle in completion view.
          colors.completion.scrollbar.fg = color.rosepine.text;

          # Background color for the download bar.
          colors.downloads.bar.bg = color.rosepine.base;

          # Background color for downloads with errors.
          colors.downloads.error.bg = color.rosepine.base;

          # Foreground color for downloads with errors.
          colors.downloads.error.fg = color.rosepine.love;

          # Color gradient stop for download backgrounds.
          colors.downloads.stop.bg = color.rosepine.base;

          # Color gradient interpolation system for download backgrounds.
          # Type: ColorSystem
          # Valid values:
          #   - rgb: Interpolate in the RGB color system.
          #   - hsv: Interpolate in the HSV color system.
          #   - hsl: Interpolate in the HSL color system.
          #   - none: Don't show a gradient.
          colors.downloads.system.bg = "none";

          # Background color for hints. Note that you can use a `rgba(...)` value
          # for transparency.
          colors.hints.bg = color.rosepine.base;

          # Font color for hints.
          colors.hints.fg = color.rosepine.iris;

          # Hints
          hints.border = color.rosepine.surface;

          # Font color for the matched part of hints.
          colors.hints.match.fg = color.rosepine.subtle;

          # Background color of the keyhint widget.
          colors.keyhint.bg = color.rosepine.base;

          # Text color for the keyhint widget.
          colors.keyhint.fg = color.rosepine.iris;

          # Highlight color for keys to complete the current keychain.
          colors.keyhint.suffix.fg = color.rosepine.highlight-high;

          # Background color of an error message.
          colors.messages.error.bg = color.rosepine.base;

          # Border color of an error message.
          colors.messages.error.border = color.rosepine.surface;

          # Foreground color of an error message.
          colors.messages.error.fg = color.rosepine.love;

          # Background color of an info message.
          colors.messages.info.bg = color.rosepine.base;

          # Border color of an info message.
          colors.messages.info.border = color.rosepine.surface;

          # Foreground color an info message.
          colors.messages.info.fg = color.rosepine.pine;

          # Background color of a warning message.
          colors.messages.warning.bg = color.rosepine.base;

          # Border color of a warning message.
          colors.messages.warning.border = color.rosepine.surface;

          # Foreground color a warning message.
          colors.messages.warning.fg = color.rosepine.love;

          # Background color for prompts.
          colors.prompts.bg = color.rosepine.base;

          # # Border used around UI elements in prompts.
          colors.prompts.border = color.rosepine.surface;

          # Foreground color for prompts.
          colors.prompts.fg = color.rosepine.foam;

          # Background color for the selected item in filename prompts.
          colors.prompts.selected.bg = color.rosepine.highlight-high;

          # Background color of the statusbar in caret mode.
          colors.statusbar.caret.bg = color.rosepine.base;

          # Foreground color of the statusbar in caret mode.
          colors.statusbar.caret.fg = color.rosepine.gold;

          # Background color of the statusbar in caret mode with a selection.
          colors.statusbar.caret.selection.bg = color.rosepine.base;

          # Foreground color of the statusbar in caret mode with a selection.
          colors.statusbar.caret.selection.fg = color.rosepine.gold;

          # Background color of the statusbar in command mode.
          colors.statusbar.command.bg = color.rosepine.pine;

          # Foreground color of the statusbar in command mode.
          colors.statusbar.command.fg = color.rosepine.base;

          # Background color of the statusbar in private browsing + command mode.
          colors.statusbar.command.private.bg = color.rosepine.base;

          # Foreground color of the statusbar in private browsing + command mode.
          colors.statusbar.command.private.fg = color.rosepine.subtle;

          # Background color of the statusbar in insert mode.
          colors.statusbar.insert.bg = color.rosepine.foam;

          # Foreground color of the statusbar in insert mode.
          colors.statusbar.insert.fg = color.rosepine.base;

          # Background color of the statusbar.
          colors.statusbar.normal.bg = color.rosepine.base;

          # Foreground color of the statusbar.
          colors.statusbar.normal.fg = color.rosepine.text;

          # Background color of the statusbar in passthrough mode.
          colors.statusbar.passthrough.bg = color.rosepine.gold;

          # Foreground color of the statusbar in passthrough mode.
          colors.statusbar.passthrough.fg = color.rosepine.base;

          # Background color of the statusbar in private browsing mode.
          colors.statusbar.private.bg = color.rosepine.surface;

          # Foreground color of the statusbar in private browsing mode.
          colors.statusbar.private.fg = color.rosepine.subtle;

          # Background color of the progress bar.
          colors.statusbar.progress.bg = color.rosepine.base;

          # Foreground color of the URL in the statusbar on error.
          colors.statusbar.url.error.fg = color.rosepine.love;

          # Default foreground color of the URL in the statusbar.
          colors.statusbar.url.fg = color.rosepine.text;

          # Foreground color of the URL in the statusbar for hovered links.
          colors.statusbar.url.hover.fg = color.rosepine.foam;

          # Foreground color of the URL in the statusbar on successful load
          colors.statusbar.url.success.http.fg = color.rosepine.pine;

          # Foreground color of the URL in the statusbar on successful load
          colors.statusbar.url.success.https.fg = color.rosepine.pine;

          # Foreground color of the URL in the statusbar when there's a warning.
          colors.statusbar.url.warn.fg = color.rosepine.gold;

          # Background color of the tab bar.
          # Type: QtColor
          colors.tabs.bar.bg = color.rosepine.surface;

          # Background color of unselected even tabs.
          # Type: QtColor
          colors.tabs.even.bg = color.rosepine.surface;

          # Foreground color of unselected even tabs.
          # Type: QtColor
          colors.tabs.even.fg = color.rosepine.text;

          # Color for the tab indicator on errors.
          # Type: QtColor
          colors.tabs.indicator.error = color.rosepine.love;

          # Color gradient start for the tab indicator.
          # Type: QtColor
          colors.tabs.indicator.start = color.rosepine.gold;

          # Color gradient end for the tab indicator.
          # Type: QtColor
          colors.tabs.indicator.stop = color.rosepine.pine;

          # Color gradient interpolation system for the tab indicator.
          # Type: ColorSystem
          # Valid values:
          #   - rgb: Interpolate in the RGB color system.
          #   - hsv: Interpolate in the HSV color system.
          #   - hsl: Interpolate in the HSL color system.
          #   - none: Don't show a gradient.
          colors.tabs.indicator.system = "none";

          # Background color of unselected odd tabs.
          # Type: QtColor
          colors.tabs.odd.bg = color.rosepine.surface;

          # Foreground color of unselected odd tabs.
          # Type: QtColor
          colors.tabs.odd.fg = color.rosepine.text;

          #  Background color of selected even tabs.
          #  Type: QtColor
          colors.tabs.selected.even.bg = color.rosepine.pine;

          #  Foreground color of selected even tabs.
          #  Type: QtColor
          colors.tabs.selected.even.fg = color.rosepine.text;

          #  Background color of selected odd tabs.
          #  Type: QtColor
          colors.tabs.selected.odd.bg = color.rosepine.pine;

          # # Foreground color of selected odd tabs.
          # # Type: QtColor
          colors.tabs.selected.odd.fg = color.rosepine.text;
        };
      };
    };
  }
