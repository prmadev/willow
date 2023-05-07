{
  lib,
  config,
  ...
}:
with lib; {
  options.chrome.enable = mkEnableOption "chrome settings";

  config = mkIf config.chrome.enable {
    programs.chromium = {
      enable = false;
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        # "dhdgffkkebhmkfjojejmpbldmpobfkfo" # Tampermonkey
        "cojpndognjdcakkimaloeealehpkljna" # caretTab
        # "gjnmgffpgcigkfipakdijeonkoelhcdh" # rose pine
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
        "nngceckbapebfimnlniiiahkandclblb" # bitwarden
        "padekgcemlokbadohgkifijomclgjgif" # SwitchyOmega
        # "ennpfpdlaclocpomkiablnmbppdnlhoh" # rust search engine
      ];
      commandLineArgs = ["--ozone-platform-hint=auto" "--gtk-version=4"];
    };
  };
}
