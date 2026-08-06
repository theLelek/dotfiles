print("autostart.lua loaded")
hl.on("hyprland.start", function () 
  hl.exec_cmd("hyprpaper")
end)
