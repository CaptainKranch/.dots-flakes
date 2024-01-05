{ config, pkgs, ... }:

{
  systemd.services.sunshine = {
    description = "Sunshine Game Streaming Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.sunshine}/bin/sunshine";
      User = "danielgm"; # Replace with your user
      Restart = "always";
    };
    preStart = ''
      # Optional: Add any pre-start commands here
    '';
    environment = {
      # Optional: Set additional environment variables if needed
    };
  };
}
