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
      airflow = {
        image = "apache/airflow:latest";
        autoStart = true;
        ports = [ "0.0.0.0:8081:8080" ]; # Expose Airflow web server
        environment = {
          AIRFLOW__CORE__EXECUTOR = "LocalExecutor";
          AIRFLOW__CORE__SQL_ALCHEMY_CONN = "sqlite:////usr/local/airflow/airflow.db";
        };
      };
    };
  };
}
