import nimraylib_now
import ../config/window_config

var
  updateProc*: proc() = nil
  drawProc*: proc() = nil
  deinitProc*: proc() = nil

proc initWindow*() =
  setConfigFlags(ConfigFlags.WINDOW_RESIZABLE)
  initWindow(SCREEN_WIDTH, SCREEN_HEIGHT, WINDOW_TITLE)
  setTargetFPS(60)

proc gameLoop() {.cdecl.} =
  updateProc()
  beginDrawing():
    clearBackground(White)
    drawProc()

proc runGameLoop*() =

  when defined(emscripten):
    emscriptenSetMainLoop(gameLoop, 0, 1)
  else:
    while not windowShouldClose():
      gameLoop()
  
  deinitProc()