-- doom_config - Doom Nvim user configurations file
--
--
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).

-- ADDING A PACKAGE
--
doom.use_package("AndrewRadev/bufferize.vim");
-- doom.use_package("EdenEast/nightfox.nvim", "sainnhe/sonokai")
-- doom.use_package({
--   "ur4ltz/surround.nvim",
--   config = function()
--     require("surround").setup({mappings_style = "sandwich"})
--   end
-- })

-- ADDING A KEYBIND
--
doom.features.lsp.settings.completion.mapping = function(cmp)
return {
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<Up>"] = cmp.mapping.select_prev_item()
  }
end
table.insert(doom.features.telescope.binds, {
  "<leader><space>","<cmd>Telescope find_files<CR>", name = "Find in project"
})

doom.features.explorer.binds = {
  { "<F3>", ":NvimTreeToggle<CR>", name = "Toggle file explorer" },
  {
    "<leader>",
    name = "+prefix",
    {
      {
        "o",
        name = "+open/close",
        {
          { "p", "<cmd>NvimTreeToggle<CR>", name = "Explorer" },
        },
      },
    },
  },
}

doom.use_keybind({
  -- The `name` field will add the keybind to whichkey
  {"<leader>s", name = '+search', {
    -- Bind to a vim command
    {"g", "Telescope grep_string<CR>", name = "Grep project"},
    -- Or to a lua function
    {"p", function()
      print("Not implemented yet")
    end, name = ""}
  }}
})
vim.o.guifont = "JetBrains Mono:h10"
doom.relative_num = false;

-- ADDING A COMMAND
--
-- doom.use_cmd({
--   {"CustomCommand1", function() print("Trigger my custom command 1") end},
--   {"CustomCommand2", function() print("Trigger my custom command 2") end}
-- })

-- ADDING AN AUTOCOMMAND
--
-- doom.use_autocmd({
--   { "FileType", "javascript", function() print('This is a javascript file') end }
-- })

-- vim: sw=2 sts=2 ts=2 expandtab
