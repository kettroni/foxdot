import System.Environment
import Data.List


main :: IO ()
main = compileAssembly . parseArgs =<< getArgs

parseArgs :: [String] -> String
parseArgs = head

compileAssembly :: String -> IO ()
compileAssembly inputFileName = saveAssembly . stringifyProgram . getTokens =<< readFile inputFileName

saveAssembly :: String -> IO()
saveAssembly = writeFile "output.txt"

getTokens :: String -> [String]
getTokens = words

stringifyProgram :: [String] -> String
stringifyProgram = unlines
