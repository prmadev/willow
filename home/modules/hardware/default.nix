{pkgs, ...}: {
  # imports = [./modules/];
  home.keyboard.layout = "us,ir";
  home.keyboard.options = ["grp:alt_shift_toggle"];
  home.packages = with pkgs; [
    pavucontrol
    playerctl
    pulsemixer
	ntfs3g
  ];
}
