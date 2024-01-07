{
  plugins.lsp = {
    enable = true;
    keymaps = {
      lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
        ca = "code_action";
      };
    };
    servers = {
      html = {
        enable = true;
      };
      tsserver = {
        enable = true;
      };
    };
  };
  plugins.nvim-cmp = {
    enable = true;
    mapping = {
    "<CR>" = "cmp.mapping.confirm({ select = true })";
    "<Tab>" = {
      action = ''
        function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end
      '';
      modes = [
        "i"
        "s"
      ];
    };
  };
  sources = [
    { name = "nvim_lsp"; }
    { name = "luasnip"; }
    { name = "buffer"; }
    { name = "nvim_lua"; }
    { name = "path"; }
  ];
};
}
