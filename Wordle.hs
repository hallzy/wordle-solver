import Data.List
import System.Environment

doFilter :: Char -> Char -> Int -> [String] -> [String]
doFilter choice char idx words
    | choice == 'b' = filter (notElem char) words
    | choice == 'y' = filter (\w -> char `elem` w && idx `notElem` (char `elemIndices` w)) words
    | choice == 'g' = filter (\w -> char `elem` w && (w !! idx) == char) words
    | otherwise = error $ "Invalid choice [" ++ [choice] ++ "]"

programLoop :: [String] -> IO(String)
programLoop words = do
    let word = head words

    putStrLn ""
    putStrLn "Tell me if each letter is:"
    putStrLn "    Not in the word (b)"
    putStrLn "    In the word, wrong location (y)"
    putStrLn "    In the word, correct location (g)"
    putStrLn "    Skip with a blank"
    putStrLn ""
    putStrLn $ word ++ "  (" ++ (show $ length words) ++ ")"


    choices <- getLine

    if length choices == 0 then programLoop ((tail words) ++ [word]) else aux choices word

    where
        aux choices word = do
            let char1 = head word
            let one = head choices

            let char2 = head $ drop 1 word
            let two = head $ drop 1 choices

            let char3 = head $ drop 2 word
            let three = head $ drop 2 choices

            let char4 = head $ drop 3 word
            let four = head $ drop 3 choices

            let char5 = head $ drop 4 word
            let five = head $ drop 4 choices

            let newWords1 = doFilter one char1 0 words
            let newWords2 = doFilter two char2 1 newWords1
            let newWords3 = doFilter three char3 2 newWords2
            let newWords4 = doFilter four char4 3 newWords3
            let newWords5 = doFilter five char5 4 newWords4

            if length newWords5 == 1 then return (head newWords5) else programLoop newWords5

main :: IO()
main = do
    rawWords <- readFile("words.txt")

    let words = filter ((== 5) . length) $ lines rawWords

    ans <- programLoop ("crane" : words)
    putStrLn $ "Answer: " ++ ans
