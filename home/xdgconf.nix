{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.xdgconf.enable = mkEnableOption "xdg config settings";

  config = mkIf config.xdgconf.enable {
    home.file.".icons/default/index.theme".text = ''
      [icon theme]
      Inherits=phinger-cursors
    '';
    home.packages = with pkgs; [xdg-utils];
    xdg = {
      enable = true;
      mime.enable = true;
      userDirs.enable = true;
      desktopEntries = {
        hx = {
          name = "Helix";
          genericName = "Text Editor";
          exec = "hx %F";
          terminal = true;
          type = "Application";
          categories = ["Application" "TextEditor" "Utility"];
          mimeType = [
            "text/plain" # Plain text files
            "text/x-csrc" # C source code
            "text/x-chdr" # C header files
            "text/x-c++src" # C++ source code
            "text/x-c++hdr" # C++ header files
            "text/x-java" # Java source code
            "text/x-python" # Python source code
            "text/x-shellscript" # Shell script files
            "text/html" # HTML files
            "text/xml" # XML files
            "text/markdown" # Markdown files
            "text/css" # Cascading Style Sheets (CSS) files
            "text/javascript" # JavaScript files
            "application/json" # JSON files
            "application/xml" # XML files (alternative MIME type)
            "application/javascript" # JavaScript files (alternative MIME type)
            "text/english" # English text files
            "text/x-makefile" # Makefile scripts
            "text/x-tex" # TeX files
            "application/x-shellscript" # Shell script files (alternative MIME type)
            "text/x-rust" # Rust source code
            "text/x-go-source" # Go source code
            "text/x-php" # PHP source code
            "text/x-perl" # Perl source code
            "text/x-ruby" # Ruby source code
            "text/x-swift" # Swift source code
            "text/x-matlab" # MATLAB source code
            "text/x-haskell" # Haskell source code
            "text/x-lua" # Lua source code
            "text/x-scala" # Scala source code
            "text/x-kotlin" # Kotlin source code
            "text/x-pascal" # Pascal source code
            "text/x-tcl" # Tcl source code
            "text/x-lisp" # Lisp source code
            "text/x-scheme" # Scheme source code
            "text/x-fortran" # Fortran source code
            "text/x-clojure" # Clojure source code
            "text/x-erlang" # Erlang source code
            "text/x-yaml" # YAML files
            "text/x-diff" # Unified Diff format
            "text/x-prolog" # Prolog source code
            "text/x-ada" # Ada source code
            "text/x-sql" # SQL files
            "text/x-groovy" # Groovy source code
            "text/x-csharp" # C# source code
            "text/x-dart" # Dart source code
            "text/x-coffeescript" # CoffeeScript source code
            "text/x-ocaml" # OCaml source code
            "text/x-mumps" # MUMPS source code
            "text/x-fsharp" # F# source code
            "text/x-powershell" # PowerShell scripts
            "text/x-elm" # Elm source code
            "text/x-julia" # Julia source code
            "text/x-dlang" # D programming language source code
            "text/x-fasm" # Flat Assembly source code
            "text/x-nim" # Nim source code
            "text/x-turing" # Turing source code
            "text/x-zig" # Zig source code
            "text/x-cobol" # COBOL source code
            "text/x-lilypond" # LilyPond source code
            "text/x-verilog" # Verilog source code
            "text/x-vhdl" # VHDL source code
            "text/x-haxe" # Haxe source code
            "text/x-freemarker" # FreeMarker templates
            "text/x-smali" # Smali code
            "text/x-vbnet" # Visual Basic .NET source code
            "text/x-lsl" # Linden Scripting Language (LSL) code
            "text/x-eiffel" # Eiffel source code
            "text/x-ada" # Ada source code
            "text/x-latte" # Latte templating engine
            "text/x-jsp" # JavaServer Pages (JSP) code
          ];
        };
      };

      # userDirs.createDirectories = true;

      mimeApps = {
        enable = true;
        associations = {
          added = {
            "x-scheme-handler/tg" = ["org.telegram.desktop.desktop"];
            "text/plain" = ["hx.desktop" "nvim.desktop"];
          };
        };
        defaultApplications = let
          browser = ["firefox.desktop"];
          pdfViewer = ["org.pwmt.zathura.desktop" "firefox.desktop"];
          textEditor = ["Helix.desktop" "nvim.desktop"];
          imageViewer = ["imv.desktop"];
          videoPlayer = ["mpv.desktop"];
          audioPlayer = ["mpv.desktop"];
          terminal = ["org.wezfurlong.wezterm.desktop"];
        in {
          "x-scheme-handler/http" = browser;
          "x-scheme-handler/https" = browser;
          "application/xhtml+xml" = browser;
          "text/html" = browser;
          "text/xml" = browser;
          "application/xml" = browser;
          "application/xhtml_xml" = browser;
          "application/rdf+xml" = browser;
          "application/rss+xml" = browser;
          "application/x-extension-htm" = browser;
          "application/x-extension-html" = browser;
          "application/x-extension-shtml" = browser;
          "application/x-extension-xht" = browser;
          "application/x-extension-xhtml" = browser;

          "x-scheme-handler/about" = browser;
          "x-scheme-handler/ftp" = browser;
          "x-scheme-handler/unknown" = browser;
          "application/pdf" = pdfViewer;
          "application/json" = textEditor;
          "text/plain" = textEditor;

          "audio/*" = audioPlayer;

          "video/*" = videoPlayer;
          "image/*" = imageViewer;
          "image/gif" = imageViewer;
          "image/jpeg" = imageViewer;
          "image/png" = imageViewer;
          "image/webp" = imageViewer;
          "image/bmp" = imageViewer;
          "image/jpg" = imageViewer;
          "image/pjpeg" = imageViewer;
          "image/tiff" = imageViewer;
          "image/x-bmp" = imageViewer;
          "image/x-gray" = imageViewer;
          "image/x-icb" = imageViewer;
          "image/x-ico" = imageViewer;
          "image/x-png" = imageViewer;
          "image/x-portable-anymap" = imageViewer;
          "image/x-portable-bitmap" = imageViewer;
          "image/x-portable-graymap" = imageViewer;
          "image/x-portable-pixmap" = imageViewer;
          "image/x-xbitmap" = imageViewer;
          "image/x-xpixmap" = imageViewer;
          "image/x-pcx" = imageViewer;
          "image/svg+xml" = imageViewer;
          "image/svg+xml-compressed" = imageViewer;
          "image/vnd.wap.wbmp" = imageViewer;
          "image/x-icns" = imageViewer;

          "x-scheme-handler/terminal" = terminal;
          "x-scheme-handler/tg" = ["org.telegram.desktop.desktop" "telegramdesktop.desktop"];
          "x-scheme-handler/discord" = ["discord.desktop"];
        };
      };
    };
  };
}
