import lenientops
import nimraylib_now

type 
  SpriteObj {.bycopy.} = object
    texture*: Texture2D
    anchor*: Vector2
  Sprite* = ref SpriteObj