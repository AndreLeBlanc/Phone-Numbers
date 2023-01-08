# Phone-Numbers

A library for handling phone numbers in Purescript. Given a countries name or ISO2, and an unformatted string containing a phone number, a formatted number can be produced.

# Usage

format takes a Country and a string containing the phone number and outputs a Maybe String containing either the formatted phone number including the country code or Nothing. The unformatted phone number may include the country code either beginning with "00" or "+". Characters  other than digits will be removed from the number and the function returns Nothing if the phone number doesn't consist of more than the country code. 
    
````purescript
    format Germany "30901820" == Just "+49 309 01820"
    
    format Germany "+4930901820" == Just "+49 309 01820"

    format Vietnam "0084 098432347" == Just "+84 098432347"

    format Vietnam "0084 0984 32 3- 4-7" == Just "+84 098432347"

    format Vietnam "0084" == Nothing
````

extractNums takes a String as an argument and returns a Just String containing only the digits if the argument contained digits, otherwise it returns Nothing.

````purescript
    extractNums "+49 30 901820" == Just "4930901820"
````

stringToCountry takes a String and produces a Country. This can be used in combination with format:

````purescript
    format  (stringToCountry "Germany") "30901820" == Just "+49 309 01820"

````

codeStringToCountry can be used in a similar manner using the desired country's ISO2 code as an argument. This can be used in combination with format:

````purescript
    format  (codeStringToCountry "DE") "30901820" == Just "+49 309 01820"

````

# Credits

The inspiration for this library came from [react-phone-input](https://github.com/razagill/react-phone-input)