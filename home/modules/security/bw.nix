{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    bw.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.bw.enable {
    programs.rbw = {
      enable = true;
      settings = {
        email = "amirhossein.alesheikh@gmail.com";
        pinentry = "gtk2";
      };
    };

    home.sessionVariables = {
      BW_CLIENTSECRET = "1YnJyztT6fzD0mmvioFlq3jXoJ23Np";
      BW_SESSION = "l4fWgy4H9vCjf9LN8pmqWjfVdXRFrthUyP/KhSuww/AgxwTtkgWDQCwF/vTWOIc2rT9efPizQoJsKZ/kdKYaGQ==";
    };
  };
}
