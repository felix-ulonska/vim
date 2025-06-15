{ ... }: {
  plugins.floaterm = {
    enable = true;
    settings = {
      keymap_new = "<Leader>tn";
      keymap_prev = "<Leader>tp";
      keymap_next = "<Leader>tn";
      keymap_toggle = "<Leader>tt";
      keymap_kill = "<Leader>tk";
    };
  };
}
