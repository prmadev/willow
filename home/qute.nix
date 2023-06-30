{
  lib,
  config,
  ...
}:
with lib; {
  options.qutebrowser.enable = mkEnableOption "qute settings";
  config = mkIf config.qutebrowser.enable {
    programs.qutebrowser = {
      enable = true;
      # package = pkgs.qutebrowser-qt6;
      aliases = {
        "adblock-toggle" = "config-cycle -t content.blocking.enabled";
        "mpv" = "spawn --detach mpv {url}";
        "p1080" = "set content.proxy socks5://127.0.0.1:1080";
        "p9050" = "set content.proxy socks5://127.0.0.1:9050";
        "p9150" = "set content.proxy socks5://127.0.0.1:9150";
        "ps" = "set content.proxy system";
      };

      searchEngines = {
      kagi = "https://kagi.com/search?q={}";
      DEFAULT = "https://kagi.com/search?q={}";

        google = "https://google.com/search?q={}";
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
        content.proxy= "socks5://127.0.0.0.1:1080";
        # content.headers.user_agent = "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}";
        content.blocking.enabled = true;
        content.blocking.adblock.lists = [
          "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
        ];
        content.images = true;
        content.javascript.enabled = true;
        content.javascript.prompt = true;
        content.local_content_can_access_file_urls = true;
        content.local_storage = true;
        content.mouse_lock = "ask";
        # content.proxy = "/* socks://127.0.0. */1:9050/";
        # content.proxy_dns_requests = true;
        content.webgl = true;
        content.webrtc_ip_handling_policy = "default-public-interface-only";
        downloads.position = "bottom";
        downloads.remove_finished = 30000;
        editor.command = ["wezterm" "hx" "{file}"];
        editor.encoding = "utf-8";
        fonts.default_family = config.global-fonts.main-set;
        fonts.default_size = "15px";
        # fonts.web.family.cursive = config.global-fonts.main-set;
        # fonts.web.family.fantasy = config.global-fonts.main-set;
        # fonts.web.family.fixed = config.global-fonts.main-set;
        # fonts.web.family.sans_serif = config.global-fonts.main-set;
        # fonts.web.family.serif = config.global-fonts.main-set;
        # fonts.web.family.standard = config.global-fonts.main-set;
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

        url.default_page = "kagi.com";
        url.open_base_url = true;
        url.start_pages = [
        "kagi.com"
        ];
        window.hide_decoration = true;
        window.title_format = "{current_title} qb";

        colors.completion.category.bg = config.colors.macchiato.base.hex;

        # Bottom border color of the completion widget category headers.
        colors.completion.category.border.bottom = config.colors.macchiato.base.hex;

        # Top border color of the completion widget category headers.
        colors.completion.category.border.top = config.colors.macchiato.base.hex;

        # Foreground color of completion widget category headers.
        colors.completion.category.fg = config.colors.macchiato.text.hex;

        # Background color of the completion widget for even rows.
        colors.completion.even.bg = config.colors.macchiato.base.hex;

        # Background color of the completion widget for odd rows.
        colors.completion.odd.bg = config.colors.macchiato.base.hex;

        # Text color of the completion widget.
        colors.completion.fg = config.colors.macchiato.text.hex;

        # Background color of the selected completion item.
        colors.completion.item.selected.bg = config.colors.macchiato.sapphire.hex;

        # Bottom border color of the selected completion item.
        colors.completion.item.selected.border.bottom = config.colors.macchiato.subtext1.hex;

        # Top border color of the completion widget category headers.
        colors.completion.item.selected.border.top = config.colors.macchiato.subtext1.hex;

        # Foreground color of the selected completion item.
        colors.completion.item.selected.fg = config.colors.macchiato.text.hex;

        # Foreground color of the matched text in the completion.
        colors.completion.match.fg = config.colors.macchiato.yellow.hex;

        # Color of the scrollbar in completion view
        colors.completion.scrollbar.bg = config.colors.macchiato.base.hex;

        # Color of the scrollbar handle in completion view.
        colors.completion.scrollbar.fg = config.colors.macchiato.text.hex;

        # Background color for the download bar.
        colors.downloads.bar.bg = config.colors.macchiato.base.hex;

        # Background color for downloads with errors.
        colors.downloads.error.bg = config.colors.macchiato.base.hex;

        # Foreground color for downloads with errors.
        colors.downloads.error.fg = config.colors.macchiato.red.hex;

        # Color gradient stop for download backgrounds.
        colors.downloads.stop.bg = config.colors.macchiato.base.hex;

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
        colors.hints.bg = config.colors.macchiato.base.hex;

        # Font color for hints.
        colors.hints.fg = config.colors.macchiato.lavendar.hex;

        # Hints
        hints.border = config.colors.macchiato.surface1.hex;

        # Font color for the matched part of hints.
        colors.hints.match.fg = config.colors.macchiato.subtext0.hex;

        # Background color of the keyhint widget.
        colors.keyhint.bg = config.colors.macchiato.base.hex;

        # Text color for the keyhint widget.
        colors.keyhint.fg = config.colors.macchiato.lavendar.hex;

        # Highlight color for keys to complete the current keychain.
        colors.keyhint.suffix.fg = config.colors.macchiato.subtext1.hex;

        # Background color of an error message.
        colors.messages.error.bg = config.colors.macchiato.base.hex;

        # Border color of an error message.
        colors.messages.error.border = config.colors.macchiato.surface1.hex;

        # Foreground color of an error message.
        colors.messages.error.fg = config.colors.macchiato.red.hex;

        # Background color of an info message.
        colors.messages.info.bg = config.colors.macchiato.base.hex;

        # Border color of an info message.
        colors.messages.info.border = config.colors.macchiato.surface1.hex;

        # Foreground color an info message.
        colors.messages.info.fg = config.colors.macchiato.sapphire.hex;

        # Background color of a warning message.
        colors.messages.warning.bg = config.colors.macchiato.base.hex;

        # Border color of a warning message.
        colors.messages.warning.border = config.colors.macchiato.surface1.hex;

        # Foreground color a warning message.
        colors.messages.warning.fg = config.colors.macchiato.red.hex;

        # Background color for prompts.
        colors.prompts.bg = config.colors.macchiato.base.hex;

        # # Border used around UI elements in prompts.
        colors.prompts.border = config.colors.macchiato.surface1.hex;

        # Foreground color for prompts.
        colors.prompts.fg = config.colors.macchiato.teal.hex;

        # Background color for the selected item in filename prompts.
        colors.prompts.selected.bg = config.colors.macchiato.subtext1.hex;

        # Background color of the statusbar in caret mode.
        colors.statusbar.caret.bg = config.colors.macchiato.base.hex;

        # Foreground color of the statusbar in caret mode.
        colors.statusbar.caret.fg = config.colors.macchiato.yellow.hex;

        # Background color of the statusbar in caret mode with a selection.
        colors.statusbar.caret.selection.bg = config.colors.macchiato.base.hex;

        # Foreground color of the statusbar in caret mode with a selection.
        colors.statusbar.caret.selection.fg = config.colors.macchiato.yellow.hex;

        # Background color of the statusbar in command mode.
        colors.statusbar.command.bg = config.colors.macchiato.sapphire.hex;

        # Foreground color of the statusbar in command mode.
        colors.statusbar.command.fg = config.colors.macchiato.base.hex;

        # Background color of the statusbar in private browsing + command mode.
        colors.statusbar.command.private.bg = config.colors.macchiato.base.hex;

        # Foreground color of the statusbar in private browsing + command mode.
        colors.statusbar.command.private.fg = config.colors.macchiato.subtext0.hex;

        # Background color of the statusbar in insert mode.
        colors.statusbar.insert.bg = config.colors.macchiato.teal.hex;

        # Foreground color of the statusbar in insert mode.
        colors.statusbar.insert.fg = config.colors.macchiato.base.hex;

        # Background color of the statusbar.
        colors.statusbar.normal.bg = config.colors.macchiato.base.hex;

        # Foreground color of the statusbar.
        colors.statusbar.normal.fg = config.colors.macchiato.text.hex;

        # Background color of the statusbar in passthrough mode.
        colors.statusbar.passthrough.bg = config.colors.macchiato.yellow.hex;

        # Foreground color of the statusbar in passthrough mode.
        colors.statusbar.passthrough.fg = config.colors.macchiato.base.hex;

        # Background color of the statusbar in private browsing mode.
        colors.statusbar.private.bg = config.colors.macchiato.surface1.hex;

        # Foreground color of the statusbar in private browsing mode.
        colors.statusbar.private.fg = config.colors.macchiato.subtext0.hex;

        # Background color of the progress bar.
        colors.statusbar.progress.bg = config.colors.macchiato.base.hex;

        # Foreground color of the URL in the statusbar on error.
        colors.statusbar.url.error.fg = config.colors.macchiato.red.hex;

        # Default foreground color of the URL in the statusbar.
        colors.statusbar.url.fg = config.colors.macchiato.text.hex;

        # Foreground color of the URL in the statusbar for hovered links.
        colors.statusbar.url.hover.fg = config.colors.macchiato.teal.hex;

        # Foreground color of the URL in the statusbar on successful load
        colors.statusbar.url.success.http.fg = config.colors.macchiato.sapphire.hex;

        # Foreground color of the URL in the statusbar on successful load
        colors.statusbar.url.success.https.fg = config.colors.macchiato.sapphire.hex;

        # Foreground color of the URL in the statusbar when there's a warning.
        colors.statusbar.url.warn.fg = config.colors.macchiato.yellow.hex;

        # Background color of the tab bar.
        # Type: QtColor
        colors.tabs.bar.bg = config.colors.macchiato.surface1.hex;

        # Background color of unselected even tabs.
        # Type: QtColor
        colors.tabs.even.bg = config.colors.macchiato.surface1.hex;

        # Foreground color of unselected even tabs.
        # Type: QtColor
        colors.tabs.even.fg = config.colors.macchiato.text.hex;

        # Color for the tab indicator on errors.
        # Type: QtColor
        colors.tabs.indicator.error = config.colors.macchiato.red.hex;

        # Color gradient start for the tab indicator.
        # Type: QtColor
        colors.tabs.indicator.start = config.colors.macchiato.yellow.hex;

        # Color gradient end for the tab indicator.
        # Type: QtColor
        colors.tabs.indicator.stop = config.colors.macchiato.sapphire.hex;

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
        colors.tabs.odd.bg = config.colors.macchiato.surface1.hex;

        # Foreground color of unselected odd tabs.
        # Type: QtColor
        colors.tabs.odd.fg = config.colors.macchiato.text.hex;

        #  Background color of selected even tabs.
        #  Type: QtColor
        colors.tabs.selected.even.bg = config.colors.macchiato.sapphire.hex;

        #  Foreground color of selected even tabs.
        #  Type: QtColor
        colors.tabs.selected.even.fg = config.colors.macchiato.text.hex;

        #  Background color of selected odd tabs.
        #  Type: QtColor
        colors.tabs.selected.odd.bg = config.colors.macchiato.sapphire.hex;

        # # Foreground color of selected odd tabs.
        # # Type: QtColor
        colors.tabs.selected.odd.fg = config.colors.macchiato.text.hex;
      };
    };
  };
}
