{ name = "my-project"
, dependencies =
  [ "arrays"
  , "console"
  , "effect"
  , "maybe"
  , "ordered-collections"
  , "prelude"
  , "tuples"
  , "test-unit"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
