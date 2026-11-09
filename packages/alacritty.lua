local package_version = "0.17.0"

return {
    version   = package_version,

    artifacts = {
        alacritty = {
            url = ("https://github.com/alacritty/alacritty/releases/download/v%s/Alacritty-v%s-portable.exe"):format(
                package_version, package_version),
            hash = "5ad70ddc5c2a2bfe84084a2c4c73558e9360914f035a902d7a69277be7249f1f",
            as = "alacritty.exe"
        }
    },

    options   = {
        shortcut = {
            default = true,
            desc = "Create a Start Menu shortcut",
        },
        working_directory = {
            default = "%USERPROFILE%",
            desc = "Directory the shortcut starts Alacritty in",
        },
    },

    install   = function(ctx, opts)
        ctx.shim("alacritty.exe")
        if opts.shortcut then
            ctx.shortcut("Alacritty", "alacritty.exe")
        end
    end
}
