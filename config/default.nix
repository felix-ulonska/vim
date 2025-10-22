{ schema, ... }: {
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./lsp.nix
    ./barbar.nix
    ./keymaps.nix
    ./efmls.nix
    ./toggleterm.nix
    ./hop.nix
    ./dotnet.nix
    ./snippets.nix
    ./lspsaga.nix
    ./dap.nix
    #./lsp-csharp.nix
    #./mason.nix
  ];
  plugins = {
    ansiesc.enable = true;
    lualine.enable = true;
    neogen.enable = true;
    chadtree.enable = true;
    web-devicons.enable = true;
    noice = {
      enable = false;
      messages.enabled = false;
      notify.enabled = false;
    };
    transparent.enable = true;
    lazygit.enable = true;
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
      extensions.fzy-native.enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fw" = "lsp_workspace_symbols";
        "<leader>fd" = "lsp_document_symbols";
        "<leader>lm" = ''lsp_dynamic_workspace_symbols symbols={"method","function"}'';
        "<leader>lc" = ''lsp_dynamic_workspace_symbols symbols={"class"}'';
        "<leader>li" = ''lsp_dynamic_workspace_symbols symbols={"interface"}'';
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
