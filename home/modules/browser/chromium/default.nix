{...}: {
  programs.chromium = {
    enable = false;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "dhdgffkkebhmkfjojejmpbldmpobfkfo" # Tampermonkey
      "cojpndognjdcakkimaloeealehpkljna" # caretTab
      "gjnmgffpgcigkfipakdijeonkoelhcdh" # rose pine
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "padekgcemlokbadohgkifijomclgjgif" # SwitchyOmega
      "ennpfpdlaclocpomkiablnmbppdnlhoh" # rust search engine
    ];
  };
}
