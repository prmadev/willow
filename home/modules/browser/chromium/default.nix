{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "ihlenndgcmojhcghmfjfneahoeklbjjh" # cVim
      "dhdgffkkebhmkfjojejmpbldmpobfkfo" # Tampermonkey
      "icpgjfneehieebagbmdbhnlpiopdcmna" # New Tab Redirect
    ];
  };
}
