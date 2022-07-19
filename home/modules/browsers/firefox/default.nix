{pkgs, ...}: {
  programs.firefox = {
    # TODO customize it!
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
