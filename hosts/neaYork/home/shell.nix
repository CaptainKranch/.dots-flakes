{...}: {
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
  };

  home.shellAliases = {
    k = "kubectl";
    ll = "ls -la";

    urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
    urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
  };
}
