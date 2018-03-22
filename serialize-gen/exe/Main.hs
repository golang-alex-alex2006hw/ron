module Main (main) where

import           Control.Applicative ((<|>))
import           Data.Semigroup      ((<>))
import           Options.Applicative (execParser, flag', fullDesc, helper, info,
                                      long, progDesc)

import           RON.Serialize.Gen   (Language (..), generate)

main :: IO ()
main = do
    language <- parseOptions
    generate language
  where
    parseOptions = execParser $
        info
            (helper <*> options)
            (fullDesc <> progDesc "Generate `serialize` code")
    options = flag' Cxx (long "cxx") <|> flag' Java (long "java")
