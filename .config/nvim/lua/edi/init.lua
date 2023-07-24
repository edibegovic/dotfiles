
require("edi.packer")

if not vim.g.vscode then
  require("edi.treesitter")
  require("edi.colors")
end

require("edi.remap")
require("edi.plugin_conf")
