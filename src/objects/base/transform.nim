import lenientops
import nimraylib_now

type
  TransformObj {.bycopy.} = object
    position*: Vector2
    rotation*: float
    scale*: Vector2
  Transform* = ref TransformObj