import lenientops
import nimraylib_now
import core/game_loop, core/adaptive_camera
import objects/base/transform, objects/base/sprite

type
  PlayerObj {.bycopy.} = object
    transform: transform.Transform
    sprite: Sprite
  Player = ref PlayerObj

var camera = initAdaptiveCamera()
var player: Player = new Player

proc preprocess() =
  player.sprite = new Sprite
  player.sprite.texture = loadTexture("resources/arrow.png")
  player.sprite.anchor = (0.5, 0.5)

  player.transform = new transform.Transform
  player.transform.position = (0.0, 0.0)
  player.transform.scale = (1.0, 1.0)

updateProc = proc() =
  camera.update()
  player.transform.rotation += 100 * getFrameTime()

drawProc = proc() =
  beginMode2D(camera):
    drawTexturePro(player.sprite.texture,
        (0.0, 0.0, player.sprite.texture.width.float, player.sprite.texture.height.float),
        (
          player.transform.position.x.float, 
          player.transform.position.y.float, 
          player.sprite.texture.width.float * player.transform.scale.x, 
          player.sprite.texture.height.float * player.transform.scale.y
        ),
        (
          player.sprite.texture.width.float * player.sprite.anchor.x * player.transform.scale.x, 
          player.sprite.texture.height.float * player.sprite.anchor.y * player.transform.scale.y
        ),
        player.transform.rotation,
        Blue)
  drawFPS(10, 10)

deinitProc = proc() =
  discard

initWindow()
preprocess()
runGameLoop()
