{
  config,
  pkgs,
  ...
}: {
  fonts.packages = with pkgs; [
    vazir-fonts # may FSM rest his soul. He was a good man.

    recursive
    commit-mono
    maple-mono-otf
    cascadia-code
    martian-mono

    pixel-code # BIP..BOOP..BIP..BOP!

    # thanks github, you are shit but I take these:
    mona-sans
    monaspace
    hubot-sans

    # RedHat has managed to make the most boring font ever,
    # Thanks for a great resume font, Redhat!
    redhat-official-fonts

    # iconic!
    maple-mono-NF
    material-design-icons
    (nerdfonts.override {fonts = ["JetBrainsMono" "CascadiaCode" "DaddyTimeMono"];})
  ];
  fonts = {
    # enableDefaultFonts = true; # just to see if it helps with faulty characters.
    fontconfig = {
      defaultFonts = {
        serif = config.global-fonts.sans-set;
        sansSerif = config.global-fonts.sans-set;
        monospace = config.global-fonts.main-set;
      };
    };
  };
}
