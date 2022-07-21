{
  lib,
  fetchFromGitHub,
  buildGoModule,
  icu,
  ...
}:
buildGoModule rec {
  pname = "zkme";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "mickael-menu";
    repo = "zk";
    rev = "v0.9.0";
    sha256 = "sha256-AXKIi70evf581lMwfbfxm8hFCzsnhKRQgnIEZQFS75A=";
  };

  vendorSha256 = "sha256-m7QGv8Vx776TsN7QHXtO+yl3U1D573UMZVyg1B4UeIk=";

  doCheck = false;

  buildInputs = [icu];

  CGO_ENABLED = 1;

  ldflags = ["-s" "-w" "-X=main.Build=0.9.0"];

  tags = ["fts5" "icu"];
}
