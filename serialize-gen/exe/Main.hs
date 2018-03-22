{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import           Data.Foldable (for_)
import           Data.Text     (Text)

data Language = Cxx | Java
    deriving (Bounded, Enum)

allLanguages :: [Language]
allLanguages = [minBound..]

data Serialize = Serialize

serialize :: Serialize
serialize = Serialize

type Code = Text

toCode :: Serialize -> Language -> Code
toCode _ _ = ""

export :: Language -> Code -> IO ()
export _ _ = pure ()

main :: IO ()
main =
    for_ allLanguages $ \language ->
        export language $ toCode serialize language
