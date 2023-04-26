{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.rofi.enable = mkEnableOption "rofi settings";

  config = mkIf config.rofi.enable {
    programs.rofi = {
      enable = true;
      font = config.global-fonts.main-family + " 10";
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          bg = mkLiteral config.colors.macchiato.surface0.hex;
          fg = mkLiteral config.colors.macchiato.text.hex;
          button = mkLiteral config.colors.macchiato.surface0.hex;
          background-color = mkLiteral config.colors.macchiato.surface0.hex;
          text-color = mkLiteral config.colors.macchiato.text.hex;
        };

        window = {
          border-radius = mkLiteral "0px";
          width = mkLiteral "20%";
          y-offset = mkLiteral "00px";
          padding = mkLiteral "0px 0px 0px 0px";
          location = 0;
        };

        prompt = {
          enabled = false;
        };

        entry = {
          placeholder = "";
          expand = true;
          padding = mkLiteral "5px 5px 5px 5px";
          background-color = mkLiteral config.colors.macchiato.surface0.hex;
          placeholder-color = mkLiteral config.colors.macchiato.surface0.hex;
          text-color = mkLiteral config.colors.macchiato.text.hex;
          font = "monospace Bold 10";
        };

        inputbar = {
          children = map mkLiteral ["prompt" "entry"];
          background-color = mkLiteral config.colors.macchiato.surface0.hex;
          text-color = mkLiteral config.colors.macchiato.peach.hex;
          expand = false;
          border-radius = mkLiteral "0px";
          border = mkLiteral "5px 1px 1px 5px solid";
          border-color = mkLiteral config.colors.macchiato.peach.hex;
          padding = mkLiteral "5px";
          font = "monospace Bold 10";
        };

        listview = {
          columns = 1;
          lines = 12;
          cycle = true;
          dynamic = false;
          layout = mkLiteral "vertical";
        };

        mainbox = {
          children = map mkLiteral ["inputbar" "listview"];
          spacing = mkLiteral "0px";
          padding = mkLiteral "0px 0px 0px 0px";
        };

        element = {
          orientation = mkLiteral "vertical";
          border-radius = mkLiteral "0px";
          padding = mkLiteral "5px 5px 5px 5px";
          text-color = mkLiteral config.colors.macchiato.subtext0.hex;
          margin = mkLiteral "5px";
        };

        element-text = {
          expand = true;
          vertical-align = mkLiteral "0.5";
          margin = mkLiteral "5px 5px 5px 5px";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          font = "monospace 10";
        };

        "element selected" = {
          border = mkLiteral "5px 1px 1px 5px solid";
          border-color = mkLiteral config.colors.macchiato.sapphire.hex;
          background-color = mkLiteral config.colors.macchiato.surface0.hex;
          text-color = mkLiteral config.colors.macchiato.blue.hex;
          border-radius = mkLiteral "0px";
          margin = mkLiteral "0px";
          font = "monospace Bold 10";
        };
      };
      package = pkgs.rofi-wayland;
    };
    home.packages = with pkgs; [
      rofi-rbw # for password management
    ];
  };
}
