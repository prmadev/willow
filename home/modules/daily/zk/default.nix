{
  inputs,
  pkgs ? (
    let
      sources = import ./nix/sources.nix;
    in
      import sources.nixpkgs {
        overlays = [
          (import "${sources.gomod2nix}/overlay.nix")
        ];
      }
  ),
}:
pkgs.buildGoApplication {
  pname = "zk";
  version = "0.11.0";
  pwd = input.zk;
  src = inputs.zk;
  modules = ./gomod2nix.toml;
}
