import System.Environment
import Data.List

main = do
        args <- getArgs
        contents <- readFile (head args)
        return (words contents)
