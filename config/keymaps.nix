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
  ];
}
