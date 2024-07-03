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
  virtualisation.oci-containers.containers."superset_app" = {
    image = "";
    environment = {
      BUILD_SUPERSET_FRONTEND_IN_DOCKER = "true";
      COMPOSE_PROJECT_NAME = "superset";
      CYPRESS_CONFIG = "";
      DATABASE_DB = "superset";
      DATABASE_DIALECT = "postgresql";
      DATABASE_HOST = "db";
      DATABASE_PASSWORD = "superset";
      DATABASE_PORT = "5432";
      DATABASE_USER = "superset";
      ENABLE_PLAYWRIGHT = "false";
      EXAMPLES_DB = "examples";
      EXAMPLES_HOST = "db";
      EXAMPLES_PASSWORD = "examples";
      EXAMPLES_PORT = "5432";
      EXAMPLES_USER = "examples";
      FLASK_DEBUG = "true";
      MAPBOX_API_KEY = "";
      POSTGRES_DB = "superset";
      POSTGRES_PASSWORD = "superset";
      POSTGRES_USER = "superset";
      PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "true";
      PYTHONPATH = "/app/pythonpath:/app/docker/pythonpath_dev";
      REDIS_HOST = "redis";
      REDIS_PORT = "6379";
      SUPERSET_ENV = "development";
      SUPERSET_LOAD_EXAMPLES = "yes";
      SUPERSET_PORT = "8088";
      SUPERSET_SECRET_KEY = "TEST_NON_DEV_SECRET";
    };
    volumes = [
      "/home/danielgm/Documents/Services/analytics/superset/docker:/app/docker:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset:/app/superset:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset-frontend:/app/superset-frontend:rw"
      "/home/danielgm/Documents/Services/analytics/superset/tests:/app/tests:rw"
      "superset_home:/app/superset_home:rw"
    ];
    ports = [
      "8088:8088/tcp"
    ];
    cmd = [ "/app/docker/docker-bootstrap.sh" "app" ];
    dependsOn = [
      "superset_cache"
      "superset_db"
    ];
    user = "root";
    log-driver = "journald";
    extraOptions = [
      "--add-host=host.docker.internal:host-gateway"
      "--network-alias=superset"
      "--network=analytics_default"
    ];
  };
  systemd.services."podman-superset_app" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_superset_home.service"
    ];
    requires = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_superset_home.service"
    ];
    partOf = [
      "podman-compose-analytics-root.target"
    ];
    wantedBy = [
      "podman-compose-analytics-root.target"
    ];
  };
  virtualisation.oci-containers.containers."superset_cache" = {
    image = "redis:7";
    volumes = [
      "redis:/data:rw"
    ];
    ports = [
      "127.0.0.1:6379:6379/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=redis"
      "--network=analytics_default"
    ];
  };
  systemd.services."podman-superset_cache" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_redis.service"
    ];
    requires = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_redis.service"
    ];
    partOf = [
      "podman-compose-analytics-root.target"
    ];
    wantedBy = [
      "podman-compose-analytics-root.target"
    ];
  };
  virtualisation.oci-containers.containers."superset_db" = {
    image = "postgres:15";
    environment = {
      BUILD_SUPERSET_FRONTEND_IN_DOCKER = "true";
      COMPOSE_PROJECT_NAME = "superset";
      CYPRESS_CONFIG = "false";
      DATABASE_DB = "superset";
      DATABASE_DIALECT = "postgresql";
      DATABASE_HOST = "db";
      DATABASE_PASSWORD = "superset";
      DATABASE_PORT = "5432";
      DATABASE_USER = "superset";
      ENABLE_PLAYWRIGHT = "false";
      EXAMPLES_DB = "examples";
      EXAMPLES_HOST = "db";
      EXAMPLES_PASSWORD = "examples";
      EXAMPLES_PORT = "5432";
      EXAMPLES_USER = "examples";
      FLASK_DEBUG = "true";
      MAPBOX_API_KEY = "";
      POSTGRES_DB = "superset";
      POSTGRES_PASSWORD = "superset";
      POSTGRES_USER = "superset";
      PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "true";
      PYTHONPATH = "/app/pythonpath:/app/docker/pythonpath_dev";
      REDIS_HOST = "redis";
      REDIS_PORT = "6379";
      SUPERSET_ENV = "development";
      SUPERSET_LOAD_EXAMPLES = "yes";
      SUPERSET_PORT = "8088";
      SUPERSET_SECRET_KEY = "TEST_NON_DEV_SECRET";
    };
    volumes = [
      "/home/danielgm/Documents/Services/analytics/superset/docker/docker-entrypoint-initdb.d:/docker-entrypoint-initdb.d:rw"
      "db_home:/var/lib/postgresql/data:rw"
    ];
    ports = [
      "127.0.0.1:5432:5432/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=db"
      "--network=analytics_default"
    ];
  };
  systemd.services."podman-superset_db" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_db_home.service"
    ];
    requires = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_db_home.service"
    ];
    partOf = [
      "podman-compose-analytics-root.target"
    ];
    wantedBy = [
      "podman-compose-analytics-root.target"
    ];
  };
  virtualisation.oci-containers.containers."superset_init" = {
    image = "";
    environment = {
      BUILD_SUPERSET_FRONTEND_IN_DOCKER = "true";
      COMPOSE_PROJECT_NAME = "superset";
      CYPRESS_CONFIG = "";
      DATABASE_DB = "superset";
      DATABASE_DIALECT = "postgresql";
      DATABASE_HOST = "db";
      DATABASE_PASSWORD = "superset";
      DATABASE_PORT = "5432";
      DATABASE_USER = "superset";
      ENABLE_PLAYWRIGHT = "false";
      EXAMPLES_DB = "examples";
      EXAMPLES_HOST = "db";
      EXAMPLES_PASSWORD = "examples";
      EXAMPLES_PORT = "5432";
      EXAMPLES_USER = "examples";
      FLASK_DEBUG = "true";
      MAPBOX_API_KEY = "";
      POSTGRES_DB = "superset";
      POSTGRES_PASSWORD = "superset";
      POSTGRES_USER = "superset";
      PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "true";
      PYTHONPATH = "/app/pythonpath:/app/docker/pythonpath_dev";
      REDIS_HOST = "redis";
      REDIS_PORT = "6379";
      SUPERSET_ENV = "development";
      SUPERSET_LOAD_EXAMPLES = "yes";
      SUPERSET_PORT = "8088";
      SUPERSET_SECRET_KEY = "TEST_NON_DEV_SECRET";
    };
    volumes = [
      "/home/danielgm/Documents/Services/analytics/superset/docker:/app/docker:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset:/app/superset:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset-frontend:/app/superset-frontend:rw"
      "/home/danielgm/Documents/Services/analytics/superset/tests:/app/tests:rw"
      "superset_home:/app/superset_home:rw"
    ];
    cmd = [ "/app/docker/docker-init.sh" ];
    dependsOn = [
      "superset_cache"
      "superset_db"
    ];
    user = "root";
    log-driver = "journald";
    extraOptions = [
      "--network-alias=superset-init"
      "--network=analytics_default"
      "--no-healthcheck"
    ];
  };
  systemd.services."podman-superset_init" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "no";
    };
    after = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_superset_home.service"
    ];
    requires = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_superset_home.service"
    ];
    partOf = [
      "podman-compose-analytics-root.target"
    ];
    wantedBy = [
      "podman-compose-analytics-root.target"
    ];
  };
  virtualisation.oci-containers.containers."superset_nginx" = {
    image = "nginx:latest";
    volumes = [
      "/home/danielgm/Documents/Services/analytics/superset/docker/nginx/nginx.conf:/etc/nginx/nginx.conf:ro"
    ];
    ports = [
      "80:80/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--add-host=host.docker.internal:host-gateway"
      "--network-alias=nginx"
      "--network=analytics_default"
    ];
  };
  systemd.services."podman-superset_nginx" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-analytics_default.service"
    ];
    requires = [
      "podman-network-analytics_default.service"
    ];
    partOf = [
      "podman-compose-analytics-root.target"
    ];
    wantedBy = [
      "podman-compose-analytics-root.target"
    ];
  };
  virtualisation.oci-containers.containers."superset_node" = {
    image = "node:18";
    environment = {
      BUILD_SUPERSET_FRONTEND_IN_DOCKER = "true";
      COMPOSE_PROJECT_NAME = "superset";
      CYPRESS_CONFIG = "false";
      DATABASE_DB = "superset";
      DATABASE_DIALECT = "postgresql";
      DATABASE_HOST = "db";
      DATABASE_PASSWORD = "superset";
      DATABASE_PORT = "5432";
      DATABASE_USER = "superset";
      ENABLE_PLAYWRIGHT = "false";
      EXAMPLES_DB = "examples";
      EXAMPLES_HOST = "db";
      EXAMPLES_PASSWORD = "examples";
      EXAMPLES_PORT = "5432";
      EXAMPLES_USER = "examples";
      FLASK_DEBUG = "true";
      MAPBOX_API_KEY = "";
      POSTGRES_DB = "superset";
      POSTGRES_PASSWORD = "superset";
      POSTGRES_USER = "superset";
      PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "true";
      PYTHONPATH = "/app/pythonpath:/app/docker/pythonpath_dev";
      REDIS_HOST = "redis";
      REDIS_PORT = "6379";
      SCARF_ANALYTICS = "";
      SUPERSET_ENV = "development";
      SUPERSET_LOAD_EXAMPLES = "yes";
      SUPERSET_PORT = "8088";
      SUPERSET_SECRET_KEY = "TEST_NON_DEV_SECRET";
    };
    volumes = [
      "/home/danielgm/Documents/Services/analytics/superset/docker:/app/docker:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset:/app/superset:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset-frontend:/app/superset-frontend:rw"
      "/home/danielgm/Documents/Services/analytics/superset/tests:/app/tests:rw"
      "superset_home:/app/superset_home:rw"
    ];
    cmd = [ "/app/docker/docker-frontend.sh" ];
    dependsOn = [
      "superset_cache"
      "superset_db"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=superset-node"
      "--network=analytics_default"
    ];
  };
  systemd.services."podman-superset_node" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "no";
    };
    after = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_superset_home.service"
    ];
    requires = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_superset_home.service"
    ];
    partOf = [
      "podman-compose-analytics-root.target"
    ];
    wantedBy = [
      "podman-compose-analytics-root.target"
    ];
  };
  virtualisation.oci-containers.containers."superset_websocket" = {
    image = "";
    environment = {
      PORT = "8080";
      REDIS_HOST = "redis";
      REDIS_PORT = "6379";
      REDIS_SSL = "false";
    };
    volumes = [
      "/home/danielgm/Documents/Services/analytics/superset:/home/superset-websocket/dist:rw"
      "/home/danielgm/Documents/Services/analytics/superset/docker/superset-websocket/config.json:/home/superset-websocket/config.json:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset-websocket:/home/superset-websocket:rw"
    ];
    ports = [
      "8080:8080/tcp"
    ];
    dependsOn = [
      "superset_cache"
    ];
    log-driver = "journald";
    extraOptions = [
      "--add-host=host.docker.internal:host-gateway"
      "--network-alias=superset-websocket"
      "--network=analytics_default"
    ];
  };
  systemd.services."podman-superset_websocket" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "no";
    };
    after = [
      "podman-network-analytics_default.service"
    ];
    requires = [
      "podman-network-analytics_default.service"
    ];
    partOf = [
      "podman-compose-analytics-root.target"
    ];
    wantedBy = [
      "podman-compose-analytics-root.target"
    ];
  };
  virtualisation.oci-containers.containers."superset_worker" = {
    image = "";
    environment = {
      BUILD_SUPERSET_FRONTEND_IN_DOCKER = "true";
      CELERYD_CONCURRENCY = "2";
      COMPOSE_PROJECT_NAME = "superset";
      CYPRESS_CONFIG = "false";
      DATABASE_DB = "superset";
      DATABASE_DIALECT = "postgresql";
      DATABASE_HOST = "db";
      DATABASE_PASSWORD = "superset";
      DATABASE_PORT = "5432";
      DATABASE_USER = "superset";
      ENABLE_PLAYWRIGHT = "false";
      EXAMPLES_DB = "examples";
      EXAMPLES_HOST = "db";
      EXAMPLES_PASSWORD = "examples";
      EXAMPLES_PORT = "5432";
      EXAMPLES_USER = "examples";
      FLASK_DEBUG = "true";
      MAPBOX_API_KEY = "";
      POSTGRES_DB = "superset";
      POSTGRES_PASSWORD = "superset";
      POSTGRES_USER = "superset";
      PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "true";
      PYTHONPATH = "/app/pythonpath:/app/docker/pythonpath_dev";
      REDIS_HOST = "redis";
      REDIS_PORT = "6379";
      SUPERSET_ENV = "development";
      SUPERSET_LOAD_EXAMPLES = "yes";
      SUPERSET_PORT = "8088";
      SUPERSET_SECRET_KEY = "TEST_NON_DEV_SECRET";
    };
    volumes = [
      "/home/danielgm/Documents/Services/analytics/superset/docker:/app/docker:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset:/app/superset:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset-frontend:/app/superset-frontend:rw"
      "/home/danielgm/Documents/Services/analytics/superset/tests:/app/tests:rw"
      "superset_home:/app/superset_home:rw"
    ];
    cmd = [ "/app/docker/docker-bootstrap.sh" "worker" ];
    dependsOn = [
      "superset_cache"
      "superset_db"
    ];
    user = "root";
    log-driver = "journald";
    extraOptions = [
      "--add-host=host.docker.internal:host-gateway"
      "--health-cmd=celery -A superset.tasks.celery_app:app inspect ping -d celery@$HOSTNAME"
      "--network-alias=superset-worker"
      "--network=analytics_default"
    ];
  };
  systemd.services."podman-superset_worker" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_superset_home.service"
    ];
    requires = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_superset_home.service"
    ];
    partOf = [
      "podman-compose-analytics-root.target"
    ];
    wantedBy = [
      "podman-compose-analytics-root.target"
    ];
  };
  virtualisation.oci-containers.containers."superset_worker_beat" = {
    image = "";
    environment = {
      BUILD_SUPERSET_FRONTEND_IN_DOCKER = "true";
      COMPOSE_PROJECT_NAME = "superset";
      CYPRESS_CONFIG = "false";
      DATABASE_DB = "superset";
      DATABASE_DIALECT = "postgresql";
      DATABASE_HOST = "db";
      DATABASE_PASSWORD = "superset";
      DATABASE_PORT = "5432";
      DATABASE_USER = "superset";
      ENABLE_PLAYWRIGHT = "false";
      EXAMPLES_DB = "examples";
      EXAMPLES_HOST = "db";
      EXAMPLES_PASSWORD = "examples";
      EXAMPLES_PORT = "5432";
      EXAMPLES_USER = "examples";
      FLASK_DEBUG = "true";
      MAPBOX_API_KEY = "";
      POSTGRES_DB = "superset";
      POSTGRES_PASSWORD = "superset";
      POSTGRES_USER = "superset";
      PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "true";
      PYTHONPATH = "/app/pythonpath:/app/docker/pythonpath_dev";
      REDIS_HOST = "redis";
      REDIS_PORT = "6379";
      SUPERSET_ENV = "development";
      SUPERSET_LOAD_EXAMPLES = "yes";
      SUPERSET_PORT = "8088";
      SUPERSET_SECRET_KEY = "TEST_NON_DEV_SECRET";
    };
    volumes = [
      "/home/danielgm/Documents/Services/analytics/superset/docker:/app/docker:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset:/app/superset:rw"
      "/home/danielgm/Documents/Services/analytics/superset/superset-frontend:/app/superset-frontend:rw"
      "/home/danielgm/Documents/Services/analytics/superset/tests:/app/tests:rw"
      "superset_home:/app/superset_home:rw"
    ];
    cmd = [ "/app/docker/docker-bootstrap.sh" "beat" ];
    dependsOn = [
      "superset_cache"
      "superset_db"
    ];
    user = "root";
    log-driver = "journald";
    extraOptions = [
      "--network-alias=superset-worker-beat"
      "--network=analytics_default"
      "--no-healthcheck"
    ];
  };
  systemd.services."podman-superset_worker_beat" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_superset_home.service"
    ];
    requires = [
      "podman-network-analytics_default.service"
      "podman-volume-analytics_superset_home.service"
    ];
    partOf = [
      "podman-compose-analytics-root.target"
    ];
    wantedBy = [
      "podman-compose-analytics-root.target"
    ];
  };

  # Networks
  systemd.services."podman-network-analytics_default" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "${pkgs.podman}/bin/podman network rm -f analytics_default";
    };
    script = ''
      podman network inspect analytics_default || podman network create analytics_default
    '';
    partOf = [ "podman-compose-analytics-root.target" ];
    wantedBy = [ "podman-compose-analytics-root.target" ];
  };

  # Volumes
  systemd.services."podman-volume-analytics_db_home" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect analytics_db_home || podman volume create analytics_db_home
    '';
    partOf = [ "podman-compose-analytics-root.target" ];
    wantedBy = [ "podman-compose-analytics-root.target" ];
  };
  systemd.services."podman-volume-analytics_redis" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect analytics_redis || podman volume create analytics_redis
    '';
    partOf = [ "podman-compose-analytics-root.target" ];
    wantedBy = [ "podman-compose-analytics-root.target" ];
  };
  systemd.services."podman-volume-analytics_superset_home" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect analytics_superset_home || podman volume create analytics_superset_home
    '';
    partOf = [ "podman-compose-analytics-root.target" ];
    wantedBy = [ "podman-compose-analytics-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-analytics-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
