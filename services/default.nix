# containers.nix
{
  virtualisation = {
    containers.enable = true;
    cri-o.enable = true;
    podman.enable = true;
    podman.dockerCompat = true;
    podman.defaultNetwork.settings.dns_enabled = true;
    oci-containers.backend = "podman";
    oci-containers.containers = {
      nginx = {
        image = "docker.io/library/nginx:latest";
        autoStart = true;
        ports = [ "0.0.0.0:8080:80" ]; # Make available to the network
      };
      jellyfin = {
        image = "docker.io/jellyfin/jellyfin:latest";
        autoStart = true;
        ports = [ "0.0.0.0:8096:8096" ]; # Expose Jellyfin port
        labels = {
          "io.containers.autoupdate" = "registry";
        };
        devices = [
          "/dev/dri:/dev/dri"
        ];
        environment = {
          TZ = "America/Bogota";
        };
        volumes = [
          "/home/danielgm/Documents/Services/jellyfin/cache:/cache:Z"
          "/home/danielgm/Documents/Services/jellyfin/config:/config:Z"
          "/home/danielgm/Documents/Services/jellyfin/media:/media:Z"
        ];
        user = "${toString (getent passwd danielgm).uid}:${toString (getent group danielgm).gid}";
        userns = "keep-id";
      };
    };
  };
}

