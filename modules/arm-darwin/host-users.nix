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
    home = "/Users/danielgm";
    description = "danielgm";
  };

  nix.settings.trusted-users = [ "danielgm" ];
}
