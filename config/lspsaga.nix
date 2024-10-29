{...}: {
  plugins.lspsaga = {
    enable = true;
    lightbulb.enable = false;
  };
  keymaps = [
    {
      action = "<cmd>Lspsaga outline<cr>";
      key = "<leader>co";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga finder<cr>";
      key = "<leader>cl";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga rename<cr>";
      key = "<leader>cr";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga goto_definition<cr>";
      key = "gd";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga hover_doc<cr>";
      key = "K";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga hover_doc<cr>";
      key = "K";
      mode = "n";
    }
  ];
}
