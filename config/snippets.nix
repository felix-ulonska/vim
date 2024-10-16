{...}: {
  plugins.luasnip.enable = true;
  plugins.luasnip.fromLua = [{
      paths = ./snippets;
      lazyLoad = false;
    }];
  plugins.luasnip.settings = {
    enable_autosnippets = true;
  };
  extraConfigLua = ''
local ls = require "luasnip"
vim.keymap.set({ "i", "s" }, "<A-n>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set({ "i", "s" }, "<A-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
  '';
}
