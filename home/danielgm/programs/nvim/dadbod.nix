
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # tpope/vim-dadbod
    {
      plugin = vim-dadbod;
    }
  ];
}
