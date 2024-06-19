{ schema, ... }: {
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./lsp.nix
    ./barbar.nix
    ./keymaps.nix
    ./octo.nix
    ./efmls.nix
    ./toggleterm.nix
    #./lsp-csharp.nix
    #./mason.nix
  ];
  plugins = {
    lualine.enable = true;
    neogen.enable = true;
    chadtree.enable = true;
    noice.enable = true;
    transparent.enable = true;
    lazygit.enable = true;
    obsidian = {
      enable = true;
      settings = {
        dir = "/home/jabbi/Nextcloud/obsidian";
      };
    };
    indent-o-matic.enable = true;
    indent-blankline.enable = true;
    hmts.enable = true;
    #noice = {
    #  lsp = {
    #    hover.enabled = true;
    #    signature.enabled = true;
    #  };
    #};
    nvim-autopairs.enable = true;
    rainbow-delimiters.enable = true;
    treesitter.enable = true;
    treesitter-textobjects.enable = true;
    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
      };
    };
    neogit = {
      enable = true;
    };
  };
  colorschemes.base16.colorscheme = schema;
  colorschemes.base16.enable = true;
  extraConfigLua = ''
    vim.wo.number = true
  '';
}
