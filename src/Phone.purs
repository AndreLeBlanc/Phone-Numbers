module Phone where

import Prelude

import Countries (Country, CountryPhone, index)
import Data.Array (foldl, replicate)
import Data.Array.NonEmpty (catMaybes)
import Data.Map (lookup)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String (length, take, drop, uncons, splitAt)
import Data.String.CodePoints (singleton)
import Data.String.Regex (match)
import Data.String.Regex.Flags (global)
import Data.String.Regex.Unsafe (unsafeRegex)

{-
  Retains only the digits in a string, returing Nothing if the resulting string is empty. 
-}
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
    makeFormat :: Maybe String
    makeFormat =
      do
        dc <- extractNums cp.dial_code
        "+" <> (replicate ((length dc) - 1) "_" # foldl (<>) "") <> " "
          # pure

    getFormat :: Maybe String
    getFormat =
      case cp.format of
        Nothing -> makeFormat
        form -> form

    fillNum :: String -> String -> Maybe String
    fillNum form num =
      do
        let forCons = splitAt 1 form
        numCons <- uncons num
        case forCons.before == "_" || forCons.before == "" of
          false -> forCons.before <> (fillNum forCons.after num # fromMaybe "")
          true -> (singleton numCons.head) <> (fillNum forCons.after numCons.tail # fromMaybe "")
          # pure

    removeDialCode :: String -> String -> Maybe String
    removeDialCode rawNum dial =
      do
        nums <- extractNums rawNum
        noDial <- case (take 1 rawNum == "+") && (take (length dial) nums) == dial of
          true -> if length nums > length cp.dial_code then drop (length dial) nums # Just else Nothing
          false ->
            case (take 1 rawNum /= "+") && (take (length dial + 2) nums) == "00" <> dial of
              true -> if length nums > length dial + 2 then drop (length dial + 2) nums # Just else Nothing
              false -> Just nums
        pure noDial

  in
    do
      form <- getFormat
      dial <- extractNums cp.dial_code
      withoutDialCode <- removeDialCode unformattedNum dial
      res <- fillNum form (dial <> withoutDialCode)
      pure res

{-
  Formats a number using the dialcode and format used by given country. The number may already contain the
  dialcode or 00 instead of the plus-sign. 

  The output must contain more than the dialcode in order to return a Just. 
  format Sweden "123542789" = "+46 12 354 27 89"
  format Germany  "+49" = Nothing
  
  A multitude of additional examples can be found in test/Main.purs
-}
format :: Country -> String -> Maybe String
format country unformattedNum =
  do
    cp <- lookup country index
    res <- formatter cp unformattedNum
    pure res

{-
  Format a number using a custom dial code and format. 
  Returns Nothing if dial or form are empty.
-}
customFormat :: String -> String -> String -> Maybe String
customFormat dial form unformattedNum =
  case form == "" of
    false -> formatter { code: "XX", dial_code: dial, format: (Just form) } unformattedNum
    true -> Nothing