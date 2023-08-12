return {
  "folke/flash.nvim",
  enabled = false,
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    label = {
      uppercase = false
    },
    highlight = {
      backdrop = false,
    },
    modes = {
      search = {
        highlight = { backdrop = false },
      },
      char = {
        highlight = { backdrop = false },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
