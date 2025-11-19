function theme(theme)
  if theme == "vscode" then
    require("config.vscode")
  else
    require("config.tokyonight")
  end
end

theme("tokyonight")
