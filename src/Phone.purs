module Phone where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Data.Tuple (Tuple(..))
import Data.Map (fromFoldable, lookup, Map, update)

main :: Effect Unit
main = do
  log "🍝"
