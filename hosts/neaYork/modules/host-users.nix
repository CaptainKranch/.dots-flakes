{
  ...
}:
#############################################################
#
#  Host & Users configuration
#
#############################################################
{
  networking.hostName = "neayork";
  networking.computerName = "neayork";
  system.defaults.smb.NetBIOSName = "neayork";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."dgm" = {
    home = "/Users/dgm";
    description = "dgm";
  };

  nix.settings.trusted-users = [ "dgm" ];
}
