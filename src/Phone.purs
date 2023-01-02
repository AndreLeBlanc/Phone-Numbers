module Phone where

import Prelude

import Countries (Country, CountryPhone, index)
import Data.Array (foldl, replicate)
import Data.Array.NonEmpty (catMaybes)
import Data.Map (lookup)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String (length, uncons)
import Data.String.CodePoints (singleton)
import Data.String.Regex (match)
import Data.String.Regex.Flags (global)
import Data.String.Regex.Unsafe (unsafeRegex)

extractNums :: String -> Maybe String
extractNums num =
  do
    dc <-
      foldl (<>) ""
        <<< catMaybes
        <$> match (unsafeRegex "\\d+" global) num
    pure dc

formatter :: CountryPhone -> String -> Maybe String
formatter cp unformattedNum =
  let
    genSpace :: Int -> String
    genSpace len =
      replicate (len - 1) "_"
        # foldl (<>) ""

    makeFormat :: Maybe String
    makeFormat =
      do
        dc <- extractNums cp.dial_code
        num <- extractNums unformattedNum
        pure ("+" <> (genSpace (length dc)) <> "-" <> (genSpace (length num)))

    -- shorter than format/Extra -
    -- shorter than format/Extra -
    -- shorter than format/Extra -
    -- shorter than format/Extra -
    -- shorter than format/Extra -
    -- shorter than format/Extra -

    getFormat :: Maybe String
    getFormat =
      case cp.format of
        Nothing -> makeFormat
        form -> form

    fillNum :: String -> String -> Maybe String
    fillNum form num =
      do
        forCons <- uncons form
        numCons <- uncons num
        case (singleton forCons.head) == "_" of
          false -> (singleton forCons.head) <> (fillNum forCons.tail num # fromMaybe "")
          true -> (singleton numCons.head) <> (fillNum forCons.tail numCons.tail # fromMaybe "")
          # pure

  in
    do
      form <- getFormat
      dial <- extractNums cp.dial_code
      res <- fillNum form (dial <> unformattedNum)
      pure res

format :: Country -> String -> Maybe String
format country unformattedNum =
  case lookup country index of
    Nothing -> Nothing
    Just cp -> formatter cp unformattedNum

