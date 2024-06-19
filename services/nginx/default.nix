{  
  #Containers
  virtualisation = {
    containers.enable = true;
    cri-o.enable = true;
    podman.enable = true;
    podman.dockerCompat = true;
    podman.defaultNetwork.settings.dns_enabled = true;
  };

  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
    nginx-test = {
      image = "docker.io/library/nginx:latest";
      autoStart = true;
      ports = [ "127.0.0.1:8080:80" ];
    };
  };
}
