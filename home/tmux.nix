{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.tmux = {
    enable = mkEnableOption "tmux";
    autorun = mkEnableOption "autorun tmux";
    shell = mkOption {
      type = types.str;
      default = config.shell.user;
    };
  };

  config = mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      terminal = "tmux-256color";
      historyLimit = 10000;
      escapeTime = 0;
      mouse = true;
      shell = config.tmux.shell;
      sensibleOnTop = true;
      keyMode = "vi";
      prefix = "C-Space";
      extraConfig = let
        nextToggle = ''bind-key  -n C-\\ next-window'';
        newWindow = ''bind-key  -n C-n next-window'';
        killSession2 = ''bind-key   C-k kill-session'';
        killSession = ''bind-key -n  C-k kill-session'';
        horPane = ''bind | split-window -h -c "#{pane_current_path}"'';
        verPane = ''bind - split-window -v -c "#{pane_current_path}"'';
        newWin = ''bind c new-window -c "#{pane_current_path}"'';
        newPrefix = ''bind C-Space send-prefix'';
        willowBinding = ''bind -n M-w new-session -A -s willow "smug willow -a"'';
      in
        builtins.concatStringsSep "\n" [nextToggle horPane verPane newWin newWindow killSession2 killSession newPrefix willowBinding];

      plugins = with pkgs; [
        tmuxPlugins.open
        {
          plugin = tmuxPlugins.tmux-fzf;
          extraConfig = ''TMUX_FZF_LAUNCH_KEY="C-f"'';
        }
        # {
        #   plugin = tmuxPlugins.catppuccin;
        #   extraConfig = "set -g @catppuccin_flavour 'macchiato'\n" + "set -g @catppuccin_window_tabs_enabled on" + "\n" + "set -g @catppuccin_window_right_separator \"█ \"" + "\n" + "set -g @catppuccin_status_left_separator \"█\"" + "\n" + "set -g @catppuccin_status_right_separator \"█\"" + "\n";
        # }
        {
          plugin = tmuxPlugins.rose-pine;
          extraConfig = ''
            set -g @rose_pine_variant 'moon'

            set -g @rose_pine_host 'on' # Enables hostname in the status bar
            set -g @rose_pine_date_time "" # It accepts the date UNIX command format (man date for info)
            set -g @rose_pine_user 'on' # Turn on the username component in the statusbar
            set -g @rose_pine_directory 'on' # Turn on the current folder component in the status bar
            set -g @rose_pine_bar_bg_disable 'on' # Disables background color, for transparent terminal emulators
            # If @rose_pine_bar_bg_disable is set to 'on', uses the provided value to set the background color
            # It can be any of the on tmux (named colors, 256-color set, `default` or hex colors)
            # See more on http://man.openbsd.org/OpenBSD-current/man1/tmux.1#STYLES
            set -g @rose_pine_bar_bg_disabled_color_option 'default'

            set -g @rose_pine_only_windows 'on' # Leaves only the window module, for max focus and space
            set -g @rose_pine_disable_active_window_menu 'on' # Disables the menu that shows the active window on the left

            set -g @rose_pine_default_window_behavior 'on' # Forces tmux default window list behaviour
            set -g @rose_pine_show_current_program 'on' # Forces tmux to show the current running program as window name
            set -g @rose_pine_show_pane_directory 'on' # Forces tmux to show the current directory as window name
            # Previously set -g @rose_pine_window_tabs_enabled

            # Example values for these can be:
            set -g @rose_pine_left_separator ' > ' # The strings to use as separators are 1-space padded
            set -g @rose_pine_right_separator ' < ' # Accepts both normal chars & nerdfont icons
            set -g @rose_pine_field_separator ' | ' # Again, 1-space padding, it updates with prefix + I

            # These are not padded
            set -g @rose_pine_session_icon '' # Changes the default icon to the left of the session name
            set -g @rose_pine_current_window_icon '' # Changes the default icon to the left of the active window name
            set -g @rose_pine_folder_icon '' # Changes the default icon to the left of the current directory folder
            set -g @rose_pine_username_icon '' # Changes the default icon to the right of the hostname
            set -g @rose_pine_hostname_icon '󰒋' # Changes the default icon to the right of the hostname
            set -g @rose_pine_date_time_icon '󰃰' # Changes the default icon to the right of the date module
            set -g @rose_pine_window_status_separator "  " # Changes the default icon that appears between window names

            # Very beta and specific opt-in settings, tested on v3.2a, look at issue #10
            set -g @rose_pine_prioritize_windows 'on' # Disables the right side functionality in a certain window count / terminal width
            set -g @rose_pine_width_to_hide '80' # Specify a terminal width to toggle off most of the right side functionality
            set -g @rose_pine_window_count '5' # Specify a number of windows, if there are more than the number, do the same as width_to_hide
          '';
        }
        {
          plugin = tmuxPlugins.yank;
          extraConfig = let
            beginSelection = "bind-key -T copy-mode-vi v send-keys -X begin-selection";
            rectangleToggle = "bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle";
            copySelectionAndCancel = "bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel";
          in
            builtins.concatStringsSep "\n" [beginSelection rectangleToggle copySelectionAndCancel];
        }
        tmuxPlugins.tmux-thumbs
      ];
    };

    home.packages = with pkgs; [
      smug
      tmux-sessionizer
      twm
    ];

    home.file = let
      codeWindow = {commandPrefix ? []}: {
        name = " code";
        commands = commandPrefix ++ ["hx ."];
        layout = "main-horizontal";
      };

      terminalWindow = {commandPrefix ? []}: {
        name = "  terminal";
        commands =
          commandPrefix
          ++ [
            "git status"
            "ls"
          ];
      };
      fileManagerWindow = {
        name = " files";
        commands = ["lf"];
      };

      goLogsWindow = {
        name = " logs";
        commands = [
          "nix-shell -p clang golangci-lint hwatch"
          # "hwatch -c -n 10  go build"
        ];
        panes = [
          {
            commands = [
              "nix-shell -p clang golangci-lint hwatch"
              # "hwatch -c -n 10 golangci-lint run"
            ];
          }
        ];
      };

      cargoLogWindow = {
        name = " logs";
        commands = [
          "cargo update"
          "cargo fetch"
          "cargo test"
          "cargo clippy --workspace --all-targets --all-features"
          "cargo watch --exec  \"clippy --workspace --all-targets --all-features\""
        ];
      };

      zolaServeWindow = {
        name = " serving";
        commands = ["zola serve"];
      };
    in {
      "soapberry.yml" = with lib; {
        target = ".config/smug/soapberry.yml";
        text =
          generators.toYAML {}
          {
            session = "soapberry ";
            root = "~/kapa/pro/soapberry";
            windows = [
              (codeWindow {})
              (terminalWindow {})
              fileManagerWindow
              cargoLogWindow
            ];
          };
      };

      "aero-core.yml" = with lib; {
        target = ".config/smug/aero-core.yml";
        text =
          generators.toYAML {}
          {
            session = "aero-core ";
            root = "~/kapa/pro/asanbilit/asanbilit-core/src";
            windows = [
              (codeWindow {commandPrefix = ["nix-shell -p clang golangci-lint"];})
              (terminalWindow {commandPrefix = ["nix-shell -p clang golangci-lint"];})
              fileManagerWindow
              goLogsWindow
            ];
          };
      };

      "aero-unified.yml" = with lib; {
        target = ".config/smug/aero-unified.yml";
        text =
          generators.toYAML {}
          {
            session = "aero-unified ";
            root = "~/kapa/pro/asanbilit/unified-aero/src";
            windows = [
              (codeWindow {commandPrefix = ["nix-shell -p clang golangci-lint"];})
              (terminalWindow {commandPrefix = ["nix-shell -p clang golangci-lint"];})
              fileManagerWindow
              goLogsWindow
            ];
          };
      };

      "willow.yml" = with lib; {
        target = ".config/smug/willow.yml";
        text =
          generators.toYAML {}
          {
            session = "willow ";
            root = "~/willow/";
            windows = [
              (codeWindow {})
              (terminalWindow {})
              fileManagerWindow
            ];
          };
      };

      "blog.yml" = with lib; {
        target = ".config/smug/blog.yml";
        text =
          generators.toYAML {}
          {
            session = "blog ";
            root = "~/kapa/pro/2022-11-16-amirography_com/amirography/";
            windows = [
              (codeWindow {})
              zolaServeWindow
              (terminalWindow {})
              fileManagerWindow
            ];
          };
      };

      "nvim.yml" = with lib; {
        target = ".config/smug/nvim.yml";
        text =
          generators.toYAML {}
          {
            session = "nvim";
            root = "~/.config/nvim/";
            windows = [
              (codeWindow {commandPrefix = ["nix-shell -p clang"];})
              (terminalWindow {commandPrefix = ["nix-shell -p clang"];})
              fileManagerWindow
            ];
          };
      };

      "proxy.yml" = with lib; {
        target = ".config/smug/proxy.yml";
        text =
          generators.toYAML {}
          {
            session = "proxy ";
            root = "~";
            windows = [
              {
                name = "v2ray";
                commands = ["v2ray run -c ~/vless-hackap.json"];
              }
              {
                name = "arti";
                commands = ["arti proxy"];
              }
            ];
          };
      };

      "jafam-auth.yml" = with lib; {
        target = ".config/smug/jafam-auth.yml";
        text =
          generators.toYAML {}
          {
            session = "jafam-auth ";
            root = "~/kapa/pro/jafam2/auth/";
            windows = [
              (codeWindow {commandPrefix = [];})
              (terminalWindow {commandPrefix = [];})
              fileManagerWindow
            ];
          };
      };

      "jafam-entry.yml" = with lib; {
        target = ".config/smug/jafam-entry.yml";
        text =
          generators.toYAML {}
          {
            session = "jafam-entry ";
            root = "~/kapa/pro/jafam2/entry/";
            windows = [
              (codeWindow {commandPrefix = [];})
              (terminalWindow {commandPrefix = [];})
              fileManagerWindow
            ];
          };
      };

      "jafam-models.yml" = with lib; {
        target = ".config/smug/jafam-models.yml";
        text =
          generators.toYAML {}
          {
            session = "jafam-models ";
            root = "~/kapa/pro/jafam2/models/";
            windows = [
              (codeWindow {commandPrefix = [];})
              (terminalWindow {commandPrefix = [];})
              fileManagerWindow
            ];
          };
      };

      "jafam-rbac.yml" = with lib; {
        target = ".config/smug/jafam-rbac.yml";
        text =
          generators.toYAML {}
          {
            session = "jafam-rbac ";
            root = "~/kapa/pro/jafam2/rbac/";
            windows = [
              (codeWindow {commandPrefix = [];})
              (terminalWindow {commandPrefix = [];})
              fileManagerWindow
            ];
          };
      };

      "jafam-redisHelper.yml" = with lib; {
        target = ".config/smug/jafam-redisHelper.yml";
        text =
          generators.toYAML {}
          {
            session = "jafam-redisHelper ";
            root = "~/kapa/pro/jafam2/redisHelper/";
            windows = [
              (codeWindow {commandPrefix = [];})
              (terminalWindow {commandPrefix = [];})
              fileManagerWindow
            ];
          };
      };

      "jafam-session.yml" = with lib; {
        target = ".config/smug/jafam-session.yml";
        text =
          generators.toYAML {}
          {
            session = "jafam-session ";
            root = "~/kapa/pro/jafam2/session/";
            windows = [
              (codeWindow {commandPrefix = [];})
              (terminalWindow {commandPrefix = [];})
              fileManagerWindow
            ];
          };
      };

      "jafam-user.yml" = with lib; {
        target = ".config/smug/jafam-user.yml";
        text =
          generators.toYAML {}
          {
            session = "jafam-user ";
            root = "~/kapa/pro/jafam2/user/";
            windows = [
              (codeWindow {commandPrefix = [];})
              (terminalWindow {commandPrefix = [];})
              fileManagerWindow
            ];
          };
      };
    };
  };
}
