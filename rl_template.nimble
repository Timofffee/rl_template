# Package

version       = "0.1.0"
author        = "Timofffee"
description   = "Raylib template"
license       = "MIT"
srcDir        = "src"
bin           = @["rl_template"]


# Dependencies

requires "nim >= 1.4.8"

task pc, "Build for standalone":
  exec "nim --out:game c -r src/game.nim"

task web, "Build for web":
  exec "nim -d:emscripten c src/game.nim"