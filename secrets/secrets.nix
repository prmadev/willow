let
  age-a = "age1hnc23x6k0rmk0h7ltt7dl6k0sysh7nc8jdrldj0a5gmlhz0le54qh7dh3g";
  ed-a = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINcBDTA7boswVp7XXIqLo6tZvy2zB5zkTqWdn52DWxac";
in {
  "bwid.age".publicKeys = [ed-a];
  "bwsec.age".publicKeys = [ed-a];
}
