{ inputs, pkgs, ... }: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          gen-nvim = prev.vimUtils.buildVimPlugin {
            name = "gen.nvim";
            src = inputs.plugin-gen-nvim;
          };
        };
      })
    ];
  };
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = gen-nvim;
      type = "lua";
      config = ''
        require('gen').model = 'llama2'
        require('gen').command = 'docker exec -it ollama ollama run llama2'
        vim.keymap.set('v', '<leader>]', ':Gen<CR>')
        vim.keymap.set('n', '<leader>]', ':Gen<CR>')
      '';
    }
  ];
}
