{ config, pkgs, ... }:

let
  sunshine = pkgs.sunshine or (import (pkgs.fetchFromGitHub {
    owner = "loki-47-6F-64";
    repo = "sunshine";
    rev = "<commit-hash>"; # replace with the commit hash you want to use
    sha256 = "<sha256>"; # replace with the correct SHA-256 hash
  }) {});
in
{
  services.sunshine = {
    enable = true;
    user = "sunshine"; # replace with your user
    group = "sunshine"; # replace with your group
    config = {
      # configure Sunshine here
    };
  };

  systemd.services.sunshine = {
    description = "Sunshine Game Streaming Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${sunshine}/bin/sunshine";
      User = config.services.sunshine.user;
      Group = config.services.sunshine.group;
      Restart = "always";
    };
  };
}
