{ config, pkgs, ... }:

{
  services.httpd = {
    enable = true;
    adminAddr = "webmaster@example.com";
    # ... other options ...
  };
}
