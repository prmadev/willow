{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.gleam.enable = mkEnableOption "gleam settings";
  config = mkIf config.gleam.enable {
    home.packages = with pkgs; [
      gleam
      erlang_26
      rebar3
    ];
  };
}
