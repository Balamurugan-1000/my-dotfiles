return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = table.concat({
          " █████  ███████ ████████ ██████   ██████ ",
          "██   ██ ██         ██    ██   ██ ██    ██",
          "███████ ███████    ██    ██████  ██    ██",
          "██   ██      ██    ██    ██   ██ ██    ██",
          "██   ██ ███████    ██    ██   ██  ██████ ",
          "",
          "███    ██ ██    ██ ██ ███    ███",
          "████   ██ ██    ██ ██ ████  ████",
          "██ ██  ██ ██    ██ ██ ██ ████ ██",
          "██  ██ ██  ██  ██  ██ ██  ██  ██",
          "██   ████   ████   ██ ██      ██",
        }, "\n"),
        actions = {
          { icon = "👾 ", desc = "Activate Alien (Projects)", action = "Telescope projects" },
          { icon = "🧬 ", desc = "DNA Scan (Find Files)", action = "Telescope find_files" },
          { icon = "🔬 ", desc = "Analyze Logs (Live Grep)", action = "Telescope live_grep" },
          { icon = "🧠 ", desc = "Memory Recall (Recent Files)", action = "Telescope oldfiles" },
          { icon = "🛠️ ", desc = "Tweak Omnitrix (Config)", action = "edit $MYVIMRC" },
          { icon = "⚡ ", desc = "Power Core (Lazy Plugins)", action = "Lazy" },
        },
      },
    },
  },
}
