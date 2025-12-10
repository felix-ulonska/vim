{ pkgs, dap-cs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "dap-cs";
      src = dap-cs;
    })
  ];
  plugins.cmp-dap.enable = true;
  extraConfigLua = ''

    require('dap-cs').setup({
      dap_configurations = {
        {
          -- Must be "coreclr" or it will be ignored by the plugin
          type = "coreclr",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      netcoredbg = {
        path = "${pkgs.netcoredbg}/bin/netcoredbg" 
      },
    });'';
  plugins.dap = {
    enable = true;
    #adapters = {
    #  executables = {
    #    "coreclr" = {
    #      command = "${pkgs.netcoredbg}/bin/netcoredbg";
    #      args = ["--interpreter=vscode"];
    #    };
    #  };
    #};
    #configurations = {
    #  "cs" = [{
    #    name = "launch = netcoredbg";
    #    request = "launch";
    #    type = "coreclr";
    #    program = ''function()
    #  re#turn vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    #end'#';
    #  }];
    #};
  };
  keymaps = [
    {
      action = "<cmd>lua require'dap'.continue()<cr>";
      key = "<F5>";
      mode = "n";
    }
    {
      action = "<cmd>lua require'dap'.step_over()<cr>";
      key = "<F10>";
      mode = "n";
    }
    {
      action = "<cmd>lua require'dap'.step_into()<cr>";
      key = "<F11>";
      mode = "n";
    }
    {
      action = "<cmd>lua require'dap'.step_out()<cr>";
      key = "<F12>";
      mode = "n";
    }
    {
      action = "<cmd>lua require'dap'.toggle_breakpoint()<cr>";
      key = "<leader>b";
      mode = "n";
    }
    {
      action = "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>";
      key = "<leader>B";
      mode = "n";
    }
    {
      action = "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>";
      key = "<leader>lp";
      mode = "n";
    }
    {
      action = "<cmd>lua require'dap'.repl.open()<cr>";
      key = "<leader>dr";
      mode = "n";
    }
    {
      action = "<cmd>lua require'dap'.run_last()<cr>";
      key = "<leader>dl";
      mode = "n";
    }
  ];
}
