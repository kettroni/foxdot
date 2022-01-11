import System.Environment
import Data.Function
import Data.List
import Data.Char (isNumber)

data OperCode = NullOp
        | Push
        | Pop
        | Addition
        deriving (Show, Eq, Ord, Enum)

type Instruction = (OperCode, [Int])

main :: IO ()
main = compileAssembly . parseArgs =<< getArgs

parseArgs :: [String] -> String
parseArgs = head

compileAssembly :: String -> IO ()
compileAssembly inputFileName = saveAssembly . map createInstruction . getTokens =<< readFile inputFileName

saveAssembly :: [Instruction] -> IO()
saveAssembly = writeFile "output.asm" . concatMap assembleInstruction

assembleInstruction :: Instruction -> String
assembleInstruction instruct = case instruct of
                            (Push, x) -> show instruct ++ "\n"
                            (Pop, _) -> show instruct ++ "\n"
                            (Addition, _) -> show instruct ++ "\n"
                            _ -> "not implemented\n"

getTokens :: String -> [String]
getTokens = words

createInstruction :: String -> Instruction
createInstruction str = case str of
                            "" -> (NullOp, [])
                            "+" -> (Addition, [0])
                            isNumber -> (Push, [read str])

