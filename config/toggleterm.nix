{ ... }: {
  plugins.floaterm = {
    enable = true;
    settings = {
      keymap_new = "<Leader>tn";
      keymap_prev = "<Leader>th";
      keymap_next = "<Leader>tl";
      keymap_toggle = "<Leader>tt";
      keymap_kill = "<Leader>tk";
    };
  };
}
