module Test.Main where

import Prelude

import Countries (Country(..), codeStringToCountry, countryToString, index, stringToCountry)
import Data.Map (lookup)
import Data.Maybe (Maybe(..), fromMaybe)
import Effect (Effect)
import Phone (customFormat, extractNums, format)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

stringMapCodeCountry :: String -> Country
stringMapCodeCountry str =
  let
    run =
      do
        cp <- lookup (stringToCountry str) index
        pure (codeStringToCountry cp.code)
  in
    fromMaybe (Other "failed") run

main ∷ Effect Unit
main =
  runTest do
    suite "String to Country" do
      test "Sweden" do
        Assert.equal (stringToCountry "Sweden")
          $ Sweden
      test "Afghanistan" do
        Assert.equal (stringToCountry "Afghanistan")
          $ Afghanistan
      test "Zimbabwe" do
        Assert.equal (stringToCountry "Zimbabwe")
          $ Zimbabwe
      test "Antigua and Barbuda" do
        Assert.equal (stringToCountry "Antigua and Barbuda")
          $ Antigua_and_Barbuda
      test "else" do
        Assert.equal (stringToCountry "else")
          $ Other "else"

    suite "Country to String" do
      test "Sweden" do
        Assert.equal (countryToString Sweden)
          $ "Sweden"
      test "Afghanistan" do
        Assert.equal (countryToString Afghanistan)
          $ "Afghanistan"
      test "Zimbabwe" do
        Assert.equal (countryToString Zimbabwe)
          $ "Zimbabwe"
      test "Antigua_and_Barbuda" do
        Assert.equal (countryToString Antigua_and_Barbuda)
          $ "Antigua and Barbuda"
      test "else" do
        Assert.equal (countryToString (Other "else"))
          $ "else"

    suite "string Map code country" do
      test "Sweden" do
        Assert.equal Sweden
          $ stringMapCodeCountry "Sweden"
      test "Germany" do
        Assert.equal Germany
          $ stringMapCodeCountry "Germany"
      test "Canada" do
        Assert.equal Canada
          $ stringMapCodeCountry "Canada"
      test "Botswana" do
        Assert.equal Botswana
          $ stringMapCodeCountry "Botswana"
      test "South Korea" do
        Assert.equal South_Korea
          $ stringMapCodeCountry "South Korea"
      test "testland" do
        Assert.equal (Other "failed")
          $ stringMapCodeCountry "testland"
      test "Bosnia and Herzegovina" do
        Assert.equal Bosnia_and_Herzegovina
          $ stringMapCodeCountry "Bosnia and Herzegovina"
      test "Democratic Republic of the Congo" do
        Assert.equal Democratic_Republic_of_the_Congo
          $ stringMapCodeCountry "Democratic Republic of the Congo"
      test "Turks and Caicos Islands" do
        Assert.equal Turks_and_Caicos_Islands
          $ stringMapCodeCountry "Turks and Caicos Islands"
      test "British Virigin Islands" do
        Assert.equal British_Virgin_Islands
          $ stringMapCodeCountry "British Virgin Islands"
      test "New Zealand" do
        Assert.equal New_Zealand
          $ stringMapCodeCountry "New Zealand"

    suite "extract numbers" do
      test "Swedish num" do
        extractNums "+46 123542"
          # Assert.equal $ Just "46123542"
      test "empty num" do
        extractNums ""
          # Assert.equal $ Nothing
      test "sentence" do
        extractNums "this is a sentence"
          # Assert.equal $ Nothing
      test "symbols" do
        extractNums "!#)¤!#)=|^***:;:;;:¡@£$€£€£$$€¥{€¥[[¥]{[]}][}[}]{[][¥[€¥{€{$¥€¥£€£$€$@$@$@£#"
          # Assert.equal $ Nothing
      test "symbols with nums" do
        extractNums "!#)¤!#)=3|^**4*:;5:;7;:¡@£$€7£€8£$9$€¥{€¥[[¥]{[]}][}[}]{[][¥[€¥{€{$¥€¥£€£$€$@$@$@£#"
          # Assert.equal $ Just "3457789"
      test "German num" do
        extractNums "+49 30 901820"
          # Assert.equal $ Just "4930901820"
      test "Canadian num" do
        extractNums "+1 604 555 5555"
          # Assert.equal $ Just "16045555555"

    suite "format numbers given without dialcode" do
      test "Swedish num" do
        format Sweden "123542"
          # Assert.equal $ Just "+46 12 354 2"
      test "empty num" do
        format Germany ""
          # Assert.equal $ Nothing
      test "sentence" do
        format Ukraine "this is a sentence"
          # Assert.equal $ Nothing
      test "symbols" do
        format Switzerland "!#)¤!#)=|^***:;:;;:¡@£$€£€£$$€¥{€¥[[¥]{[]}][}[}]{[][¥[€¥{€{$¥€¥£€£$€$@$@$@£#"
          # Assert.equal $ Nothing
      test "symbols with nums" do
        format Gabon "!#)¤!#)=3|^**4*:;5:;7;:¡@£$€7£€8£$9$€¥{€¥[[¥]{[]}][}[}]{[][¥[€¥{€{$¥€¥£€£$€$@$@$@£#"
          # Assert.equal $ Just "+241 3457789"
      test "German num" do
        format Germany "30901820"
          # Assert.equal $ Just "+49 309 01820"
      test "Canadian num" do
        format Canada "45555555"
          # Assert.equal $ Just "+1 (455) 555-55"
      test "Swedish num nine digits" do
        format Sweden "123542789"
          # Assert.equal $ Just "+46 12 354 27 89"
      test "Spain" do
        format Spain "919930814"
          # Assert.equal $ Just "+34 919 930 814"
      test "sentence" do
        format Thailand "2134567"
          # Assert.equal $ Just "+66 2134567"
      test "Trinidad and Tobago" do
        format Trinidad_and_Tobago "1234567"
          # Assert.equal $ Just "+1 868 1234567"
      test "Turkey" do
        format Turkey "2426861544"
          # Assert.equal $ Just "+90 242 686 15 44"
      test "United Kingdom" do
        format United_Kingdom "1632960091"
          # Assert.equal $ Just "+44 1632 960091"
      test "Russia num" do
        format Russia "4013989892"
          # Assert.equal $ Just "+7 401 398-98-92"

    suite " number contains spaces" do
      test "Italy" do
        format Italy "069 6784343"
          # Assert.equal $ Just "+39 069 6784343"
      test "Japan" do
        format Japan "78-112-4535 "
          # Assert.equal $ Just "+81 781 12 4535"
      test "Jordan" do
        format Jordan "1-2 3 - 4 5 -33"
          # Assert.equal $ Just "+962 1234533"

    suite " number includes dial code" do
      test "Italy" do
        format Italy "+39 0696784343"
          # Assert.equal $ Just "+39 069 6784343"
      test "Ireland" do
        format Ireland "+353 12340123"
          # Assert.equal $ Just "+353 12 340123"
      test "Kazakhstan" do
        format Kazakhstan "+7 432 123-32-45"
          # Assert.equal $ Just "+7 432 123-32-45"
      test "United States" do
        format United_States "+1 (123) 546-678"
          # Assert.equal $ Just "+1 (123) 546-678"
      test "Vietnam" do
        format Vietnam "0084 098432347"
          # Assert.equal $ Just "+84 098432347"
      test "British Virgin Islands" do
        format British_Virgin_Islands "001284 1 2 3 4 5 6 7 7 8 9"
          # Assert.equal $ Just "+1 284 1234567789"
      test "British Virgin Islands, space dial code" do
        format British_Virgin_Islands "001 284 1 2 3 4 5 6 7 7 8 9"
          # Assert.equal $ Just "+1 284 1234567789"
      test "Germany +" do
        format Germany "+49"
          # Assert.equal $ Nothing
      test "Germany 00" do
        format Germany "0049"
          # Assert.equal $ Nothing
      test "Poland 00" do
        format Poland "0 0 4 8"
          # Assert.equal $ Nothing
      test "Poland 0-0" do
        format Poland "0-0-4 8"
          # Assert.equal $ Nothing
      test "Poland 0-0 num" do
        format Poland "0-0-4 8 123-123-123"
          # Assert.equal $ Just "+48 123-123-123"
      test "Romania" do
        format Romania "40 0987654321"
          # Assert.equal $ Just "+40 400987654321"
      test "Romania false 00" do
        format Romania "00 0987654321"
          # Assert.equal $ Just "+40 000987654321"
      test "Romania wrong country code" do
        format Romania "0048 0987654321"
          # Assert.equal $ Just "+40 00480987654321"

    suite "Custom format"
      do
        test "blank" do
          customFormat "" "" ""
            # Assert.equal $ Nothing
        test "blank num and dialcode" do
          customFormat "" "+_ ___ ____" ""
            # Assert.equal $ Nothing
        test "format only contains dialcode" do
          customFormat "+46" "+__" "1234456"
            # Assert.equal $ Just "+461234456"
        test "blank format" do
          customFormat "+46" "" "1234456"
            # Assert.equal $ Nothing
        test "blank  dialcode" do
          customFormat "" "+46 __ ______" "1234456"
            # Assert.equal $ Nothing
        test "blank  dialcode and format" do
          customFormat "" "" "1234456"
            # Assert.equal $ Nothing
        test "blank dialcode and format no symbol" do
          customFormat "" "test" "1234456"
            # Assert.equal $ Nothing
        test "123 dialcode and format +" do
          customFormat "123" "+" "1234456"
            # Assert.equal $ Just "+1231234456"
        test "123 dialcode and format 2" do
          customFormat "123" "2" "1234456"
            # Assert.equal $ Just "21231234456"
        test "empty dial code" do
          customFormat "" "+" "1234456"
            # Assert.equal $ Nothing
