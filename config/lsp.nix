{
  plugins.lsp-format = {
    enable = true;
    lspServersToEnable = [ "efm" "none-ls" "rust_analyzer" ];
  };
  plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        prettierd ={
          enable = true;
          disableTsServerFormatter = true;
        };
        csharpier = {
          enable = true;
          settings = {
            command = "dotnet";
            args = ["csharpier" "format" "--write-stdout"];
          };
        };
      };
      diagnostics = {
        codespell.enable = false;
        protolint.enable = true;
        opentofu_validate.enable = true;

      };
    };
  };
  plugins.lsp-lines.enable = true;
  plugins.lsp-lines.currentLine = true;
  plugins.ltex-extra.enable = true;
  plugins.friendly-snippets.enable = true;
  plugins.lsp = {
    enable = true;
    keymaps = {
      lspBuf = {
        #K = "hover";
        #gD = "references";
        #gd = "definition";
        #gi = "implementation";
        #gt = "type_definition";
        #ca = "code_action";
        #cr = "rename";
      };
    };
    servers = {
      html = {
        enable = true;
      };
      terraform_lsp.enable = true;
      efm.enable = true;
      tailwindcss.enable = true;
      java_language_server.enable = true;
      efm.extraOptions = {
        init_options = {
          documentFormatting = true;
        };
      };
      angularls.enable = true;
      ts_ls = { enable = true; };
      texlab.enable = false;
      #rnix = {
      #  enable = true;
      #};
      pylsp = {
        enable = true;
      };
      omnisharp = {
        enable = true;
        settings = {
          enableImportCompletion = true;
          enableRoslynAnalyzers = true;
        };
      };
      ltex = {
        enable = true;
        filetypes = [ "typescriptreact" "typescript" "csharp" "shellscript" "latex" "markdown" "tex" ];
        settings = {
          language = "en-US";
          enabled = [ "bibtex" "context" "context.tex" "html" "latex" "markdown" "org" "restructuredtext" "rsweave" "javascript" "javascriptreact" "typescript" "typescriptreact" "csharp" "shellscript" "tex" ];
          checkFrequency = "save";
          completionEnabled = false;
        };
      };
      clangd = {
        filetypes = [ "c" "cpp" ];
        enable = true;
      };
      gopls = {
        enable = true;
      };
      eslint = {
        enable = false;
      };
      rust_analyzer = {
        enable = true;
        installRustc = true;
        installCargo = true;
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
      { name = "cmp-dap"; }
      { name = "luasnip"; }
      { name = "buffer"; }
      { name = "nvim_lua"; }
      { name = "path"; }
    ];
  };
  plugins = {
    barbecue.enable = true;
    harpoon = {
      enable = false;
      #enableTelescope = true;
      #keymaps = {
      #  addFile = "<leader>ma";
      #  toggleQuickMenu = "<leader>ml";
      #  cmdToggleQuickMenu = "<leader>mt";
      #  navNext = "<leader>mn";
      #  navPrev = "<leader>mp";
      #};
    };
  };
}
