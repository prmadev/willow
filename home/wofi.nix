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
            background-color: ${config.colors.moon.base.hex};
           }

          #text {
            color:${config.colors.moon.text.hex};
            font-size: 20px;
          }

          #input{
            background-color: ${config.colors.moon.base.hex};
            color:${config.colors.moon.text.hex};
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
            background-color : ${config.colors.moon.love.hex};
            color:${config.colors.moon.base.hex};

          }

          #entry:selected{
            color:${config.colors.moon.base.hex};
            background-color : ${config.colors.moon.love.hex};
          }

          #text:selected{
            color:${config.colors.moon.base.hex};
            background-color : ${config.colors.moon.love.hex};
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
