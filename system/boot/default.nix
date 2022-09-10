{
  config,
  pkgs,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  # boot.loader.systemd-boot.configurationLimit = 120;
  # boot.loader.generationsDir.enable = true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    # grub = {
    #   enable = true;
    #   device = "nodev";
    #   splashMode = "normal";
    #   efiSupport = true;
    #   backgroundColor = "#1e1e2e";
    #   # efiInstallAsRemovable = true;
    # };
  };
  boot.blacklistedKernelModules = [
    # Obscure network protocols
    "ax25"
    "netrom"
    "rose"
    # Old or rare or insufficiently audited filesystems
    "adfs"
    "affs"
    "bfs"
    "befs"
    "cramfs"
    "efs"
    "erofs"
    "exofs"
    "freevxfs"
    "f2fs"
    "vivid"
    "gfs2"
    "ksmbd"
    "nfsv4"
    "nfsv3"
    "cifs"
    "nfs"
    "cramfs"
    "freevxfs"
    "jffs2"
    "hfs"
    "hfsplus"
    "squashfs"
    "udf"
    "bluetooth"
    "btusb"
    "uvcvideo" # webcam
    "hpfs"
    "jfs"
    "minix"
    "nilfs2"
    "omfs"
    "uvcvideo"
    "qnx4"
    "qnx6"
    "sysv"
    "ufs"
  ];
}
