{ config, pkgs, ... }:

{
  services.apache-airflow = {
    enable = true;
    package = pkgs.apache-airflow;

    webserver = {
      enable = true;
      port = 8080;
    };

    scheduler = {
      enable = true;
    };

    dags = {
      path = "/home/danielgm/Documents/analytics/apps/airflow/dags/";
    };

    environment = {
      AIRFLOW__CORE__LOAD_EXAMPLES = "False";
    };
  };
}
