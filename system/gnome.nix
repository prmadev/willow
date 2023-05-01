{pkgs, ...}: {
  services = {
    xserver = {
      displayManager = {
        gdm.enable = true;
        session = [
          {
            manage = "desktop";
            name = "Riverwm";
            start = ''
              ${pkgs.river}/bin/river &
              waitPID=$!
            '';
          }
          {
            manage = "desktop";
            name = "Hyperland";
            start = ''
              Hyperland &
              waitPID=$!
            '';
          }
        ];
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
  };

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      gnome-tour
    ])
    ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gnome-terminal
      gedit # text editor
      epiphany # web browser
      geary # email reader
      evince # document viewer
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      yelp
      gnome-contacts
      gnome-initial-setup
    ]);
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
  ];
}
