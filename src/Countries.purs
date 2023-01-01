module Countries where

import Prelude

import Data.Map (Map, fromFoldable)
import Data.Tuple (Tuple(..))
import Data.Maybe (Maybe(..))

type CountryPhone =
  { code :: String, dial_code :: String, format :: Maybe String }

data Country
  = Afghanistan
  | Aland_Islands
  | Albania
  | Algeria
  | American_Samoa
  | Andorra
  | Angola
  | Anguilla
  | Antarctica
  | Antigua_and_Barbuda
  | Argentina
  | Armenia
  | Aruba
  | Australia
  | Austria
  | Azerbaijan
  | Bahamas
  | Bahrain
  | Bangladesh
  | Barbados
  | Belarus
  | Belgium
  | Belize
  | Benin
  | Bermuda
  | Bhutan
  | Bolivia
  | Bosnia_and_Herzegovina
  | Botswana
  | Brazil
  | British_Indian_Ocean_Territory
  | Brunei
  | Bulgaria
  | Burkina_Faso
  | Burundi
  | Cambodia
  | Cameroon
  | Canada
  | Cape_Verde
  | Cayman_Islands
  | Central_African_Republic
  | Chad
  | Chile
  | China
  | Christmas_Island
  | Cocos_Islands
  | Colombia
  | Comoros
  | Democratic_Republic_of_the_Congo
  | Republic_of_the_Congo
  | Cook_Islands
  | Costa_Rica
  | Cote_dIvoire
  | Croatia
  | Cuba
  | Cyprus
  | Czech_Republic
  | Denmark
  | Djibouti
  | Dominica
  | Dominican_Republic
  | Ecuador
  | Egypt
  | El_Salvador
  | Equatorial_Guinea
  | Eritrea
  | Estonia
  | Ethiopia
  | Falkland_Islands
  | Faroe_Islands
  | Fiji
  | Finland
  | France
  | French_Guiana
  | French_Polynesia
  | Gabon
  | Gambia
  | Georgia
  | Germany
  | Ghana
  | Gibraltar
  | Greece
  | Greenland
  | Grenada
  | Guadeloupe
  | Guam
  | Guatemala
  | Guernsey
  | Guinea
  | Guinea_Bissau
  | Guyana
  | Haiti
  | Vatican
  | Honduras
  | Hong_Kong
  | Hungary
  | Iceland
  | India
  | Indonesia
  | Iran
  | Iraq
  | Ireland
  | Isle_of_Man
  | Israel
  | Italy
  | Jamaica
  | Japan
  | Jersey
  | Jordan
  | Kazakhstan
  | Kenya
  | Kiribati
  | North_Korea
  | South_Korea
  | Kuwait
  | Kyrgyzstan
  | Laos
  | Latvia
  | Lebanon
  | Lesotho
  | Liberia
  | Libya
  | Liechtenstein
  | Lithuania
  | Luxembourg
  | Macao
  | Macedonia
  | Madagascar
  | Malawi
  | Malaysia
  | Maldives
  | Mali
  | Malta
  | Marshall_Islands
  | Martinique
  | Mauritania
  | Mauritius
  | Mayotte
  | Mexico
  | Micronesia
  | Moldova
  | Monaco
  | Mongolia
  | Montenegro
  | Montserrat
  | Morocco
  | Mozambique
  | Myanmar
  | Namibia
  | Nauru
  | Nepal
  | Netherlands
  | Netherlands_Antilles
  | New_Caledonia
  | New_Zealand
  | Nicaragua
  | Niger
  | Nigeria
  | Niue
  | Norfolk_Island
  | Northern_Mariana_Islands
  | Norway
  | Oman
  | Pakistan
  | Palau
  | Palestinian_Territory
  | Panama
  | Papua_New_Guinea
  | Paraguay
  | Peru
  | Philippines
  | Pitcairn
  | Poland
  | Portugal
  | Puerto_Rico
  | Qatar
  | Romania
  | Russia
  | Rwanda
  | Reunion
  | Saint_Barthelemy
  | Saint_Helena
  | Saint_Kitts
  | Saint_Lucia
  | Saint_Martin
  | Saint_Pierre_and_Miquelon
  | Saint_Vincent
  | Samoa
  | San_Marino
  | Sao_Tome_and_Principe
  | Saudi_Arabia
  | Senegal
  | Serbia
  | Seychelles
  | Sierra_Leone
  | Singapore
  | Slovakia
  | Slovenia
  | Solomon_Islands
  | Somalia
  | South_Africa
  | South_Sudan
  | South_Georgia
  | Spain
  | Sri_Lanka
  | Sudan
  | Suriname
  | Svalbard
  | Swaziland
  | Sweden
  | Switzerland
  | Syrian_Arab_Republic
  | Taiwan
  | Tajikistan
  | Tanzania
  | Thailand
  | Timor_Leste
  | Togo
  | Tokelau
  | Tonga
  | Trinidad_and_Tobago
  | Tunisia
  | Turkey
  | Turkmenistan
  | Turks_and_Caicos_Islands
  | Tuvalu
  | Uganda
  | Ukraine
  | United_Arab_Emirates
  | United_Kingdom
  | United_States
  | Uruguay
  | Uzbekistan
  | Vanuatu
  | Venezuela
  | Vietnam
  | British_Virgin_Islands
  | Virgin_Islands
  | Wallis_and_Futuna
  | Yemen
  | Zambia
  | Zimbabwe
  | Other String

derive instance Eq Country
derive instance Ord Country
instance Show Country where
  show x = countryToString x

countryToString :: Country -> String
countryToString country =
  case country of
    Afghanistan -> "Afghanistan"
    Aland_Islands -> "Aland Islands"
    Albania -> "Albania"
    Algeria -> "Algeria"
    American_Samoa -> "American Samoa"
    Andorra -> "Andorra"
    Angola -> "Angola"
    Anguilla -> "Anguilla"
    Antarctica -> "Antarctica"
    Antigua_and_Barbuda -> "Antigua and Barbuda"
    Argentina -> "Argentina"
    Armenia -> "Armenia"
    Aruba -> "Aruba"
    Australia -> "Australia"
    Austria -> "Austria"
    Azerbaijan -> "Azerbaijan"
    Bahamas -> "Bahamas"
    Bahrain -> "Bahrain"
    Bangladesh -> "Bangladesh"
    Barbados -> "Barbados"
    Belarus -> "Belarus"
    Belgium -> "Belgium"
    Belize -> "Belize"
    Benin -> "Benin"
    Bermuda -> "Bermuda"
    Bhutan -> "Bhutan"
    Bolivia -> "Bolivia"
    Bosnia_and_Herzegovina -> "Bosnia and Herzegovina"
    Botswana -> "Botswana"
    Brazil -> "Brazil"
    British_Indian_Ocean_Territory -> "British Indian Ocean Territory"
    British_Virgin_Islands -> "British Virgin Islands"
    Brunei -> "Brunei Darussalam"
    Bulgaria -> "Bulgaria"
    Burkina_Faso -> "Burkina Faso"
    Burundi -> "Burundi"
    Cambodia -> "Cambodia"
    Cameroon -> "Cameroon"
    Canada -> "Canada"
    Cape_Verde -> "Cape Verde"
    Cayman_Islands -> "Cayman Islands"
    Central_African_Republic -> "Central African Republic"
    Chad -> "Chad"
    Chile -> "Chile"
    China -> "China"
    Christmas_Island -> "Christmas Island"
    Cocos_Islands -> "Cocos (Keeling) Islands"
    Colombia -> "Colombia"
    Comoros -> "Comoros"
    Democratic_Republic_of_the_Congo -> "Democratic Republic of the Congo"
    Republic_of_the_Congo -> "Republic of the Congo"
    Cook_Islands -> "Cook Islands"
    Costa_Rica -> "Costa Rica"
    Cote_dIvoire -> "Cote d'Ivoire"
    Croatia -> "Croatia"
    Cuba -> "Cuba"
    Cyprus -> "Cyprus"
    Czech_Republic -> "Czech Republic"
    Denmark -> "Denmark"
    Djibouti -> "Djibouti"
    Dominica -> "Dominica"
    Dominican_Republic -> "Dominican Republic"
    Ecuador -> "Ecuador"
    Egypt -> "Egypt"
    El_Salvador -> "El Salvador"
    Equatorial_Guinea -> "Equatorial Guinea"
    Eritrea -> "Eritrea"
    Estonia -> "Estonia"
    Ethiopia -> "Ethiopia"
    Falkland_Islands -> "Falkland Islands"
    Faroe_Islands -> "Faroe Islands"
    Fiji -> "Fiji"
    Finland -> "Finland"
    France -> "France"
    French_Guiana -> "French Guiana"
    French_Polynesia -> "French Polynesia"
    Gabon -> "Gabon"
    Gambia -> "Gambia"
    Georgia -> "Georgia"
    Germany -> "Germany"
    Ghana -> "Ghana"
    Gibraltar -> "Gibraltar"
    Greece -> "Greece"
    Greenland -> "Greenland"
    Grenada -> "Grenada"
    Guadeloupe -> "Guadeloupe"
    Guam -> "Guam"
    Guatemala -> "Guatemala"
    Guernsey -> "Guernsey"
    Guinea -> "Guinea"
    Guinea_Bissau -> "Guinea-Bissau"
    Guyana -> "Guyana"
    Haiti -> "Haiti"
    Vatican -> "Vatican"
    Honduras -> "Honduras"
    Hong_Kong -> "Hong Kong"
    Hungary -> "Hungary"
    Iceland -> "Iceland"
    India -> "India"
    Indonesia -> "Indonesia"
    Iran -> "Iran"
    Iraq -> "Iraq"
    Ireland -> "Ireland"
    Isle_of_Man -> "Isle of Man"
    Israel -> "Israel"
    Italy -> "Italy"
    Jamaica -> "Jamaica"
    Japan -> "Japan"
    Jersey -> "Jersey"
    Jordan -> "Jordan"
    Kazakhstan -> "Kazakhstan"
    Kenya -> "Kenya"
    Kiribati -> "Kiribati"
    North_Korea -> "North Korea,"
    South_Korea -> "South Korea"
    Kuwait -> "Kuwait"
    Kyrgyzstan -> "Kyrgyzstan"
    Laos -> "Laos"
    Latvia -> "Latvia"
    Lebanon -> "Lebanon"
    Lesotho -> "Lesotho"
    Liberia -> "Liberia"
    Libya -> "Libya"
    Liechtenstein -> "Liechtenstein"
    Lithuania -> "Lithuania"
    Luxembourg -> "Luxembourg"
    Macao -> "Macao"
    Macedonia -> "Macedonia"
    Madagascar -> "Madagascar"
    Malawi -> "Malawi"
    Malaysia -> "Malaysia"
    Maldives -> "Maldives"
    Mali -> "Mali"
    Malta -> "Malta"
    Marshall_Islands -> "Marshall Islands"
    Martinique -> "Martinique"
    Mauritania -> "Mauritania"
    Mauritius -> "Mauritius"
    Mayotte -> "Mayotte"
    Mexico -> "Mexico"
    Micronesia -> "Micronesia"
    Moldova -> "Moldova"
    Monaco -> "Monaco"
    Mongolia -> "Mongolia"
    Montenegro -> "Montenegro"
    Montserrat -> "Montserrat"
    Morocco -> "Morocco"
    Mozambique -> "Mozambique"
    Myanmar -> "Myanmar"
    Namibia -> "Namibia"
    Nauru -> "Nauru"
    Nepal -> "Nepal"
    Netherlands -> "Netherlands"
    Netherlands_Antilles -> "Netherlands Antilles"
    New_Caledonia -> "New Caledonia"
    New_Zealand -> "New Zealand"
    Nicaragua -> "Nicaragua"
    Niger -> "Niger"
    Nigeria -> "Nigeria"
    Niue -> "Niue"
    Norfolk_Island -> "Norfolk Island"
    Northern_Mariana_Islands -> "Northern Mariana Islands"
    Norway -> "Norway"
    Oman -> "Oman"
    Pakistan -> "Pakistan"
    Palau -> "Palau"
    Palestinian_Territory -> "Palestinian Territory"
    Panama -> "Panama"
    Papua_New_Guinea -> "Papua New Guinea"
    Paraguay -> "Paraguay"
    Peru -> "Peru"
    Philippines -> "Philippines"
    Pitcairn -> "Pitcairn"
    Poland -> "Poland"
    Portugal -> "Portugal"
    Puerto_Rico -> "Puerto Rico"
    Qatar -> "Qatar"
    Romania -> "Romania"
    Russia -> "Russia"
    Rwanda -> "Rwanda"
    Reunion -> "Reunion"
    Saint_Barthelemy -> "Saint Barthelemy"
    Saint_Helena -> "Saint Helena"
    Saint_Kitts -> "Saint Kitts and Nevis"
    Saint_Lucia -> "Saint Lucia"
    Saint_Martin -> "Saint Martin"
    Saint_Pierre_and_Miquelon -> "Saint Pierre and Miquelon"
    Saint_Vincent -> "Saint Vincent and the Grenadines"
    Samoa -> "Samoa"
    San_Marino -> "San Marino"
    Sao_Tome_and_Principe -> "Sao Tome and Principe"
    Saudi_Arabia -> "Saudi Arabia"
    Senegal -> "Senegal"
    Serbia -> "Serbia"
    Seychelles -> "Seychelles"
    Sierra_Leone -> "Sierra Leone"
    Singapore -> "Singapore"
    Slovakia -> "Slovakia"
    Slovenia -> "Slovenia"
    Solomon_Islands -> "Solomon Islands"
    Somalia -> "Somalia"
    South_Africa -> "South Africa"
    South_Sudan -> "South Sudan"
    South_Georgia -> "South Georgia and the South Sandwich Islands"
    Spain -> "Spain"
    Sri_Lanka -> "Sri Lanka"
    Sudan -> "Sudan"
    Suriname -> "Suriname"
    Svalbard -> "Svalbard and Jan Mayen"
    Swaziland -> "Swaziland"
    Sweden -> "Sweden"
    Switzerland -> "Switzerland"
    Syrian_Arab_Republic -> "Syrian Arab Republic"
    Taiwan -> "Taiwan"
    Tajikistan -> "Tajikistan"
    Tanzania -> "Tanzania"
    Thailand -> "Thailand"
    Timor_Leste -> "Timor-Leste"
    Togo -> "Togo"
    Tokelau -> "Tokelau"
    Tonga -> "Tonga"
    Trinidad_and_Tobago -> "Trinidad and Tobago"
    Tunisia -> "Tunisia"
    Turkey -> "Turkey"
    Turkmenistan -> "Turkmenistan"
    Turks_and_Caicos_Islands -> "Turks and Caicos Islands"
    Tuvalu -> "Tuvalu"
    Uganda -> "Uganda"
    Ukraine -> "Ukraine"
    United_Arab_Emirates -> "United Arab Emirates"
    United_Kingdom -> "United Kingdom"
    United_States -> "United States"
    Uruguay -> "Uruguay"
    Uzbekistan -> "Uzbekistan"
    Vanuatu -> "Vanuatu"
    Venezuela -> "Venezuela"
    Vietnam -> "Vietnam"
    Virgin_Islands -> "Virgin Islands"
    Wallis_and_Futuna -> "Wallis and Futuna"
    Yemen -> "Yemen"
    Zambia -> "Zambia"
    Zimbabwe -> "Zimbabwe"
    Other other -> other

stringToCountry :: String -> Country
stringToCountry country =
  case country of
    "Afghanistan" -> Afghanistan
    "Aland Islands" -> Aland_Islands
    "Albania" -> Albania
    "Algeria" -> Algeria
    "AmericanSamoa" -> American_Samoa
    "Andorra" -> Andorra
    "Angola" -> Angola
    "Anguilla" -> Anguilla
    "Antarctica" -> Antarctica
    "Antigua and Barbuda" -> Antigua_and_Barbuda
    "Argentina" -> Argentina
    "Armenia" -> Armenia
    "Aruba" -> Aruba
    "Australia" -> Australia
    "Austria" -> Austria
    "Azerbaijan" -> Azerbaijan
    "Bahamas" -> Bahamas
    "Bahrain" -> Bahrain
    "Bangladesh" -> Bangladesh
    "Barbados" -> Barbados
    "Belarus" -> Belarus
    "Belgium" -> Belgium
    "Belize" -> Belize
    "Benin" -> Benin
    "Bermuda" -> Bermuda
    "Bhutan" -> Bhutan
    "Bolivia" -> Bolivia
    "Bosnia and Herzegovina" -> Bosnia_and_Herzegovina
    "Botswana" -> Botswana
    "Brazil" -> Brazil
    "British Indian Ocean Territory" -> British_Indian_Ocean_Territory
    "British Virgin Islands" -> British_Virgin_Islands
    "Brunei Darussalam" -> Brunei
    "Bulgaria" -> Bulgaria
    "Burkina Faso" -> Burkina_Faso
    "Burundi" -> Burundi
    "Cambodia" -> Cambodia
    "Cameroon" -> Cameroon
    "Canada" -> Canada
    "Cape Verde" -> Cape_Verde
    "Cayman Islands" -> Cayman_Islands
    "Central African Republic" -> Central_African_Republic
    "Chad" -> Chad
    "Chile" -> Chile
    "China" -> China
    "Christmas Island" -> Christmas_Island
    "Cocos (Keeling) Islands" -> Cocos_Islands
    "Colombia" -> Colombia
    "Comoros" -> Comoros
    "Democratic Republic of the Congo" -> Democratic_Republic_of_the_Congo
    "Republic of the Congo" -> Republic_of_the_Congo
    "Cook Islands" -> Cook_Islands
    "Costa Rica" -> Costa_Rica
    "Cote d'Ivoire" -> Cote_dIvoire
    "Croatia" -> Croatia
    "Cuba" -> Cuba
    "Cyprus" -> Cyprus
    "Czech Republic" -> Czech_Republic
    "Denmark" -> Denmark
    "Djibouti" -> Djibouti
    "Dominica" -> Dominica
    "Dominican Republic" -> Dominican_Republic
    "Ecuador" -> Ecuador
    "Egypt" -> Egypt
    "El Salvador" -> El_Salvador
    "Equatorial Guinea" -> Equatorial_Guinea
    "Eritrea" -> Eritrea
    "Estonia" -> Estonia
    "Ethiopia" -> Ethiopia
    "Falkland Islands" -> Falkland_Islands
    "Faroe Islands" -> Faroe_Islands
    "Fiji" -> Fiji
    "Finland" -> Finland
    "France" -> France
    "French Guiana" -> French_Guiana
    "French Polynesia" -> French_Polynesia
    "Gabon" -> Gabon
    "Gambia" -> Gambia
    "Georgia" -> Georgia
    "Germany" -> Germany
    "Ghana" -> Ghana
    "Gibraltar" -> Gibraltar
    "Greece" -> Greece
    "Greenland" -> Greenland
    "Grenada" -> Grenada
    "Guadeloupe" -> Guadeloupe
    "Guam" -> Guam
    "Guatemala" -> Guatemala
    "Guernsey" -> Guernsey
    "Guinea" -> Guinea
    "Guinea-Bissau" -> Guinea_Bissau
    "Guyana" -> Guyana
    "Haiti" -> Haiti
    "Vatican" -> Vatican
    "Honduras" -> Honduras
    "Hong Kong" -> Hong_Kong
    "Hungary" -> Hungary
    "Iceland" -> Iceland
    "India" -> India
    "Indonesia" -> Indonesia
    "Iran" -> Iran
    "Iraq" -> Iraq
    "Ireland" -> Ireland
    "Isle of Man" -> Isle_of_Man
    "Israel" -> Israel
    "Italy" -> Italy
    "Jamaica" -> Jamaica
    "Japan" -> Japan
    "Jersey" -> Jersey
    "Jordan" -> Jordan
    "Kazakhstan" -> Kazakhstan
    "Kenya" -> Kenya
    "Kiribati" -> Kiribati
    "North Korea," -> North_Korea
    "South Korea" -> South_Korea
    "Kuwait" -> Kuwait
    "Kyrgyzstan" -> Kyrgyzstan
    "Laos" -> Laos
    "Latvia" -> Latvia
    "Lebanon" -> Lebanon
    "Lesotho" -> Lesotho
    "Liberia" -> Liberia
    "Libya" -> Libya
    "Liechtenstein" -> Liechtenstein
    "Lithuania" -> Lithuania
    "Luxembourg" -> Luxembourg
    "Macao" -> Macao
    "Macedonia" -> Macedonia
    "Madagascar" -> Madagascar
    "Malawi" -> Malawi
    "Malaysia" -> Malaysia
    "Maldives" -> Maldives
    "Mali" -> Mali
    "Malta" -> Malta
    "Marshall Islands" -> Marshall_Islands
    "Martinique" -> Martinique
    "Mauritania" -> Mauritania
    "Mauritius" -> Mauritius
    "Mayotte" -> Mayotte
    "Mexico" -> Mexico
    "Micronesia" -> Micronesia
    "Moldova" -> Moldova
    "Monaco" -> Monaco
    "Mongolia" -> Mongolia
    "Montenegro" -> Montenegro
    "Montserrat" -> Montserrat
    "Morocco" -> Morocco
    "Mozambique" -> Mozambique
    "Myanmar" -> Myanmar
    "Namibia" -> Namibia
    "Nauru" -> Nauru
    "Nepal" -> Nepal
    "Netherlands" -> Netherlands
    "Netherlands Antilles" -> Netherlands_Antilles
    "New Caledonia" -> New_Caledonia
    "New Zealand" -> New_Zealand
    "Nicaragua" -> Nicaragua
    "Niger" -> Niger
    "Nigeria" -> Nigeria
    "Niue" -> Niue
    "Norfolk Island" -> Norfolk_Island
    "Northern Mariana Islands" -> Northern_Mariana_Islands
    "Norway" -> Norway
    "Oman" -> Oman
    "Pakistan" -> Pakistan
    "Palau" -> Palau
    "Palestinian Territory" -> Palestinian_Territory
    "Panama" -> Panama
    "Papua New Guinea" -> Papua_New_Guinea
    "Paraguay" -> Paraguay
    "Peru" -> Peru
    "Philippines" -> Philippines
    "Pitcairn" -> Pitcairn
    "Poland" -> Poland
    "Portugal" -> Portugal
    "Puerto Rico" -> Puerto_Rico
    "Qatar" -> Qatar
    "Romania" -> Romania
    "Russia" -> Russia
    "Rwanda" -> Rwanda
    "Reunion" -> Reunion
    "Saint Barthelemy" -> Saint_Barthelemy
    "Saint Helena" -> Saint_Helena
    "Saint Kitts and Nevis" -> Saint_Kitts
    "Saint Lucia" -> Saint_Lucia
    "Saint Martin" -> Saint_Martin
    "Saint Pierre and Miquelon" -> Saint_Pierre_and_Miquelon
    "Saint Vincent and the Grenadines" -> Saint_Vincent
    "Samoa" -> Samoa
    "San Marino" -> San_Marino
    "Sao Tome and Principe" -> Sao_Tome_and_Principe
    "Saudi Arabia" -> Saudi_Arabia
    "Senegal" -> Senegal
    "Serbia" -> Serbia
    "Seychelles" -> Seychelles
    "Sierra Leone" -> Sierra_Leone
    "Singapore" -> Singapore
    "Slovakia" -> Slovakia
    "Slovenia" -> Slovenia
    "Solomon Islands" -> Solomon_Islands
    "Somalia" -> Somalia
    "South Africa" -> South_Africa
    "South Sudan" -> South_Sudan
    "South Georgia and the South Sandwich Islands" -> South_Georgia
    "Spain" -> Spain
    "Sri Lanka" -> Sri_Lanka
    "Sudan" -> Sudan
    "Suriname" -> Suriname
    "Svalbard and Jan Mayen" -> Svalbard
    "Swaziland" -> Swaziland
    "Sweden" -> Sweden
    "Switzerland" -> Switzerland
    "Syrian Arab Republic" -> Syrian_Arab_Republic
    "Taiwan" -> Taiwan
    "Tajikistan" -> Tajikistan
    "Tanzania" -> Tanzania
    "Thailand" -> Thailand
    "Timor-Leste" -> Timor_Leste
    "Togo" -> Togo
    "Tokelau" -> Tokelau
    "Tonga" -> Tonga
    "Trinidad and Tobago" -> Trinidad_and_Tobago
    "Tunisia" -> Tunisia
    "Turkey" -> Turkey
    "Turkmenistan" -> Turkmenistan
    "Turks and Caicos Islands" -> Turks_and_Caicos_Islands
    "Tuvalu" -> Tuvalu
    "Uganda" -> Uganda
    "Ukraine" -> Ukraine
    "United Arab Emirates" -> United_Arab_Emirates
    "United Kingdom" -> United_Kingdom
    "United States" -> United_States
    "Uruguay" -> Uruguay
    "Uzbekistan" -> Uzbekistan
    "Vanuatu" -> Vanuatu
    "Venezuela" -> Venezuela
    "Vietnam" -> Vietnam
    "Virgin Islands" -> Virgin_Islands
    "Wallis and Futuna" -> Wallis_and_Futuna
    "Yemen" -> Yemen
    "Zambia" -> Zambia
    "Zimbabwe" -> Zimbabwe
    other -> Other other

codeStringToCountry :: String -> Country
codeStringToCountry str =
  case str of
    "AF" -> Afghanistan
    "AX" -> Aland_Islands
    "AL" -> Albania
    "DZ" -> Algeria
    "AS" -> American_Samoa
    "AD" -> Andorra
    "AO" -> Angola
    "AI" -> Anguilla
    "AQ" -> Antarctica
    "AG" -> Antigua_and_Barbuda
    "AR" -> Argentina
    "AM" -> Armenia
    "AW" -> Aruba
    "AU" -> Australia
    "AT" -> Austria
    "AZ" -> Azerbaijan
    "BS" -> Bahamas
    "BH" -> Bahrain
    "BD" -> Bangladesh
    "BB" -> Barbados
    "BY" -> Belarus
    "BE" -> Belgium
    "BZ" -> Belize
    "BJ" -> Benin
    "BM" -> Bermuda
    "BT" -> Bhutan
    "BO" -> Bolivia
    "BA" -> Bosnia_and_Herzegovina
    "BW" -> Botswana
    "BR" -> Brazil
    "IO" -> British_Indian_Ocean_Territory
    "BN" -> Brunei
    "BG" -> Bulgaria
    "BF" -> Burkina_Faso
    "BI" -> Burundi
    "KH" -> Cambodia
    "CM" -> Cameroon
    "CA" -> Canada
    "CV" -> Cape_Verde
    "KY" -> Cayman_Islands
    "CF" -> Central_African_Republic
    "TD" -> Chad
    "CL" -> Chile
    "CN" -> China
    "CX" -> Christmas_Island
    "CC" -> Cocos_Islands
    "CO" -> Colombia
    "KM" -> Comoros
    "CD" -> Democratic_Republic_of_the_Congo
    "CG" -> Republic_of_the_Congo
    "CK" -> Cook_Islands
    "CR" -> Costa_Rica
    "CI" -> Cote_dIvoire
    "HR" -> Croatia
    "CU" -> Cuba
    "CY" -> Cyprus
    "CZ" -> Czech_Republic
    "DK" -> Denmark
    "DJ" -> Djibouti
    "DM" -> Dominica
    "DO" -> Dominican_Republic
    "EC" -> Ecuador
    "EG" -> Egypt
    "SV" -> El_Salvador
    "GQ" -> Equatorial_Guinea
    "ER" -> Eritrea
    "EE" -> Estonia
    "ET" -> Ethiopia
    "FK" -> Falkland_Islands
    "FO" -> Faroe_Islands
    "FJ" -> Fiji
    "FI" -> Finland
    "FR" -> France
    "GF" -> French_Guiana
    "PF" -> French_Polynesia
    "GA" -> Gabon
    "GM" -> Gambia
    "GE" -> Georgia
    "DE" -> Germany
    "GH" -> Ghana
    "GI" -> Gibraltar
    "GR" -> Greece
    "GL" -> Greenland
    "GD" -> Grenada
    "GP" -> Guadeloupe
    "GU" -> Guam
    "GT" -> Guatemala
    "GG" -> Guernsey
    "GN" -> Guinea
    "GW" -> Guinea_Bissau
    "GY" -> Guyana
    "HT" -> Haiti
    "VA" -> Vatican
    "HN" -> Honduras
    "HK" -> Hong_Kong
    "HU" -> Hungary
    "IS" -> Iceland
    "IN" -> India
    "ID" -> Indonesia
    "IR" -> Iran
    "IQ" -> Iraq
    "IE" -> Ireland
    "IM" -> Isle_of_Man
    "IL" -> Israel
    "IT" -> Italy
    "JM" -> Jamaica
    "JP" -> Japan
    "JE" -> Jersey
    "JO" -> Jordan
    "KZ" -> Kazakhstan
    "KE" -> Kenya
    "KI" -> Kiribati
    "KP" -> North_Korea
    "KR" -> South_Korea
    "KW" -> Kuwait
    "KG" -> Kyrgyzstan
    "LA" -> Laos
    "LV" -> Latvia
    "LB" -> Lebanon
    "LS" -> Lesotho
    "LR" -> Liberia
    "LY" -> Libya
    "LI" -> Liechtenstein
    "LT" -> Lithuania
    "LU" -> Luxembourg
    "MO" -> Macao
    "MK" -> Macedonia
    "MG" -> Madagascar
    "MW" -> Malawi
    "MY" -> Malaysia
    "MV" -> Maldives
    "ML" -> Mali
    "MT" -> Malta
    "MH" -> Marshall_Islands
    "MQ" -> Martinique
    "MR" -> Mauritania
    "MU" -> Mauritius
    "YT" -> Mayotte
    "MX" -> Mexico
    "FM" -> Micronesia
    "MD" -> Moldova
    "MC" -> Monaco
    "MN" -> Mongolia
    "ME" -> Montenegro
    "MS" -> Montserrat
    "MA" -> Morocco
    "MZ" -> Mozambique
    "MM" -> Myanmar
    "NA" -> Namibia
    "NR" -> Nauru
    "NP" -> Nepal
    "NL" -> Netherlands
    "AN" -> Netherlands_Antilles
    "NC" -> New_Caledonia
    "NZ" -> New_Zealand
    "NI" -> Nicaragua
    "NE" -> Niger
    "NG" -> Nigeria
    "NU" -> Niue
    "NF" -> Norfolk_Island
    "MP" -> Northern_Mariana_Islands
    "NO" -> Norway
    "OM" -> Oman
    "PK" -> Pakistan
    "PW" -> Palau
    "PS" -> Palestinian_Territory
    "PA" -> Panama
    "PG" -> Papua_New_Guinea
    "PY" -> Paraguay
    "PE" -> Peru
    "PH" -> Philippines
    "PN" -> Pitcairn
    "PL" -> Poland
    "PT" -> Portugal
    "PR" -> Puerto_Rico
    "QA" -> Qatar
    "RO" -> Romania
    "RU" -> Russia
    "RW" -> Rwanda
    "RE" -> Reunion
    "BL" -> Saint_Barthelemy
    "SH" -> Saint_Helena
    "KN" -> Saint_Kitts
    "LC" -> Saint_Lucia
    "MF" -> Saint_Martin
    "PM" -> Saint_Pierre_and_Miquelon
    "VC" -> Saint_Vincent
    "WS" -> Samoa
    "SM" -> San_Marino
    "ST" -> Sao_Tome_and_Principe
    "SA" -> Saudi_Arabia
    "SN" -> Senegal
    "RS" -> Serbia
    "SC" -> Seychelles
    "SL" -> Sierra_Leone
    "SG" -> Singapore
    "SK" -> Slovakia
    "SI" -> Slovenia
    "SB" -> Solomon_Islands
    "SO" -> Somalia
    "ZA" -> South_Africa
    "SS" -> South_Sudan
    "GS" -> South_Georgia
    "ES" -> Spain
    "LK" -> Sri_Lanka
    "SD" -> Sudan
    "SR" -> Suriname
    "SJ" -> Svalbard
    "SZ" -> Swaziland
    "SE" -> Sweden
    "CH" -> Switzerland
    "SY" -> Syrian_Arab_Republic
    "TW" -> Taiwan
    "TJ" -> Tajikistan
    "TZ" -> Tanzania
    "TH" -> Thailand
    "TL" -> Timor_Leste
    "TG" -> Togo
    "TK" -> Tokelau
    "TO" -> Tonga
    "TT" -> Trinidad_and_Tobago
    "TN" -> Tunisia
    "TR" -> Turkey
    "TM" -> Turkmenistan
    "TC" -> Turks_and_Caicos_Islands
    "TV" -> Tuvalu
    "UG" -> Uganda
    "UA" -> Ukraine
    "AE" -> United_Arab_Emirates
    "GB" -> United_Kingdom
    "US" -> United_States
    "UY" -> Uruguay
    "UZ" -> Uzbekistan
    "VU" -> Vanuatu
    "VE" -> Venezuela
    "VN" -> Vietnam
    "VG" -> British_Virgin_Islands
    "VI" -> Virgin_Islands
    "WF" -> Wallis_and_Futuna
    "YE" -> Yemen
    "ZM" -> Zambia
    "ZW" -> Zimbabwe
    other -> Other other

countries :: Array (Tuple Country CountryPhone)
countries =
  [ Tuple Afghanistan
      { dial_code: "93"
      , code: "af"
      , format: Just "+__ (___) ________"
      }
  , Tuple Aland_Islands
      { dial_code: "+358"
      , code: "AX"
      , format: Nothing
      }
  , Tuple Albania
      { dial_code: "+355"
      , code: "AL"
      , format: Nothing
      }
  , Tuple Algeria
      { dial_code: "+213"
      , code: "DZ"
      , format: Nothing
      }
  , Tuple American_Samoa
      { dial_code: "+1684"
      , code: "AS"
      , format: Nothing
      }
  , Tuple Andorra
      { dial_code: "+376"
      , code: "AD"
      , format: Nothing
      }
  , Tuple Angola
      { dial_code: "+244"
      , code: "AO"
      , format: Nothing
      }
  , Tuple Anguilla
      { dial_code: "+1264"
      , code: "AI"
      , format: Nothing
      }
  , Tuple Antarctica
      { dial_code: "+672"
      , code: "AQ"
      , format: Nothing
      }
  , Tuple Antigua_and_Barbuda
      { dial_code: "+1268"
      , code: "AG"
      , format: Nothing
      }
  , Tuple Argentina
      { dial_code: "+54"
      , code: "AR"
      , format: Nothing
      }
  , Tuple Armenia
      { dial_code: "+374"
      , code: "AM"
      , format: Nothing
      }
  , Tuple Aruba
      { dial_code: "+297"
      , code: "AW"
      , format: Nothing
      }
  , Tuple Australia
      { dial_code: "+61"
      , code: "AU"
      , format: Just "+__ ___ ___ ___"
      }
  , Tuple Austria
      { dial_code: "+43"
      , code: "AT"
      , format: Nothing
      }
  , Tuple Azerbaijan
      { dial_code: "+994"
      , code: "AZ"
      , format: Nothing
      }
  , Tuple Bahamas
      { dial_code: "+1242"
      , code: "BS"
      , format: Nothing
      }
  , Tuple Bahrain
      { dial_code: "+973"
      , code: "BH"
      , format: Nothing
      }
  , Tuple Bangladesh
      { dial_code: "+880"
      , code: "BD"
      , format: Nothing
      }
  , Tuple Barbados
      { dial_code: "+1246"
      , code: "BB"
      , format: Nothing
      }
  , Tuple Belarus
      { dial_code: "+375"
      , code: "BY"
      , format: Nothing
      }
  , Tuple Belgium
      { dial_code: "+32"
      , code: "BE"
      , format: Just "+__ ___ __ __ __"
      }
  , Tuple Belize
      { dial_code: "+501"
      , code: "BZ"
      , format: Nothing
      }
  , Tuple Benin
      { dial_code: "+229"
      , code: "BJ"
      , format: Nothing
      }
  , Tuple Bermuda
      { dial_code: "+1441"
      , code: "BM"
      , format: Nothing
      }
  , Tuple Bhutan
      { dial_code: "+975"
      , code: "BT"
      , format: Nothing
      }
  , Tuple Bolivia
      { dial_code: "+591"
      , code: "BO"
      , format: Nothing
      }
  , Tuple Bosnia_and_Herzegovina
      { dial_code: "+387"
      , code: "BA"
      , format: Nothing
      }
  , Tuple Botswana
      { dial_code: "+267"
      , code: "BW"
      , format: Nothing
      }
  , Tuple Brazil
      { dial_code: "+55"
      , code: "BR"
      , format: Nothing
      }
  , Tuple British_Indian_Ocean_Territory
      { dial_code: "+246"
      , code: "IO"
      , format: Nothing
      }
  , Tuple Brunei
      { dial_code: "+673"
      , code: "BN"
      , format: Nothing
      }
  , Tuple Bulgaria
      { dial_code: "+359"
      , code: "BG"
      , format: Nothing
      }
  , Tuple Burkina_Faso
      { dial_code: "+226"
      , code: "BF"
      , format: Nothing
      }
  , Tuple Burundi
      { dial_code: "+257"
      , code: "BI"
      , format: Nothing
      }
  , Tuple Cambodia
      { dial_code: "+855"
      , code: "KH"
      , format: Nothing
      }
  , Tuple Cameroon
      { dial_code: "+237"
      , code: "CM"
      , format: Nothing
      }
  , Tuple Canada
      { dial_code: "+1"
      , code: "CA"
      , format: Just "+_ (___) ___-____"
      }
  , Tuple Cape_Verde
      { dial_code: "+238"
      , code: "CV"
      , format: Nothing
      }
  , Tuple Cayman_Islands
      { dial_code: "+ 345"
      , code: "KY"
      , format: Nothing
      }
  , Tuple Central_African_Republic
      { dial_code: "+236"
      , code: "CF"
      , format: Nothing
      }
  , Tuple Chad
      { dial_code: "+235"
      , code: "TD"
      , format: Nothing
      }
  , Tuple Chile
      { dial_code: "+56"
      , code: "CL"
      , format: Nothing
      }
  , Tuple China
      { dial_code: "+86"
      , code: "CN"
      , format: Just "+__ __-________"
      }
  , Tuple Christmas_Island
      { dial_code: "+61"
      , code: "CX"
      , format: Nothing
      }
  , Tuple Cocos_Islands
      { dial_code: "+61"
      , code: "CC"
      , format: Nothing
      }
  , Tuple Colombia
      { dial_code: "+57"
      , code: "CO"
      , format: Nothing
      }
  , Tuple Comoros
      { dial_code: "+269"
      , code: "KM"
      , format: Nothing
      }
  , Tuple Republic_of_the_Congo
      { dial_code: "+242"
      , code: "CG"
      , format: Nothing
      }
  , Tuple Democratic_Republic_of_the_Congo
      { dial_code: "+243"
      , code: "CD"
      , format: Nothing
      }
  , Tuple Cook_Islands
      { dial_code: "+682"
      , code: "CK"
      , format: Nothing
      }
  , Tuple Costa_Rica
      { dial_code: "+506"
      , code: "CR"
      , format: Just "+___ ____-____"
      }
  , Tuple Cote_dIvoire
      { dial_code: "+225"
      , code: "CI"
      , format: Nothing
      }
  , Tuple Croatia
      { dial_code: "+385"
      , code: "HR"
      , format: Nothing
      }
  , Tuple Cuba
      { dial_code: "+53"
      , code: "CU"
      , format: Nothing
      }
  , Tuple Cyprus
      { dial_code: "+357"
      , code: "CY"
      , format: Nothing
      }
  , Tuple Czech_Republic
      { dial_code: "+420"
      , code: "CZ"
      , format: Nothing
      }
  , Tuple Denmark
      { dial_code: "+45"
      , code: "DK"
      , format: Just "+__ __ __ __ __"
      }
  , Tuple Djibouti
      { dial_code: "+253"
      , code: "DJ"
      , format: Nothing
      }
  , Tuple Dominica
      { dial_code: "+1767"
      , code: "DM"
      , format: Nothing
      }
  , Tuple Dominican_Republic
      { dial_code: "+1849"
      , code: "DO"
      , format: Nothing
      }
  , Tuple Ecuador
      { dial_code: "+593"
      , code: "EC"
      , format: Nothing
      }
  , Tuple Egypt
      { dial_code: "+20"
      , code: "EG"
      , format: Nothing
      }
  , Tuple El_Salvador
      { dial_code: "+503"
      , code: "SV"
      , format: Just "+___ ____-____"
      }
  , Tuple Equatorial_Guinea
      { dial_code: "+240"
      , code: "GQ"
      , format: Nothing
      }
  , Tuple Eritrea
      { dial_code: "+291"
      , code: "ER"
      , format: Nothing
      }
  , Tuple Estonia
      { dial_code: "+372"
      , code: "EE"
      , format: Nothing
      }
  , Tuple Ethiopia
      { dial_code: "+251"
      , code: "ET"
      , format: Nothing
      }
  , Tuple Falkland_Islands
      { dial_code: "+500"
      , code: "FK"
      , format: Nothing
      }
  , Tuple Faroe_Islands
      { dial_code: "+298"
      , code: "FO"
      , format: Nothing
      }
  , Tuple Fiji
      { dial_code: "+679"
      , code: "FJ"
      , format: Nothing
      }
  , Tuple Finland
      { dial_code: "+358"
      , code: "FI"
      , format: Just "+___ __ ___ __ __"
      }
  , Tuple France
      { dial_code: "+33"
      , code: "FR"
      , format: Just "+___ __ ___ __ __"
      }
  , Tuple French_Guiana
      { dial_code: "+594"
      , code: "GF"
      , format: Nothing
      }
  , Tuple French_Polynesia
      { dial_code: "+689"
      , code: "PF"
      , format: Nothing
      }
  , Tuple Gabon
      { dial_code: "+241"
      , code: "GA"
      , format: Nothing
      }
  , Tuple Gambia
      { dial_code: "+220"
      , code: "GM"
      , format: Nothing
      }
  , Tuple Georgia
      { dial_code: "+995"
      , code: "GE"
      , format: Nothing
      }
  , Tuple Germany
      { dial_code: "+49"
      , code: "DE"
      , format: Just "+__ ___ _______"
      }
  , Tuple Ghana
      { dial_code: "+233"
      , code: "GH"
      , format: Nothing
      }
  , Tuple Gibraltar
      { dial_code: "+350"
      , code: "GI"
      , format: Nothing
      }
  , Tuple Greece
      { dial_code: "+30"
      , code: "GR"
      , format: Nothing
      }
  , Tuple Greenland
      { dial_code: "+299"
      , code: "GL"
      , format: Nothing
      }
  , Tuple Grenada
      { dial_code: "+1473"
      , code: "GD"
      , format: Nothing
      }
  , Tuple Guadeloupe
      { dial_code: "+590"
      , code: "GP"
      , format: Nothing
      }
  , Tuple Guam
      { dial_code: "+1671"
      , code: "GU"
      , format: Nothing
      }
  , Tuple Guatemala
      { dial_code: "+502"
      , code: "GT"
      , format: Just "+___ ____-____"
      }
  , Tuple Guernsey
      { dial_code: "+44"
      , code: "GG"
      , format: Nothing
      }
  , Tuple Guinea
      { dial_code: "+224"
      , code: "GN"
      , format: Nothing
      }
  , Tuple Guinea_Bissau
      { dial_code: "+245"
      , code: "GW"
      , format: Nothing
      }
  , Tuple Guyana
      { dial_code: "+595"
      , code: "GY"
      , format: Nothing
      }
  , Tuple Haiti
      { dial_code: "+509"
      , code: "HT"
      , format: Just "+___ ____-____"
      }
  , Tuple Vatican
      { dial_code: "+379"
      , code: "VA"
      , format: Just "+__ __ ____ ____"
      }
  , Tuple Honduras
      { dial_code: "+504"
      , code: "HN"
      , format: Nothing
      }
  , Tuple Hong_Kong
      { dial_code: "+852"
      , code: "HK"
      , format: Just "+___ ____ ____"
      }
  , Tuple Hungary
      { dial_code: "+36"
      , code: "HU"
      , format: Nothing
      }
  , Tuple Iceland
      { dial_code: "+354"
      , code: "IS"
      , format: Just "+___ ___ ____"
      }
  , Tuple India
      { dial_code: "+91"
      , code: "IN"
      , format: Just "+__ _____-_____"
      }
  , Tuple Indonesia
      { dial_code: "+62"
      , code: "ID"
      , format: Nothing
      }
  , Tuple Iran
      { dial_code: "+98"
      , code: "IR"
      , format: Nothing
      }
  , Tuple Iraq
      { dial_code: "+964"
      , code: "IQ"
      , format: Nothing
      }
  , Tuple Ireland
      { dial_code: "+353"
      , code: "IE"
      , format: Just "+___ __ _______"
      }
  , Tuple Isle_of_Man
      { dial_code: "+44"
      , code: "IM"
      , format: Nothing
      }
  , Tuple Israel
      { dial_code: "+972"
      , code: "IL"
      , format: Nothing
      }
  , Tuple Italy
      { dial_code: "+39"
      , code: "IT"
      , format: Just "+__ ___ ______"
      }
  , Tuple Jamaica
      { dial_code: "+1876"
      , code: "JM"
      , format: Nothing
      }
  , Tuple Japan
      { dial_code: "+81"
      , code: "JP"
      , format: Just "+__ ___ __ ____"
      }
  , Tuple Jersey
      { dial_code: "+44"
      , code: "JE"
      , format: Nothing
      }
  , Tuple Jordan
      { dial_code: "+962"
      , code: "JO"
      , format: Nothing
      }
  , Tuple Kazakhstan
      { dial_code: "+77"
      , code: "KZ"
      , format: Just "+_ ___ ___-__-__"
      }
  , Tuple Kenya
      { dial_code: "+254"
      , code: "KE"
      , format: Nothing
      }
  , Tuple Kiribati
      { dial_code: "+686"
      , code: "KI"
      , format: Nothing
      }
  , Tuple North_Korea
      { dial_code: "+850"
      , code: "KP"
      , format: Nothing
      }
  , Tuple South_Korea
      { dial_code: "+82"
      , code: "KR"
      , format: Nothing
      }
  , Tuple Kuwait
      { dial_code: "+965"
      , code: "KW"
      , format: Nothing
      }
  , Tuple Kyrgyzstan
      { dial_code: "+996"
      , code: "KG"
      , format: Nothing
      }
  , Tuple Laos
      { dial_code: "+856"
      , code: "LA"
      , format: Nothing
      }
  , Tuple Latvia
      { dial_code: "+371"
      , code: "LV"
      , format: Nothing
      }
  , Tuple Lebanon
      { dial_code: "+961"
      , code: "LB"
      , format: Nothing
      }
  , Tuple Lesotho
      { dial_code: "+266"
      , code: "LS"
      , format: Nothing
      }
  , Tuple Liberia
      { dial_code: "+231"
      , code: "LR"
      , format: Nothing
      }
  , Tuple Libya
      { dial_code: "+218"
      , code: "LY"
      , format: Nothing
      }
  , Tuple Liechtenstein
      { dial_code: "+423"
      , code: "LI"
      , format: Nothing
      }
  , Tuple Lithuania
      { dial_code: "+370"
      , code: "LT"
      , format: Nothing
      }
  , Tuple Luxembourg
      { dial_code: "+352"
      , code: "LU"
      , format: Nothing
      }
  , Tuple Macao
      { dial_code: "+853"
      , code: "MO"
      , format: Nothing
      }
  , Tuple Macedonia
      { dial_code: "+389"
      , code: "MK"
      , format: Nothing
      }
  , Tuple Madagascar
      { dial_code: "+261"
      , code: "MG"
      , format: Nothing
      }
  , Tuple Malawi
      { dial_code: "+265"
      , code: "MW"
      , format: Nothing
      }
  , Tuple Malaysia
      { dial_code: "+60"
      , code: "MY"
      , format: Just "+__ __-____-____"
      }
  , Tuple Maldives
      { dial_code: "+960"
      , code: "MV"
      , format: Nothing
      }
  , Tuple Mali
      { dial_code: "+223"
      , code: "ML"
      , format: Nothing
      }
  , Tuple Malta
      { dial_code: "+356"
      , code: "MT"
      , format: Nothing
      }
  , Tuple Marshall_Islands
      { dial_code: "+692"
      , code: "MH"
      , format: Nothing
      }
  , Tuple Martinique
      { dial_code: "+596"
      , code: "MQ"
      , format: Nothing
      }
  , Tuple Mauritania
      { dial_code: "+222"
      , code: "MR"
      , format: Nothing
      }
  , Tuple Mauritius
      { dial_code: "+230"
      , code: "MU"
      , format: Nothing
      }
  , Tuple Mayotte
      { dial_code: "+262"
      , code: "YT"
      , format: Nothing
      }
  , Tuple Mexico
      { dial_code: "+52"
      , code: "MX"
      , format: Nothing
      }
  , Tuple Micronesia
      { dial_code: "+691"
      , code: "FM"
      , format: Nothing
      }
  , Tuple Moldova
      { dial_code: "+373"
      , code: "MD"
      , format: Nothing
      }
  , Tuple Monaco
      { dial_code: "+377"
      , code: "MC"
      , format: Nothing
      }
  , Tuple Mongolia
      { dial_code: "+976"
      , code: "MN"
      , format: Nothing
      }
  , Tuple Montenegro
      { dial_code: "+382"
      , code: "ME"
      , format: Nothing
      }
  , Tuple Montserrat
      { dial_code: "+1664"
      , code: "MS"
      , format: Nothing
      }
  , Tuple Morocco
      { dial_code: "+212"
      , code: "MA"
      , format: Nothing
      }
  , Tuple Mozambique
      { dial_code: "+258"
      , code: "MZ"
      , format: Nothing
      }
  , Tuple Myanmar
      { dial_code: "+95"
      , code: "MM"
      , format: Nothing
      }
  , Tuple Namibia
      { dial_code: "+264"
      , code: "NA"
      , format: Nothing
      }
  , Tuple Nauru
      { dial_code: "+674"
      , code: "NR"
      , format: Nothing
      }
  , Tuple Nepal
      { dial_code: "+977"
      , code: "NP"
      , format: Nothing
      }
  , Tuple Netherlands
      { dial_code: "+31"
      , code: "NL"
      , format: Just "+__ __ ________"
      }
  , Tuple Netherlands_Antilles
      { dial_code: "+599"
      , code: "AN"
      , format: Nothing
      }
  , Tuple New_Caledonia
      { dial_code: "+687"
      , code: "NC"
      , format: Just "+__ ___-___-____"
      }
  , Tuple New_Zealand
      { dial_code: "+64"
      , code: "NZ"
      , format: Nothing
      }
  , Tuple Nicaragua
      { dial_code: "+505"
      , code: "NI"
      , format: Nothing
      }
  , Tuple Niger
      { dial_code: "+227"
      , code: "NE"
      , format: Nothing
      }
  , Tuple Nigeria
      { dial_code: "+234"
      , code: "NG"
      , format: Nothing
      }
  , Tuple Niue
      { dial_code: "+683"
      , code: "NU"
      , format: Nothing
      }
  , Tuple Norfolk_Island
      { dial_code: "+672"
      , code: "NF"
      , format: Nothing
      }
  , Tuple Northern_Mariana_Islands
      { dial_code: "+1670"
      , code: "MP"
      , format: Nothing
      }
  , Tuple Norway
      { dial_code: "+47"
      , code: "NO"
      , format: Just "+__ ___ __ ___"
      }
  , Tuple Oman
      { dial_code: "+968"
      , code: "OM"
      , format: Nothing
      }
  , Tuple Pakistan
      { dial_code: "+92"
      , code: "PK"
      , format: Just "+__ ___-_______"
      }
  , Tuple Palau
      { dial_code: "+680"
      , code: "PW"
      , format: Nothing
      }
  , Tuple Palestinian_Territory
      { dial_code: "+970"
      , code: "PS"
      , format: Nothing
      }
  , Tuple Panama
      { dial_code: "+507"
      , code: "PA"
      , format: Nothing
      }
  , Tuple Papua_New_Guinea
      { dial_code: "+675"
      , code: "PG"
      , format: Nothing
      }
  , Tuple Paraguay
      { dial_code: "+595"
      , code: "PY"
      , format: Nothing
      }
  , Tuple Peru
      { dial_code: "+51"
      , code: "PE"
      , format: Nothing
      }
  , Tuple Philippines
      { dial_code: "+63"
      , code: "PH"
      , format: Just "+__ ___ ____"
      }
  , Tuple Pitcairn
      { dial_code: "+872"
      , code: "PN"
      , format: Nothing
      }
  , Tuple Poland
      { dial_code: "+48"
      , code: "PL"
      , format: Just "+__ ___-___-___"
      }
  , Tuple Portugal
      { dial_code: "+351"
      , code: "PT"
      , format: Nothing
      }
  , Tuple Puerto_Rico
      { dial_code: "+1939"
      , code: "PR"
      , format: Nothing
      }
  , Tuple Qatar
      { dial_code: "+974"
      , code: "QA"
      , format: Nothing
      }
  , Tuple Romania
      { dial_code: "+40"
      , code: "RO"
      , format: Nothing
      }
  , Tuple Russia
      { dial_code: "+7"
      , code: "RU"
      , format: Just "+_ ___ ___-__-__"
      }
  , Tuple Rwanda
      { dial_code: "+250"
      , code: "RW"
      , format: Nothing
      }
  , Tuple Reunion
      { dial_code: "+262"
      , code: "RE"
      , format: Nothing
      }
  , Tuple Saint_Barthelemy
      { dial_code: "+590"
      , code: "BL"
      , format: Nothing
      }
  , Tuple Saint_Helena
      { dial_code: "+290"
      , code: "SH"
      , format: Nothing
      }
  , Tuple Saint_Kitts
      { dial_code: "+1869"
      , code: "KN"
      , format: Nothing
      }
  , Tuple Saint_Lucia
      { dial_code: "+1758"
      , code: "LC"
      , format: Nothing
      }
  , Tuple Saint_Martin
      { dial_code: "+590"
      , code: "MF"
      , format: Nothing
      }
  , Tuple Saint_Pierre_and_Miquelon
      { dial_code: "+508"
      , code: "PM"
      , format: Nothing
      }
  , Tuple Saint_Vincent
      { dial_code: "+1784"
      , code: "VC"
      , format: Nothing
      }
  , Tuple Samoa
      { dial_code: "+685"
      , code: "WS"
      , format: Nothing
      }
  , Tuple San_Marino
      { dial_code: "+378"
      , code: "SM"
      , format: Nothing
      }
  , Tuple Sao_Tome_and_Principe
      { dial_code: "+239"
      , code: "ST"
      , format: Nothing
      }
  , Tuple Saudi_Arabia
      { dial_code: "+966"
      , code: "SA"
      , format: Nothing
      }
  , Tuple Senegal
      { dial_code: "+221"
      , code: "SN"
      , format: Nothing
      }
  , Tuple Serbia
      { dial_code: "+381"
      , code: "RS"
      , format: Nothing
      }
  , Tuple Seychelles
      { dial_code: "+248"
      , code: "SC"
      , format: Nothing
      }
  , Tuple Sierra_Leone
      { dial_code: "+232"
      , code: "SL"
      , format: Nothing
      }
  , Tuple Singapore
      { dial_code: "+65"
      , code: "SG"
      , format: Just "+__ ____-____"
      }
  , Tuple Slovakia
      { dial_code: "+421"
      , code: "SK"
      , format: Nothing
      }
  , Tuple Slovenia
      { dial_code: "+386"
      , code: "SI"
      , format: Nothing
      }
  , Tuple Solomon_Islands
      { dial_code: "+677"
      , code: "SB"
      , format: Nothing
      }
  , Tuple Somalia
      { dial_code: "+252"
      , code: "SO"
      , format: Nothing
      }
  , Tuple South_Africa
      { dial_code: "+27"
      , code: "ZA"
      , format: Nothing
      }
  , Tuple South_Sudan
      { dial_code: "+211"
      , code: "SS"
      , format: Nothing
      }
  , Tuple South_Georgia
      { dial_code: "+500"
      , code: "GS"
      , format: Nothing
      }
  , Tuple Spain
      { dial_code: "+34"
      , code: "ES"
      , format: Just "+__ ___ ___ ___"
      }
  , Tuple Sri_Lanka
      { dial_code: "+94"
      , code: "LK"
      , format: Nothing
      }
  , Tuple Sudan
      { dial_code: "+249"
      , code: "SD"
      , format: Nothing
      }
  , Tuple Suriname
      { dial_code: "+597"
      , code: "SR"
      , format: Nothing
      }
  , Tuple Svalbard
      { dial_code: "+47"
      , code: "SJ"
      , format: Nothing
      }
  , Tuple Swaziland
      { dial_code: "+268"
      , code: "SZ"
      , format: Nothing
      }
  , Tuple Sweden
      { dial_code: "+46"
      , code: "SE"
      , format: Just "+__ __ ___ __ __"
      }
  , Tuple Switzerland
      { dial_code: "+41"
      , code: "CH"
      , format: Just "+__ __ ___ __ __"
      }
  , Tuple Syrian_Arab_Republic
      { dial_code: "+963"
      , code: "SY"
      , format: Nothing
      }
  , Tuple Taiwan
      { dial_code: "+886"
      , code: "TW"
      , format: Nothing
      }
  , Tuple Tajikistan
      { dial_code: "+992"
      , code: "TJ"
      , format: Nothing
      }
  , Tuple Tanzania
      { dial_code: "+255"
      , code: "TZ"
      , format: Nothing
      }
  , Tuple Thailand
      { dial_code: "+66"
      , code: "TH"
      , format: Nothing
      }
  , Tuple Timor_Leste
      { dial_code: "+670"
      , code: "TL"
      , format: Nothing
      }
  , Tuple Togo
      { dial_code: "+228"
      , code: "TG"
      , format: Nothing
      }
  , Tuple Tokelau
      { dial_code: "+690"
      , code: "TK"
      , format: Nothing
      }
  , Tuple Tonga
      { dial_code: "+676"
      , code: "TO"
      , format: Nothing
      }
  , Tuple Trinidad_and_Tobago
      { dial_code: "+1868"
      , code: "TT"
      , format: Nothing
      }
  , Tuple Tunisia
      { dial_code: "+216"
      , code: "TN"
      , format: Nothing
      }
  , Tuple Turkey
      { dial_code: "+90"
      , code: "TR"
      , format: Just "+__ ___ ___ __ __"
      }
  , Tuple Turkmenistan
      { dial_code: "+993"
      , code: "TM"
      , format: Nothing
      }
  , Tuple Turks_and_Caicos_Islands
      { dial_code: "+1649"
      , code: "TC"
      , format: Nothing
      }
  , Tuple Tuvalu
      { dial_code: "+688"
      , code: "TV"
      , format: Nothing
      }
  , Tuple Uganda
      { dial_code: "+256"
      , code: "UG"
      , format: Nothing
      }
  , Tuple Ukraine
      { dial_code: "+380"
      , code: "UA"
      , format: Nothing
      }
  , Tuple United_Arab_Emirates
      { dial_code: "+971"
      , code: "AE"
      , format: Nothing
      }
  , Tuple United_Kingdom
      { dial_code: "+44"
      , code: "GB"
      , format: Just "+__ ____ ______"
      }
  , Tuple United_States
      { dial_code: "+1"
      , code: "US"
      , format: Just "+_ (___) ___-____"
      }
  , Tuple Uruguay
      { dial_code: "+598"
      , code: "UY"
      , format: Nothing
      }
  , Tuple Uzbekistan
      { dial_code: "+998"
      , code: "UZ"
      , format: Nothing
      }
  , Tuple Vanuatu
      { dial_code: "+678"
      , code: "VU"
      , format: Nothing
      }
  , Tuple Venezuela
      { dial_code: "+58"
      , code: "VE"
      , format: Nothing
      }
  , Tuple Vietnam
      { dial_code: "+84"
      , code: "VN"
      , format: Nothing
      }
  , Tuple British_Virgin_Islands
      { dial_code: "+1284"
      , code: "VG"
      , format: Nothing
      }
  , Tuple Virgin_Islands
      { dial_code: "+1340"
      , code: "VI"
      , format: Nothing
      }
  , Tuple Wallis_and_Futuna
      { dial_code: "+681"
      , code: "WF"
      , format: Nothing
      }
  , Tuple Yemen
      { dial_code: "+967"
      , code: "YE"
      , format: Nothing
      }
  , Tuple Zambia
      { dial_code: "+260"
      , code: "ZM"
      , format: Nothing
      }
  , Tuple Zimbabwe
      { dial_code: "+263"
      , code: "ZW"
      , format: Nothing
      }
  ]

index :: Map Country CountryPhone
index =
  fromFoldable countries

