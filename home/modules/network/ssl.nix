{
  pkgs,
  libs,
  ...
}: {
  config = {
    files.json."~/generated/hello.json".hello = "world";
  };
}
