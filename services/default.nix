{ inputs, outputs, ... }: {
  imports = [
    ./immich.nix
    ./arr.nix
    #./lobe-chat.nix
    ./openMetadata-compose.nix
    ./plex.nix
    ./hoarder.nix
    # DBA & Analytics
    ./mysql.nix
    ./postgresql.nix
    ./cloudbeaver.nix
    #./metabase.nix
    #./plane.nix
    #./airflow.nix
  ];
