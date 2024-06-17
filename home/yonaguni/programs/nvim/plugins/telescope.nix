{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # telescope-nvim
    {
      plugin = telescope-nvim;
      type = "lua";
      config = /* lua */ ''
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', 'ff', builtin.find_files, {})
        vim.keymap.set('n', 'fb', builtin.buffers, {})
        vim.keymap.set('n', 'fh', builtin.help_tags, {})
        vim.keymap.set('n',  '<leader>ps', function()
          builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
      '';
    }
  ];
}
