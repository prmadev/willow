{
  config,
  lib,
  ...
}:
with lib; {
  options.wofi.enable = mkEnableOption "wofi settings";

  config = mkIf config.wofi.enable {
    programs.wofi = {
      enable = true;
      settings = {
        term = "foot";
        insensitive = true;
        gtk_dark = true;
        show = "drun";
        width = "30%";
        height = "80%";
        prompt = "";
        normal_window = false;
        hide_scroll = true;
      };
      style = let
        fontAll = ''
          * {
            font-family: monospace;
          }
        '';
        inputStyle = ''
          window {
            background-color: ${config.colors.macchiato.base.hex};
           }

          #text {
            color:${config.colors.macchiato.text.hex};
            font-size: 20px;
          }

          #input{
            background-color: ${config.colors.macchiato.base.hex};
            color:${config.colors.macchiato.text.hex};
            font-size: 25px;
            border: 0px none;
          }



          #img {

          }

          #outer-box{

          }

          #inner-box{

          }

          #scroll{

          }

          #unselected{

          }

          #selected{
            background-color : ${config.colors.macchiato.red.hex};
            color:${config.colors.macchiato.base.hex};

          }

          #entry:selected{
            color:${config.colors.macchiato.base.hex};
            background-color : ${config.colors.macchiato.red.hex};
          }

          #text:selected{
            color:${config.colors.macchiato.base.hex};
            background-color : ${config.colors.macchiato.red.hex};
            font-family: ${config.global-fonts.main-black};
          }

          #entry{

          }
        '';
      in
        fontAll + inputStyle;
    };
  };
}
