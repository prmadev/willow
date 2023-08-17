{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.pinentry.enable = mkEnableOption "pinentry settings";

  config = mkIf config.pinentry.enable {
    home.file.fuzzpin = {
      enable = true;
      executable = true;
      source = let
        fuzzel = "${pkgs.fuzzel}/bin/fuzzel";
        gum = "${pkgs.gum}/bin/gum";
      in
        pkgs.writeShellScript "fuzzpin" ''
          fuzz=$( ${fuzzel} --dmenu --password  --log-level=none)

          info_tag=$(${gum} style  "[INFO]" --bold --background=6 --foreground=16)
          errr_tag=$(${gum} style  "[ERRR]" --bold --background=3 --foreground=16)
          succ_tag=$(${gum} style  "[SUCC]" --bold --background=2 --foreground=16)
          warn_tag=$(${gum} style  "[WARN]" --bold --background=3 --foreground=16)

          echo "$info_tag $(${gum} style "Ok Go ahead." --italic)"

        '';
      target = ".local/bin/fuzzpin";
    };
  };
}
