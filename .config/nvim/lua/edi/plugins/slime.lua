-- plugin for vim slime
return {
  "jpalardy/vim-slime",
  init = function()
    -- https://github.com/jpalardy/vim-slime#tmux
    vim.g.slime_dont_ask_default = 1
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
    -- vim.g.slime_no_mappings = 1
    vim.g.slime_python_ipython = 1


    vim.keymap.set('x', '<enter>', '<Plug>SlimeRegionSend', {})
    vim.keymap.set('n', '<enter>', '<Plug>SlimeParagraphSend', {})
    vim.keymap.set("n", "<c-k>", ":SlimeSend1 clear<CR>")
    -- vim.keymap.set('n', '<C-v>', 'mq_viw<C-c><C-c>`q')
  end,
}
