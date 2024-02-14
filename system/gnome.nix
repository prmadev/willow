{pkgs, ...}: {
  services = {
    xserver = {
      displayManager = {
        gdm.enable = false;
        session = [
          {
            manage = "desktop";
            name = "Riverwm";
            start = ''
              ${pkgs.river}/bin/river &
              waitPID=$!
            '';
          }
        ];
      };
      desktopManager = {
        gnome = {
          enable = false;
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
