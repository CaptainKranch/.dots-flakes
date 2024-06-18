{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = scope-nvim;
      type = "lua";
      config = /* lua */ ''
        require('scope').setup{}
      '';
    }
  ];
}
