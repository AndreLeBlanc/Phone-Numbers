# Phone-Numbers

A library for handling phone numbers in Purescript. Given a countries name or ISO2, and an unformatted string containing a phone number, a formatted number can be produced.

# Usage
````purescript
    format takes a Country and a string containing the phone number and outputs a Maybe String containing either the formatted phone number including the country code or Nothing. The unformatted phone number may include the country code either beginning with "00" or "+". Characters  other than digits will be removed from the number and the function returns Nothing if the phone number doesn't consist of more than the country code. 
    
    format Germany "30901820" == Just "+49 309 01820"
    
    format Germany "+4930901820" == Just "+49 309 01820"

    format Vietnam "0084 098432347" == Just "+84 098432347"

    format Vietnam "0084 0984 32 3- 4-7" == Just "+84 098432347"

    format Vietnam "0084" == Nothing


````