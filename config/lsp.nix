{
  plugins.lsp-format = {
    enable = true;
    lspServersToEnable = [ "omnisharp" "efm" ]; 
  };
plugins.lsp-lines.enable = true;
plugins.lsp-lines.currentLine = true;
#plugins.lspsaga.enable = true;
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
        cr = "rename";
      };
    };
    servers = {
      html = {
        enable = true;
      };
      efm.enable = true;
      efm.extraOptions = {
        init_options = {
          documentFormatting = true;
        };
      };
      tsserver = { enable = true;
      };
      rnix-lsp = {
        enable = true;
      };
      pylsp = {
        enable = true;
      };
      omnisharp = {
        enable = true;
      };
      ltex = {
        enable = true;
	settings = {
		language = "en-EN";
	};
      };
      clangd = {
        enable = true;
      };
      gopls = {
        enable = true;
      };
      eslint = {
        enable = false;
      };
      typst-lsp.enable = true;
      rust-analyzer = {
        enable = true;
	installRustc = true;
      };
    };
  };
  plugins.cmp = {
    enable = true;
    settings.mapping = {
    "<CR>" = "cmp.mapping.confirm({ select = true })";
  "<C-Space>" = "cmp.mapping.complete()";
  "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
    };
    settings.sources = [
      { name = "nvim_lsp"; }
      { name = "luasnip"; }
      { name = "buffer"; }
      { name = "nvim_lua"; }
      { name = "path"; }
    ];
  };
  plugins = {
   barbecue.enable = true; 
   harpoon = {
     enable = true;
     enableTelescope = true;
     keymaps = {
       addFile = "<leader>ma";
       toggleQuickMenu = "<leader>ml";
       cmdToggleQuickMenu = "<leader>mt";
       navNext = "<leader>mn";
       navPrev = "<leader>mp";
     };
   };
  };
}
