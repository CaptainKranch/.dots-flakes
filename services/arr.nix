# Auto-generated using compose2nix v0.2.0-pre.
{ pkgs, lib, ... }:

{
  # Runtime
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      # Required for container networking to be able to use names.
      dns_enabled = true;
    };
  };
  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."prowlarr" = {
    image = "linuxserver/prowlarr:1.20.1";
    environment = {
      PGID = "1000";
      PUID = "1000";
      TZ = "America/Bogota";
    };
    volumes = [
      "/home/danielgm/Documents/Services/nixarr/media/downloads/watch:/downloads:rw"
      "/home/danielgm/Documents/Services/nixarr/media/prowlarr:/config:rw"
    ];
    ports = [
      "9696:9696/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--cap-add=NET_ADMIN"
      "--network-alias=prowlarr"
      "--network=nixarr_default"
    ];
  };
  systemd.services."podman-prowlarr" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-nixarr_default.service"
    ];
    requires = [
      "podman-network-nixarr_default.service"
    ];
    partOf = [
      "podman-compose-nixarr-root.target"
    ];
    wantedBy = [
      "podman-compose-nixarr-root.target"
    ];
  };
  virtualisation.oci-containers.containers."radarr" = {
    image = "linuxserver/radarr:5.8.3";
    environment = {
      PGID = "1000";
      PUID = "1000";
      TZ = "America/Bogota";
    };
    volumes = [
      "/home/danielgm/Documents/Services/nixarr/media/downloads/completed:/downloads:rw"
      "/home/danielgm/Documents/Services/nixarr/media/movies:/movies:rw"
      "/home/danielgm/Documents/Services/nixarr/media/radarr:/config:rw"
    ];
    ports = [
      "7878:7878/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=radarr"
      "--network=nixarr_default"
    ];
  };
  systemd.services."podman-radarr" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-nixarr_default.service"
    ];
    requires = [
      "podman-network-nixarr_default.service"
    ];
    partOf = [
      "podman-compose-nixarr-root.target"
    ];
    wantedBy = [
      "podman-compose-nixarr-root.target"
    ];
  };
  virtualisation.oci-containers.containers."sonarr" = {
    image = "linuxserver/sonarr:4.0.8";
    environment = {
      PGID = "1000";
      PUID = "1000";
      TZ = "America/Bogota";
    };
    volumes = [
      "/home/danielgm/Documents/Services/nixarr/media/anime:/anime:rw"
      "/home/danielgm/Documents/Services/nixarr/media/downloads/completed:/downloads:rw"
      "/home/danielgm/Documents/Services/nixarr/media/sonarr:/config:rw"
      "/home/danielgm/Documents/Services/nixarr/media/tv:/tv:rw"
    ];
    ports = [
      "8989:8989/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=sonarr"
      "--network=nixarr_default"
    ];
  };
  systemd.services."podman-sonarr" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-nixarr_default.service"
    ];
    requires = [
      "podman-network-nixarr_default.service"
    ];
    partOf = [
      "podman-compose-nixarr-root.target"
    ];
    wantedBy = [
      "podman-compose-nixarr-root.target"
    ];
  };
  
  virtualisation.oci-containers.containers."qbittorrent" = {
    image = "linuxserver/qbittorrent:4.6.5";
    environment = {
      PGID = "1000";
      PUID = "1000";
      TZ = "America/Bogota";
    };
    volumes = [
      "/home/danielgm/Documents/Services/nixarr/media/downloads:/downloads:rw,z"
      "/home/danielgm/Documents/Services/qbittorrent:/config:rw,Z"
    ];
    ports = [
      "8080:8080/tcp"
      "65535:65535/udp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=qbittorrent"
      "--network=nixarr_default"
    ];
  };
  systemd.services."podman-qbittorrent" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-nixarr_default.service"
    ];
    requires = [
      "podman-network-nixarr_default.service"
    ];
    partOf = [
      "podman-compose-nixarr-root.target"
    ];
    wantedBy = [
      "podman-compose-nixarr-root.target"
    ];
  };
  # Networks
  systemd.services."podman-network-nixarr_default" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "${pkgs.podman}/bin/podman network rm -f nixarr_default";
    };
    script = ''
      podman network inspect nixarr_default || podman network create nixarr_default
    '';
    partOf = [ "podman-compose-nixarr-root.target" ];
    wantedBy = [ "podman-compose-nixarr-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-nixarr-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
