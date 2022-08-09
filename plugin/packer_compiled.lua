-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/emi2k01/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/emi2k01/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/emi2k01/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/emi2k01/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/emi2k01/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\0025\3\a\0=\3\b\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\6\0\0\blua\trust\15typescript\15javascript\btsx\28nvim-treesitter.configs\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["guess-indent.nvim"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/NMAC427/guess-indent.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n�\1\0\0\n\1\t\0)-\0\0\0009\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1\"�\18\3\0\0009\1\2\0'\4\3\0B\1\3\2\18\4\0\0009\2\2\0'\5\4\0B\2\3\2\15\0\2\0X\3\6�\18\3\1\0'\4\5\0\18\5\2\0&\3\5\3\14\0\3\0X\4\1�\18\3\1\0\18\4\1\0004\5\3\0004\6\3\0'\a\6\0\18\b\3\0'\t\a\0&\a\t\a>\a\1\6>\6\1\0054\6\3\0'\a\b\0\18\b\4\0'\t\a\0&\a\t\a>\a\1\6>\6\2\5L\5\2\0K\0\1\0\0�\a</\6>\6<\6 \24^<?[^%s]*%s+(.-)>?$\16^<?([^%s]*)\nmatch\25Enter the HTML tag: \14get_input7\0\0\3\1\2\0\4-\0\0\0009\0\0\0005\2\1\0D\0\2\0\0�\1\0\1\15textobject\6t\18get_selection�\1\0\0\a\1\6\0!-\0\0\0009\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1\26�\18\3\0\0009\1\2\0'\4\3\0B\1\3\2\18\4\0\0009\2\2\0'\5\4\0B\2\3\2\15\0\2\0X\3\6�\18\3\1\0'\4\5\0\18\5\2\0&\3\5\3\14\0\3\0X\4\1�\18\3\1\0\18\4\1\0004\5\3\0004\6\3\0>\3\1\6>\6\1\0054\6\3\0>\4\1\6>\6\2\5L\5\2\0K\0\1\0\0�\6 \24^<?[^%s]*%s+(.-)>?$\16^<?([^%s]*)\nmatch\25Enter the HTML tag: \14get_input�\1\0\0\n\1\t\0)-\0\0\0009\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1\"�\18\3\0\0009\1\2\0'\4\3\0B\1\3\2\18\4\0\0009\2\2\0'\5\4\0B\2\3\2\15\0\2\0X\3\6�\18\3\1\0'\4\5\0\18\5\2\0&\3\5\3\14\0\3\0X\4\1�\18\3\1\0\18\4\1\0004\5\3\0004\6\3\0'\a\6\0\18\b\3\0'\t\a\0&\a\t\a>\a\1\6>\6\1\0054\6\3\0'\a\b\0\18\b\4\0'\t\a\0&\a\t\a>\a\1\6>\6\2\5L\5\2\0K\0\1\0\0�\a</\6>\6<\6 \24^<?[^%s]*%s+(.-)>?$\16^<?([^%s]*)\nmatch\25Enter the HTML tag: \14get_input7\0\0\3\1\2\0\4-\0\0\0009\0\0\0005\2\1\0D\0\2\0\0�\1\0\1\15textobject\6t\18get_selection�\1\0\0\a\1\6\0!-\0\0\0009\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1\26�\18\3\0\0009\1\2\0'\4\3\0B\1\3\2\18\4\0\0009\2\2\0'\5\4\0B\2\3\2\15\0\2\0X\3\6�\18\3\1\0'\4\5\0\18\5\2\0&\3\5\3\14\0\3\0X\4\1�\18\3\1\0\18\4\1\0004\5\3\0004\6\3\0>\3\1\6>\6\1\0054\6\3\0>\4\1\6>\6\2\5L\5\2\0K\0\1\0\0�\6 \24^<?[^%s]*%s+(.-)>?$\16^<?([^%s]*)\nmatch\25Enter the HTML tag: \14get_input�\2\1\0\b\0\23\0!6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\21\0005\4\r\0005\5\5\0003\6\4\0=\6\6\0053\6\a\0=\6\b\0055\6\t\0003\a\n\0=\a\v\6=\6\f\5=\5\14\0045\5\16\0003\6\15\0=\6\6\0053\6\17\0=\6\b\0055\6\18\0003\a\19\0=\a\v\6=\6\f\5=\5\20\4=\4\22\3B\1\2\0012\0\0�K\0\1\0\14surrounds\1\0\0\6T\0\1\0\1\vtarget\29^<([^>]*)().-([^/]*)()>$\0\1\0\1\vdelete\25^(%b<>)().-(%b<>)()$\0\6t\1\0\0\vchange\16replacement\0\1\0\1\vtarget\31^<([^%s>]*)().-([^/]*)()>$\tfind\0\badd\1\0\1\vdelete\25^(%b<>)().-(%b<>)()$\0\nsetup\18nvim-surround\25nvim-surround.config\frequire\0" },
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window.git"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/nvim-window.git",
    url = "https://gitlab.com/yorickpeterse/nvim-window"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/emi2k01/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n�\1\0\0\n\1\t\0)-\0\0\0009\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1\"�\18\3\0\0009\1\2\0'\4\3\0B\1\3\2\18\4\0\0009\2\2\0'\5\4\0B\2\3\2\15\0\2\0X\3\6�\18\3\1\0'\4\5\0\18\5\2\0&\3\5\3\14\0\3\0X\4\1�\18\3\1\0\18\4\1\0004\5\3\0004\6\3\0'\a\6\0\18\b\3\0'\t\a\0&\a\t\a>\a\1\6>\6\1\0054\6\3\0'\a\b\0\18\b\4\0'\t\a\0&\a\t\a>\a\1\6>\6\2\5L\5\2\0K\0\1\0\0�\a</\6>\6<\6 \24^<?[^%s]*%s+(.-)>?$\16^<?([^%s]*)\nmatch\25Enter the HTML tag: \14get_input7\0\0\3\1\2\0\4-\0\0\0009\0\0\0005\2\1\0D\0\2\0\0�\1\0\1\15textobject\6t\18get_selection�\1\0\0\a\1\6\0!-\0\0\0009\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1\26�\18\3\0\0009\1\2\0'\4\3\0B\1\3\2\18\4\0\0009\2\2\0'\5\4\0B\2\3\2\15\0\2\0X\3\6�\18\3\1\0'\4\5\0\18\5\2\0&\3\5\3\14\0\3\0X\4\1�\18\3\1\0\18\4\1\0004\5\3\0004\6\3\0>\3\1\6>\6\1\0054\6\3\0>\4\1\6>\6\2\5L\5\2\0K\0\1\0\0�\6 \24^<?[^%s]*%s+(.-)>?$\16^<?([^%s]*)\nmatch\25Enter the HTML tag: \14get_input�\1\0\0\n\1\t\0)-\0\0\0009\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1\"�\18\3\0\0009\1\2\0'\4\3\0B\1\3\2\18\4\0\0009\2\2\0'\5\4\0B\2\3\2\15\0\2\0X\3\6�\18\3\1\0'\4\5\0\18\5\2\0&\3\5\3\14\0\3\0X\4\1�\18\3\1\0\18\4\1\0004\5\3\0004\6\3\0'\a\6\0\18\b\3\0'\t\a\0&\a\t\a>\a\1\6>\6\1\0054\6\3\0'\a\b\0\18\b\4\0'\t\a\0&\a\t\a>\a\1\6>\6\2\5L\5\2\0K\0\1\0\0�\a</\6>\6<\6 \24^<?[^%s]*%s+(.-)>?$\16^<?([^%s]*)\nmatch\25Enter the HTML tag: \14get_input7\0\0\3\1\2\0\4-\0\0\0009\0\0\0005\2\1\0D\0\2\0\0�\1\0\1\15textobject\6t\18get_selection�\1\0\0\a\1\6\0!-\0\0\0009\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1\26�\18\3\0\0009\1\2\0'\4\3\0B\1\3\2\18\4\0\0009\2\2\0'\5\4\0B\2\3\2\15\0\2\0X\3\6�\18\3\1\0'\4\5\0\18\5\2\0&\3\5\3\14\0\3\0X\4\1�\18\3\1\0\18\4\1\0004\5\3\0004\6\3\0>\3\1\6>\6\1\0054\6\3\0>\4\1\6>\6\2\5L\5\2\0K\0\1\0\0�\6 \24^<?[^%s]*%s+(.-)>?$\16^<?([^%s]*)\nmatch\25Enter the HTML tag: \14get_input�\2\1\0\b\0\23\0!6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\21\0005\4\r\0005\5\5\0003\6\4\0=\6\6\0053\6\a\0=\6\b\0055\6\t\0003\a\n\0=\a\v\6=\6\f\5=\5\14\0045\5\16\0003\6\15\0=\6\6\0053\6\17\0=\6\b\0055\6\18\0003\a\19\0=\a\v\6=\6\f\5=\5\20\4=\4\22\3B\1\2\0012\0\0�K\0\1\0\14surrounds\1\0\0\6T\0\1\0\1\vtarget\29^<([^>]*)().-([^/]*)()>$\0\1\0\1\vdelete\25^(%b<>)().-(%b<>)()$\0\6t\1\0\0\vchange\16replacement\0\1\0\1\vtarget\31^<([^%s>]*)().-([^/]*)()>$\tfind\0\badd\1\0\1\vdelete\25^(%b<>)().-(%b<>)()$\0\nsetup\18nvim-surround\25nvim-surround.config\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\0025\3\a\0=\3\b\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\6\0\0\blua\trust\15typescript\15javascript\btsx\28nvim-treesitter.configs\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
