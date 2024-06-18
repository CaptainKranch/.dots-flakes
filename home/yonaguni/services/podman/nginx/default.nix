{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    podman
    podman-tui
    podman-compose
    podman-desktop
    cri-o
  ];
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
    nginx-test = {
      image = "docker.io/library/nginx:latest";
      autoStart = true;
      ports = [ "127.0.0.1:8080:80" ];
    };
  };
}
