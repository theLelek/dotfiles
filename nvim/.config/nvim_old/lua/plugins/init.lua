-- lua/plugins/rose-pine.lua
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.3",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "java", "python", "cpp", "html", "css", "bash", "javascript", "markdown", "json"},
        highlight = { enable = true },
      })
    end,
  },
}
