
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = vim-dadbod;
      type = "lua";
    }
    {
      plugin = vim-dadbod-ui;
      type = "lua";
      config = ''
        vim.api.nvim_set_keymap('n', '<leader>db', [[:DBUIToggle<CR>]], { noremap = true, silent = true })
      '';
    }
    {
      plugin = vim-dadbod-completion;
      type = "lua";
    }
  ];
}
