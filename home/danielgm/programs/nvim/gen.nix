{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = plugin-gen-nvim;
      type = "lua";
    }
  ];
}
