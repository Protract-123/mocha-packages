local package_version = "0.17.0"

return {
  version = package_version,

  url  = string.format("https://github.com/alacritty/alacritty/releases/download/v%s/Alacritty-v%s-portable.exe#/alacritty.exe", package_version, package_version),
  hash = "5ad70ddc5c2a2bfe84084a2c4c73558e9360914f035a902d7a69277be7249f1f",

  update = { github = "alacritty/alacritty" },

  options = {
    shortcuts = {
      type = "bool", default = true,
      desc = "Create a Start Menu shortcut",
    },
    context_menu = {
      type = "bool", default = false,
      desc = "Add 'Open with Alacritty' to the Explorer context menu",
    },
    working_directory = {
      type = "string", default = "%USERPROFILE%",
      desc = "Directory the shortcut starts Alacritty in",
    },
  },

  -- literal names must exist (error); globs matching nothing only warn
  shims = {
    "alacritty.exe",
    -- "bin/*",   -- glob example
  },

  shortcuts = {
    {
      name     = "Alacritty",
      target   = "alacritty.exe",
      start_in = "{opts.working_directory}",
    },
  },
}
