{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11";

  nix = {
    gc.randomizedDelaySec = "10min";
    # for the initial setup of flakes
    # package = pkgs.nixVersions.stable;
    extraOptions = "experimental-features = nix-command flakes";
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      system-features = ["recursive-nix" "big-parallel" "flakes"];
      warn-dirty = false;
      trusted-users = ["root" "a" "@wheel"];
      connect-timeout = 10;
      download-attempts = 10;
      stalled-download-timeout = 30;
      fallback = true;
      http-connections = 32;
      keep-going = true; #internet is shitty here. it will help keep the bugs away.
      max-jobs = 2;
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org"
        "https://neovim-nightly.cachix.org"
        "https://helix.cachix.org"
        "https://devenv.cachix.org"
        "https://crane.cachix.org"

        "https://cache.iog.io"
      ];
      trusted-public-keys = [
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "neovim-nightly.cachix.org-1:feIoInHRevVEplgdZvQDjhp11kYASYCE2NGY9hNrwxY="
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "crane.cachix.org-1:8Scfpmn9w+hGdXH/Q9tTLiYAE/2dnJYRJP7kl80GuRk="
      ];
    };
  };

  environment.defaultPackages = with pkgs; [
    rsync
    strace
    vim

    # neovim-nightly
  ];

  systemd = {
    services.nix-daemon = {
      environment.TMPDIR = "/nix/tmp";
    };

    tmpfiles.rules = [
      "d /nix/tmp 0755 root root 1d"
    ];
    # Create a separate slice for nix-daemon that is
    # memory-managed by the userspace systemd-oomd killer
    slices."nix-daemon".sliceConfig = {
      ManagedOOMMemoryPressure = "kill";
      ManagedOOMMemoryPressureLimit = "50%";
    };
    services."nix-daemon".serviceConfig.Slice = "nix-daemon.slice";

    # If a kernel-level OOM event does occur anyway,
    # strongly prefer killing nix-daemon child processes
    services."nix-daemon".serviceConfig.OOMScoreAdjust = 1000;
  };
}
