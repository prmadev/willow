{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland.override {
      # See nixpkgs' firefox/wrapper.nix to check which options you can use
      cfg = {
        # Tridactyl native connector
        enableTridactylNative = true;
      };
    };
  };
}
