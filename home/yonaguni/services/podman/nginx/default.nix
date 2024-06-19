{ config, pkgs, ... }:
{
  # Install the necessary packages
  home.packages = with pkgs; [ 
    podman
    podman-tui
    podman-compose
    podman-desktop
    cri-o
  ];

  # Define user systemd service to run the nginx container
  systemd.user.services.nginx = {
    description = "Nginx container";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.podman}/bin/podman run --rm --name nginx -p 127.0.0.1:8080:80 docker.io/library/nginx:latest";
      ExecStop = "${pkgs.podman}/bin/podman stop nginx";
      Restart = "always";
    };
    wantedBy = [ "default.target" ];
  };

  # Ensure systemd user services are reloaded and the nginx service is started
  home.activation.reloadSystemd = {
    type = "script";
    script = ''
      systemctl --user daemon-reload
      systemctl --user enable nginx.service
      systemctl --user start nginx.service
    '';
  };
}
