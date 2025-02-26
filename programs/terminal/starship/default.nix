{ pkgs, lib, ... }:
{
  programs.starship = {
    enable = true;
    settings = {

      format = "$directory$character";
      right_format = "$nix_shell$git_branch$git_status";
      directory = {
        truncation_length = 2;
        truncation_symbol = "…/";
      };

      add_newline = false;

      golang = {
        format = "[ $version] ";
      };

      python = {
        symbol = " ";
        python_binary = "['./venv/bin/python', 'python', 'python3', 'python2']";
        format = "[$symbol ($version)]";
      };

      nix_shell = {
        format = "[$python $golang $symbol]($style) ";
        impure_msg = "";
        symbol = " ";
      };

      character = {
        error_symbol = "[~~>](bold red)";
        success_symbol = "[->>](bold green)";
        vimcmd_symbol = "[<<-](bold yellow)";
        vimcmd_visual_symbol = "[<<-](bold cyan)";
        vimcmd_replace_symbol = "[<<-](bold purple)";
        vimcmd_replace_one_symbol = "[<<-](bold purple)";
      };


      # Icon changes only \/
      directory.read_only = " ";
      docker_context.symbol = " ";
      git_branch.symbol = " ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      package.symbol = "󰏗 ";
    };
  };
}
