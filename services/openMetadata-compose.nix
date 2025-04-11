# Auto-generated using compose2nix v0.3.2-pre.
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

  # Enable container name DNS for non-default Podman networks.
  # https://github.com/NixOS/nixpkgs/issues/226365
  networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."execute_migrate_all" = {
    image = "docker.getcollate.io/openmetadata/server:1.5.12";
    environment = {
      "AIRFLOW_PASSWORD" = "admin";
      "AIRFLOW_TIMEOUT" = "10";
      "AIRFLOW_TRUST_STORE_PASSWORD" = "\"\"";
      "AIRFLOW_TRUST_STORE_PATH" = "\"\"";
      "AIRFLOW_USERNAME" = "admin";
      "AUTHENTICATION_AUTHORITY" = "https://accounts.google.com";
      "AUTHENTICATION_CALLBACK_URL" = "\"\"";
      "AUTHENTICATION_CLIENT_ID" = "\"\"";
      "AUTHENTICATION_CLIENT_TYPE" = "public";
      "AUTHENTICATION_ENABLE_SELF_SIGNUP" = "true";
      "AUTHENTICATION_JWT_PRINCIPAL_CLAIMS" = "[email,preferred_username,sub]";
      "AUTHENTICATION_JWT_PRINCIPAL_CLAIMS_MAPPING" = "[]";
      "AUTHENTICATION_PROVIDER" = "basic";
      "AUTHENTICATION_PUBLIC_KEYS" = "[http://localhost:8585/api/v1/system/config/jwks]";
      "AUTHENTICATION_RESPONSE_TYPE" = "id_token";
      "AUTHORIZER_ADMIN_PRINCIPALS" = "[admin]";
      "AUTHORIZER_ALLOWED_REGISTRATION_DOMAIN" = "[\"all\"]";
      "AUTHORIZER_CLASS_NAME" = "org.openmetadata.service.security.DefaultAuthorizer";
      "AUTHORIZER_ENABLE_SECURE_SOCKET" = "false";
      "AUTHORIZER_ENABLE_SMTP" = "false";
      "AUTHORIZER_ENFORCE_PRINCIPAL_DOMAIN" = "false";
      "AUTHORIZER_INGESTION_PRINCIPALS" = "[ingestion-bot]";
      "AUTHORIZER_PRINCIPAL_DOMAIN" = "\"open-metadata.org\"";
      "AUTHORIZER_REQUEST_FILTER" = "org.openmetadata.service.security.JwtFilter";
      "CUSTOM_OIDC_AUTHENTICATION_PROVIDER_NAME" = "\"\"";
      "DB_DRIVER_CLASS" = "com.mysql.cj.jdbc.Driver";
      "DB_HOST" = "mysql";
      "DB_PARAMS" = "allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
      "DB_PORT" = "3306";
      "DB_SCHEME" = "mysql";
      "DB_USER" = "openmetadata_user";
      "DB_USER_PASSWORD" = "openmetadata_password";
      "ELASTICSEARCH_BATCH_SIZE" = "100";
      "ELASTICSEARCH_CONNECTION_TIMEOUT_SECS" = "5";
      "ELASTICSEARCH_HOST" = " elasticsearch";
      "ELASTICSEARCH_INDEX_MAPPING_LANG" = "EN";
      "ELASTICSEARCH_KEEP_ALIVE_TIMEOUT_SECS" = "600";
      "ELASTICSEARCH_PASSWORD" = "\"\"";
      "ELASTICSEARCH_PAYLOAD_BYTES_SIZE" = "10485760";
      "ELASTICSEARCH_PORT" = "9200";
      "ELASTICSEARCH_SCHEME" = "http";
      "ELASTICSEARCH_SOCKET_TIMEOUT_SECS" = "60";
      "ELASTICSEARCH_TRUST_STORE_PASSWORD" = "\"\"";
      "ELASTICSEARCH_TRUST_STORE_PATH" = "\"\"";
      "ELASTICSEARCH_USER" = "\"\"";
      "EVENT_MONITOR" = "prometheus";
      "EVENT_MONITOR_BATCH_SIZE" = "10";
      "EVENT_MONITOR_LATENCY" = "[]";
      "EVENT_MONITOR_PATH_PATTERN" = "[\"/api/v1/tables/*\", \"/api/v1/health-check\"]";
      "FERNET_KEY" = "jJ/9sz0g0OHxsfxOoSfdFdmk3ysNmPRnH3TUAbz3IHA=";
      "JWT_ISSUER" = "\"open-metadata.org\"";
      "JWT_KEY_ID" = "\"Gb389a-9f76-gdjs-a92j-0242bk94356\"";
      "LOG_LEVEL" = "INFO";
      "MASK_PASSWORDS_API" = "false";
      "MIGRATION_LIMIT_PARAM" = "1200";
      "OIDC_CALLBACK" = "\"http://localhost:8585/callback\"";
      "OIDC_CLIENT_AUTH_METHOD" = "\"client_secret_post\"";
      "OIDC_CLIENT_ID" = "\"\"";
      "OIDC_CLIENT_SECRET" = "\"\"";
      "OIDC_CUSTOM_PARAMS" = "{}";
      "OIDC_DISABLE_PKCE" = "true";
      "OIDC_DISCOVERY_URI" = "\"\"";
      "OIDC_MAX_CLOCK_SKEW" = "\"\"";
      "OIDC_PREFERRED_JWS" = "\"RS256\"";
      "OIDC_RESPONSE_TYPE" = "\"code\"";
      "OIDC_SCOPE" = "\"openid email profile\"";
      "OIDC_SERVER_URL" = "\"http://localhost:8585\"";
      "OIDC_TENANT" = "\"\"";
      "OIDC_TYPE" = "\"\"";
      "OIDC_USE_NONCE" = "true";
      "OM_DATABASE" = "openmetadata_db";
      "OM_EMAIL_ENTITY" = "\"OpenMetadata\"";
      "OM_SM_ACCESS_KEY" = "\"\"";
      "OM_SM_ACCESS_KEY_ID" = "\"\"";
      "OM_SM_CLIENT_ID" = "\"\"";
      "OM_SM_CLIENT_SECRET" = "\"\"";
      "OM_SM_REGION" = "\"\"";
      "OM_SM_TENANT_ID" = "\"\"";
      "OM_SM_VAULT_NAME" = "\"\"";
      "OM_SUPPORT_URL" = "\"https://slack.open-metadata.org\"";
      "OPENMETADATA_CLUSTER_NAME" = "openmetadata";
      "OPENMETADATA_HEAP_OPTS" = "-Xmx1G -Xms1G";
      "OPENMETADATA_SERVER_URL" = "\"\"";
      "OPENMETADATA_SMTP_SENDER_MAIL" = "\"\"";
      "PIPELINE_SERVICE_CLIENT_CLASS_NAME" = "\"org.openmetadata.service.clients.pipeline.airflow.AirflowRESTClient\"";
      "PIPELINE_SERVICE_CLIENT_ENABLED" = "true";
      "PIPELINE_SERVICE_CLIENT_ENDPOINT" = "http://ingestion:8083";
      "PIPELINE_SERVICE_CLIENT_HEALTH_CHECK_INTERVAL" = "300";
      "PIPELINE_SERVICE_CLIENT_HOST_IP" = "\"\"";
      "PIPELINE_SERVICE_CLIENT_SECRETS_MANAGER_LOADER" = "\"noop\"";
      "PIPELINE_SERVICE_CLIENT_SSL_CERT_PATH" = "\"\"";
      "PIPELINE_SERVICE_CLIENT_VERIFY_SSL" = "\"no-ssl\"";
      "PIPELINE_SERVICE_IP_INFO_ENABLED" = "false";
      "RSA_PRIVATE_KEY_FILE_PATH" = "\"./conf/private_key.der\"";
      "RSA_PUBLIC_KEY_FILE_PATH" = "\"./conf/public_key.der\"";
      "SEARCH_TYPE" = " \"elasticsearch\"";
      "SECRET_MANAGER" = "db";
      "SERVER_ADMIN_PORT" = "8586";
      "SERVER_HOST_API_URL" = "http://openmetadata-server:8585/api";
      "SERVER_PORT" = "8585";
      "SMTP_SERVER_ENDPOINT" = "\"\"";
      "SMTP_SERVER_PORT" = "\"\"";
      "SMTP_SERVER_PWD" = "\"\"";
      "SMTP_SERVER_STRATEGY" = "\"SMTP_TLS\"";
      "SMTP_SERVER_USERNAME" = "\"\"";
      "WEB_CONF_CACHE_CONTROL" = "\"\"";
      "WEB_CONF_CONTENT_TYPE_OPTIONS_ENABLED" = "false";
      "WEB_CONF_FRAME_OPTION" = "\"SAMEORIGIN\"";
      "WEB_CONF_FRAME_OPTION_ENABLED" = "false";
      "WEB_CONF_FRAME_ORIGIN" = "\"\"";
      "WEB_CONF_HSTS_ENABLED" = "false";
      "WEB_CONF_HSTS_INCLUDE_SUBDOMAINS" = "\"true\"";
      "WEB_CONF_HSTS_MAX_AGE" = "\"365 days\"";
      "WEB_CONF_HSTS_PRELOAD" = "\"true\"";
      "WEB_CONF_PERMISSION_POLICY_ENABLED" = "false";
      "WEB_CONF_PERMISSION_POLICY_OPTION" = "\"\"";
      "WEB_CONF_PRAGMA" = "\"\"";
      "WEB_CONF_REFERRER_POLICY_ENABLED" = "false";
      "WEB_CONF_REFERRER_POLICY_OPTION" = "\"SAME_ORIGIN\"";
      "WEB_CONF_URI_PATH" = "\"/api\"";
      "WEB_CONF_XSS_CSP_ENABLED" = "false";
      "WEB_CONF_XSS_CSP_POLICY" = "\"default-src 'self'\"";
      "WEB_CONF_XSS_CSP_REPORT_ONLY_POLICY" = "\"\"";
      "WEB_CONF_XSS_PROTECTION_BLOCK" = "true";
      "WEB_CONF_XSS_PROTECTION_ENABLED" = "false";
      "WEB_CONF_XSS_PROTECTION_ON" = "true";
    };
    cmd = [ "./bootstrap/openmetadata-ops.sh" "migrate" ];
    dependsOn = [
      "openmetadata_elasticsearch"
      "openmetadata_mysql"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=execute-migrate-all"
      "--network=notes_app_net"
    ];
  };
  systemd.services."podman-execute_migrate_all" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "no";
    };
    after = [
      "podman-network-notes_app_net.service"
    ];
    requires = [
      "podman-network-notes_app_net.service"
    ];
    partOf = [
      "podman-compose-notes-root.target"
    ];
    wantedBy = [
      "podman-compose-notes-root.target"
    ];
  };
  virtualisation.oci-containers.containers."openmetadata_elasticsearch" = {
    image = "docker.elastic.co/elasticsearch/elasticsearch:8.10.2";
    environment = {
      "ES_JAVA_OPTS" = "-Xms1024m -Xmx1024m";
      "discovery.type" = "single-node";
      "xpack.security.enabled" = "false";
    };
    volumes = [
      "notes_es-data:/usr/share/elasticsearch/data:rw"
    ];
    ports = [
      "9200:9200/tcp"
      "9300:9300/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=curl -s http://localhost:9200/_cluster/health?pretty | grep status | grep -qE 'green|yellow' || exit 1"
      "--health-interval=15s"
      "--health-retries=10"
      "--health-timeout=10s"
      "--network-alias=elasticsearch"
      "--network=notes_app_net"
    ];
  };
  systemd.services."podman-openmetadata_elasticsearch" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "no";
    };
    after = [
      "podman-network-notes_app_net.service"
      "podman-volume-notes_es-data.service"
    ];
    requires = [
      "podman-network-notes_app_net.service"
      "podman-volume-notes_es-data.service"
    ];
    partOf = [
      "podman-compose-notes-root.target"
    ];
    wantedBy = [
      "podman-compose-notes-root.target"
    ];
  };
  virtualisation.oci-containers.containers."openmetadata_ingestion" = {
    image = "docker.getcollate.io/openmetadata/ingestion:1.5.12";
    environment = {
      "AIRFLOW_DB" = "airflow_db";
      "AIRFLOW__API__AUTH_BACKENDS" = "airflow.api.auth.backend.basic_auth,airflow.api.auth.backend.session";
      "AIRFLOW__CORE__EXECUTOR" = "LocalExecutor";
      "AIRFLOW__OPENMETADATA_AIRFLOW_APIS__DAG_GENERATED_CONFIGS" = "/opt/airflow/dag_generated_configs";
      "DB_HOST" = "mysql";
      "DB_PASSWORD" = "airflow_pass";
      "DB_PORT" = "3306";
      "DB_PROPERTIES" = "";
      "DB_SCHEME" = "mysql+pymysql";
      "DB_USER" = "airflow_user";
    };
    volumes = [
      "notes_ingestion-volume-dag-airflow:/opt/airflow/dag_generated_configs:rw"
      "notes_ingestion-volume-dags:/opt/airflow/dags:rw"
      "notes_ingestion-volume-tmp:/tmp:rw"
    ];
    ports = [
      "8081:8081/tcp"
    ];
    cmd = [ "/opt/airflow/ingestion_dependency.sh" ];
    dependsOn = [
      "openmetadata_elasticsearch"
      "openmetadata_mysql"
      "openmetadata_server"
    ];
    log-driver = "journald";
    extraOptions = [
      "--entrypoint=[\"/bin/bash\"]"
      "--network-alias=ingestion"
      "--network=notes_app_net"
    ];
  };
  systemd.services."podman-openmetadata_ingestion" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "no";
    };
    after = [
      "podman-network-notes_app_net.service"
      "podman-volume-notes_ingestion-volume-dag-airflow.service"
      "podman-volume-notes_ingestion-volume-dags.service"
      "podman-volume-notes_ingestion-volume-tmp.service"
    ];
    requires = [
      "podman-network-notes_app_net.service"
      "podman-volume-notes_ingestion-volume-dag-airflow.service"
      "podman-volume-notes_ingestion-volume-dags.service"
      "podman-volume-notes_ingestion-volume-tmp.service"
    ];
    partOf = [
      "podman-compose-notes-root.target"
    ];
    wantedBy = [
      "podman-compose-notes-root.target"
    ];
  };
  virtualisation.oci-containers.containers."openmetadata_mysql" = {
    image = "docker.getcollate.io/openmetadata/db:1.5.12";
    environment = {
      "MYSQL_ROOT_PASSWORD" = "password";
    };
    volumes = [
      "/home/danielgm/Documents/Services/open-metadata/docker-volume/db-data:/var/lib/mysql:rw"
    ];
    ports = [
      "3306:3306/tcp"
    ];
    cmd = [ "--sort_buffer_size=10M" ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=mysql --user=root --password=$MYSQL_ROOT_PASSWORD --silent --execute \"use openmetadata_db\""
      "--health-interval=15s"
      "--health-retries=10"
      "--health-timeout=10s"
      "--network-alias=mysql"
      "--network=notes_app_net"
    ];
  };
  systemd.services."podman-openmetadata_mysql" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-notes_app_net.service"
    ];
    requires = [
      "podman-network-notes_app_net.service"
    ];
    partOf = [
      "podman-compose-notes-root.target"
    ];
    wantedBy = [
      "podman-compose-notes-root.target"
    ];
  };
  virtualisation.oci-containers.containers."openmetadata_server" = {
    image = "docker.getcollate.io/openmetadata/server:1.5.12";
    environment = {
      "AIRFLOW_PASSWORD" = "admin";
      "AIRFLOW_TIMEOUT" = "10";
      "AIRFLOW_TRUST_STORE_PASSWORD" = "\"\"";
      "AIRFLOW_TRUST_STORE_PATH" = "\"\"";
      "AIRFLOW_USERNAME" = "admin";
      "AUTHENTICATION_AUTHORITY" = "https://accounts.google.com";
      "AUTHENTICATION_CALLBACK_URL" = "\"\"";
      "AUTHENTICATION_CLIENT_ID" = "\"\"";
      "AUTHENTICATION_CLIENT_TYPE" = "public";
      "AUTHENTICATION_ENABLE_SELF_SIGNUP" = "true";
      "AUTHENTICATION_JWT_PRINCIPAL_CLAIMS" = "[email,preferred_username,sub]";
      "AUTHENTICATION_JWT_PRINCIPAL_CLAIMS_MAPPING" = "[]";
      "AUTHENTICATION_PROVIDER" = "basic";
      "AUTHENTICATION_PUBLIC_KEYS" = "[http://localhost:8585/api/v1/system/config/jwks]";
      "AUTHENTICATION_RESPONSE_TYPE" = "id_token";
      "AUTHORIZER_ADMIN_PRINCIPALS" = "[admin]";
      "AUTHORIZER_ALLOWED_REGISTRATION_DOMAIN" = "[\"all\"]";
      "AUTHORIZER_CLASS_NAME" = "org.openmetadata.service.security.DefaultAuthorizer";
      "AUTHORIZER_ENABLE_SECURE_SOCKET" = "false";
      "AUTHORIZER_ENABLE_SMTP" = "false";
      "AUTHORIZER_ENFORCE_PRINCIPAL_DOMAIN" = "false";
      "AUTHORIZER_INGESTION_PRINCIPALS" = "[ingestion-bot]";
      "AUTHORIZER_PRINCIPAL_DOMAIN" = "\"open-metadata.org\"";
      "AUTHORIZER_REQUEST_FILTER" = "org.openmetadata.service.security.JwtFilter";
      "CUSTOM_OIDC_AUTHENTICATION_PROVIDER_NAME" = "\"\"";
      "DB_DRIVER_CLASS" = "com.mysql.cj.jdbc.Driver";
      "DB_HOST" = "mysql";
      "DB_PARAMS" = "allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
      "DB_PORT" = "3306";
      "DB_SCHEME" = "mysql";
      "DB_USER" = "openmetadata_user";
      "DB_USER_PASSWORD" = "openmetadata_password";
      "ELASTICSEARCH_BATCH_SIZE" = "100";
      "ELASTICSEARCH_CONNECTION_TIMEOUT_SECS" = "5";
      "ELASTICSEARCH_HOST" = " elasticsearch";
      "ELASTICSEARCH_INDEX_MAPPING_LANG" = "EN";
      "ELASTICSEARCH_KEEP_ALIVE_TIMEOUT_SECS" = "600";
      "ELASTICSEARCH_PASSWORD" = "\"\"";
      "ELASTICSEARCH_PAYLOAD_BYTES_SIZE" = "10485760";
      "ELASTICSEARCH_PORT" = "9200";
      "ELASTICSEARCH_SCHEME" = "http";
      "ELASTICSEARCH_SOCKET_TIMEOUT_SECS" = "60";
      "ELASTICSEARCH_TRUST_STORE_PASSWORD" = "\"\"";
      "ELASTICSEARCH_TRUST_STORE_PATH" = "\"\"";
      "ELASTICSEARCH_USER" = "\"\"";
      "EVENT_MONITOR" = "prometheus";
      "EVENT_MONITOR_BATCH_SIZE" = "10";
      "EVENT_MONITOR_LATENCY" = "[]";
      "EVENT_MONITOR_PATH_PATTERN" = "[\"/api/v1/tables/*\", \"/api/v1/health-check\"]";
      "FERNET_KEY" = "jJ/9sz0g0OHxsfxOoSfdFdmk3ysNmPRnH3TUAbz3IHA=";
      "JWT_ISSUER" = "\"open-metadata.org\"";
      "JWT_KEY_ID" = "\"Gb389a-9f76-gdjs-a92j-0242bk94356\"";
      "LOG_LEVEL" = "INFO";
      "MASK_PASSWORDS_API" = "false";
      "OIDC_CALLBACK" = "\"http://localhost:8585/callback\"";
      "OIDC_CLIENT_AUTH_METHOD" = "\"client_secret_post\"";
      "OIDC_CLIENT_ID" = "\"\"";
      "OIDC_CLIENT_SECRET" = "\"\"";
      "OIDC_CUSTOM_PARAMS" = "{}";
      "OIDC_DISABLE_PKCE" = "true";
      "OIDC_DISCOVERY_URI" = "\"\"";
      "OIDC_MAX_CLOCK_SKEW" = "\"\"";
      "OIDC_PREFERRED_JWS" = "\"RS256\"";
      "OIDC_RESPONSE_TYPE" = "\"code\"";
      "OIDC_SCOPE" = "\"openid email profile\"";
      "OIDC_SERVER_URL" = "\"http://localhost:8585\"";
      "OIDC_TENANT" = "\"\"";
      "OIDC_TYPE" = "\"\"";
      "OIDC_USE_NONCE" = "true";
      "OM_DATABASE" = "openmetadata_db";
      "OM_EMAIL_ENTITY" = "\"OpenMetadata\"";
      "OM_SM_ACCESS_KEY" = "\"\"";
      "OM_SM_ACCESS_KEY_ID" = "\"\"";
      "OM_SM_REGION" = "\"\"";
      "OM_SUPPORT_URL" = "\"https://slack.open-metadata.org\"";
      "OPENMETADATA_CLUSTER_NAME" = "openmetadata";
      "OPENMETADATA_HEAP_OPTS" = "-Xmx1G -Xms1G";
      "OPENMETADATA_SERVER_URL" = "\"\"";
      "OPENMETADATA_SMTP_SENDER_MAIL" = "\"\"";
      "PIPELINE_SERVICE_CLIENT_CLASS_NAME" = "\"org.openmetadata.service.clients.pipeline.airflow.AirflowRESTClient\"";
      "PIPELINE_SERVICE_CLIENT_ENABLED" = "true";
      "PIPELINE_SERVICE_CLIENT_ENDPOINT" = "http://ingestion:8083";
      "PIPELINE_SERVICE_CLIENT_HEALTH_CHECK_INTERVAL" = "300";
      "PIPELINE_SERVICE_CLIENT_HOST_IP" = "\"\"";
      "PIPELINE_SERVICE_CLIENT_SECRETS_MANAGER_LOADER" = "\"noop\"";
      "PIPELINE_SERVICE_CLIENT_SSL_CERT_PATH" = "\"\"";
      "PIPELINE_SERVICE_CLIENT_VERIFY_SSL" = "\"no-ssl\"";
      "PIPELINE_SERVICE_IP_INFO_ENABLED" = "false";
      "RSA_PRIVATE_KEY_FILE_PATH" = "\"./conf/private_key.der\"";
      "RSA_PUBLIC_KEY_FILE_PATH" = "\"./conf/public_key.der\"";
      "SEARCH_TYPE" = " \"elasticsearch\"";
      "SECRET_MANAGER" = "db";
      "SERVER_ADMIN_PORT" = "8586";
      "SERVER_HOST_API_URL" = "http://openmetadata-server:8585/api";
      "SERVER_PORT" = "8585";
      "SMTP_SERVER_ENDPOINT" = "\"\"";
      "SMTP_SERVER_PORT" = "\"\"";
      "SMTP_SERVER_PWD" = "\"\"";
      "SMTP_SERVER_STRATEGY" = "\"SMTP_TLS\"";
      "SMTP_SERVER_USERNAME" = "\"\"";
      "WEB_CONF_CACHE_CONTROL" = "\"\"";
      "WEB_CONF_CONTENT_TYPE_OPTIONS_ENABLED" = "false";
      "WEB_CONF_FRAME_OPTION" = "\"SAMEORIGIN\"";
      "WEB_CONF_FRAME_OPTION_ENABLED" = "false";
      "WEB_CONF_FRAME_ORIGIN" = "\"\"";
      "WEB_CONF_HSTS_ENABLED" = "false";
      "WEB_CONF_HSTS_INCLUDE_SUBDOMAINS" = "\"true\"";
      "WEB_CONF_HSTS_MAX_AGE" = "\"365 days\"";
      "WEB_CONF_HSTS_PRELOAD" = "\"true\"";
      "WEB_CONF_PRAGMA" = "\"\"";
      "WEB_CONF_URI_PATH" = "\"/api\"";
      "WEB_CONF_XSS_CSP_ENABLED" = "false";
      "WEB_CONF_XSS_CSP_POLICY" = "\"default-src 'self'\"";
      "WEB_CONF_XSS_CSP_REPORT_ONLY_POLICY" = "\"\"";
      "WEB_CONF_XSS_PROTECTION_BLOCK" = "true";
      "WEB_CONF_XSS_PROTECTION_ENABLED" = "false";
      "WEB_CONF_XSS_PROTECTION_ON" = "true";
    };
    ports = [
      "8585:8585/tcp"
      "8586:8586/tcp"
    ];
    dependsOn = [
      "execute_migrate_all"
      "openmetadata_elasticsearch"
      "openmetadata_mysql"
    ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=[\"wget\", \"-q\", \"--spider\", \"http://localhost:8586/healthcheck\"]"
      "--network-alias=openmetadata-server"
      "--network=notes_app_net"
    ];
  };
  systemd.services."podman-openmetadata_server" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-notes_app_net.service"
    ];
    requires = [
      "podman-network-notes_app_net.service"
    ];
    partOf = [
      "podman-compose-notes-root.target"
    ];
    wantedBy = [
      "podman-compose-notes-root.target"
    ];
  };

  # Networks
  systemd.services."podman-network-notes_app_net" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f notes_app_net";
    };
    script = ''
      podman network inspect notes_app_net || podman network create notes_app_net --subnet=172.16.240.0/24
    '';
    partOf = [ "podman-compose-notes-root.target" ];
    wantedBy = [ "podman-compose-notes-root.target" ];
  };

  # Volumes
  systemd.services."podman-volume-notes_es-data" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect notes_es-data || podman volume create notes_es-data
    '';
    partOf = [ "podman-compose-notes-root.target" ];
    wantedBy = [ "podman-compose-notes-root.target" ];
  };
  systemd.services."podman-volume-notes_ingestion-volume-dag-airflow" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect notes_ingestion-volume-dag-airflow || podman volume create notes_ingestion-volume-dag-airflow
    '';
    partOf = [ "podman-compose-notes-root.target" ];
    wantedBy = [ "podman-compose-notes-root.target" ];
  };
  systemd.services."podman-volume-notes_ingestion-volume-dags" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect notes_ingestion-volume-dags || podman volume create notes_ingestion-volume-dags
    '';
    partOf = [ "podman-compose-notes-root.target" ];
    wantedBy = [ "podman-compose-notes-root.target" ];
  };
  systemd.services."podman-volume-notes_ingestion-volume-tmp" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect notes_ingestion-volume-tmp || podman volume create notes_ingestion-volume-tmp
    '';
    partOf = [ "podman-compose-notes-root.target" ];
    wantedBy = [ "podman-compose-notes-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-notes-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
