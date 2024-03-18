{
  globals = {
    "mapleader" = " ";
  };
  keymaps = [
    {
      action = "<esc>";
      key = "jk";
      mode = "i";
    }
    {
      action = "<cmd>CHADopen<cr>";
      key = "<leader>e";
    }
    {
      action = "vim.lsp.buf.formatting()";
      key = "<leader>cf";
      mode = "n";
    }
    {
      action = "<cmd>Octo pr list<cr>";
      key = "<leader>pl";
      mode = "n";
    }
    {
      action = "<cmd>Octo thread resolve<cr>";
      key = "<leader>tr";
      mode = "n";
    }
    {
      action = "<cmd>Octo thread unresolve<cr>";
      key = "<leader>tu";
      mode = "n";
    }
    {
      action = "<cmd>Neogit<cr>";
      key = "<leader>g";
      mode = "n";
    }
  ];
}
