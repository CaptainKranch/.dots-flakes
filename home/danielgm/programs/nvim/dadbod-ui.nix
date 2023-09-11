
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    vim-dadbod
    vim-dadbod-completion
    {
      plugin = vim-dadbod-ui;
      type = "lua";
    }
  ];
}
