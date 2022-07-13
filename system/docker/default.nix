{
  config,
  pkgs,
  ...
}: {
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless.enable = true;
}
