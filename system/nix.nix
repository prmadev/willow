{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11";

  nix = {
    # for the initial setup of flakes
    package = pkgs.nixVersions.stable;
    extraOptions = "experimental-features = nix-command flakes";
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      system-features = ["recursive-nix"];
      trusted-users = ["root" "a" "@wheel"];
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org"
        "https://neovim-nightly.cachix.org"
        "https://hyprland.cachix.org"
        "https://helix.cachix.org"
        "https://devenv.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "neovim-nightly.cachix.org-1:feIoInHRevVEplgdZvQDjhp11kYASYCE2NGY9hNrwxY="
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
    };
  };

  environment.defaultPackages = with pkgs; [
    rsync
    strace
    vim

    # neovim-nightly
  ];

  systemd.services.nix-daemon = {
    environment.TMPDIR = "/nix/tmp";
  };

  systemd.tmpfiles.rules = [
    "d /nix/tmp 0755 root root 1d"
  ];
}
