import lenientops
import nimraylib_now
import ../config/window_config

type AdaptiveCamera* = Camera2D

proc initAdaptiveCamera*() : AdaptiveCamera =
  result = Camera2D(target: (0.0, 0.0),
                    offset: (getScreenWidth() * 0.5, getScreenHeight() * 0.5),
                    rotation: 0,
                    zoom: 1.0)

proc update*(self: var AdaptiveCamera) =
  self.offset = (getScreenWidth() * 0.5, getScreenHeight() * 0.5)
  self.zoom = min(getScreenWidth() / VIEWPORT_WIDTH, getScreenHeight() / VIEWPORT_HEIGHT)