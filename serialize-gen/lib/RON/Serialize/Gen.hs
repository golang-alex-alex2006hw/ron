{-# LANGUAGE OverloadedStrings #-}

module RON.Serialize.Gen where

import           Data.Text        (Text)
import qualified Data.Text.IO     as Text
import           System.Directory (createDirectoryIfMissing)

data Language = Cxx | Java

data Serialize = Serialize

serialize :: Serialize
serialize = Serialize

type Code = Text

toCode :: Language -> Serialize -> Code
toCode _ _ = ""

export :: Language -> Code -> IO ()
export language code = do
    createDirectoryIfMissing True outDir
    Text.writeFile file code
  where
    outDir = ".generated"
    file = outDir ++ "/serialize." ++ ext
    ext = case language of
        Cxx  -> "cpp"
        Java -> "java"

generate :: Language -> IO ()
generate language = export language $ toCode language serialize
