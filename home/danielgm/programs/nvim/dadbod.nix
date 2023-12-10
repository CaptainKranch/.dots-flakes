{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = vim-dadbod;
    }
    {
      plugin = vim-dadbod-ui;
      type = "lua";
      config = ''
        vim.api.nvim_set_keymap('n', '<leader>db', [[:DBUIToggle<CR>]], { noremap = true, silent = true })
        vim.g.db_ui_use_nerd_fonts = 1
      '';
    }
  ];
}
