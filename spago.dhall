{ name = "my-project"
, dependencies =
  [ "arrays"
  , "console"
  , "effect"
  , "maybe"
  , "ordered-collections"
  , "prelude"
  , "strings"
  , "test-unit"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
