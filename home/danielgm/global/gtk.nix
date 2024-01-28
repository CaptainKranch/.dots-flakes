{
  pkgs,
  config,
  ...
}: {

  gtk = {
    enable = true;

    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };

    font = {
      name = "Roboto";
      package = pkgs.roboto;
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
