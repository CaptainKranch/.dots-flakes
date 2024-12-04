{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = lazygit-nvim;
      type = "lua";
      config = /* lua */ ''
        vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
      '';
    }
  ];
}
