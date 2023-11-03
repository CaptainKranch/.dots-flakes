{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = own-plugin-gen-nvim;
      type = "lua";
    }
  ];
}
