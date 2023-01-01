module Test.Main where

import Prelude

import Countries (Country(..), codeStringToCountry, countryToString, index, stringToCountry)
import Effect (Effect)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Data.Map (lookup)
import Test.Unit.Main (runTest)
import Data.Maybe (fromMaybe)

stringMapCodeCountry :: String -> Country
stringMapCodeCountry str = 
  let
    run =
      do
        cp <- lookup  (stringToCountry str) index
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
        Assert.equal  Sweden
          $ stringMapCodeCountry "Sweden"
      test "Germany" do 
        Assert.equal  Germany
          $ stringMapCodeCountry "Germany"
      test "Canada" do 
        Assert.equal  Canada
          $ stringMapCodeCountry "Canada"
      test "Botswana" do 
        Assert.equal  Botswana
          $ stringMapCodeCountry "Botswana"
      test "South Korea" do 
        Assert.equal  South_Korea
          $ stringMapCodeCountry "South Korea"
      test "testland" do 
        Assert.equal (Other "failed")
          $ stringMapCodeCountry "testland"
      test "Bosnia and Herzegovina" do 
        Assert.equal  Bosnia_and_Herzegovina
          $ stringMapCodeCountry "Bosnia and Herzegovina"
      test "Democratic Republic of the Congo" do 
        Assert.equal  Democratic_Republic_of_the_Congo
          $ stringMapCodeCountry "Democratic Republic of the Congo"
      test "Turks and Caicos Islands" do 
        Assert.equal  Turks_and_Caicos_Islands
          $ stringMapCodeCountry "Turks and Caicos Islands"
      test "British Virigin Islands" do 
        Assert.equal  British_Virgin_Islands
          $ stringMapCodeCountry "British Virgin Islands"
      test "New Zealand" do 
        Assert.equal  New_Zealand
          $ stringMapCodeCountry "New Zealand"
          