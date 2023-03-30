import Text.Read.Lex (hsLex)
sumInts :: [Int] -> Int
sumInts (x:xs) = if null xs
    then x
    else x + (sum xs)

sumNums :: (Num a) => [a] -> a
sumNums (x:xs) = if null xs
    then x
    else x + (sum xs)

main :: IO()
main = do
    -- If else
    let var = 23 
    if var `rem` 2 == 0 
        then putStrLn "Number is Even" 
        else putStrLn "Number is Odd"
    
    -- If else if else
    let obj = 16
    if obj < 4
        then putStrLn "object is < 4"
    else if obj < 16
        then putStrLn "object is between 4 and 16"
    else
        putStrLn "object is >= 16"

    -- Sum integers from input
    putStrLn "Enter integers to sum"
    line <- getLine
    let ints = map read (words line) :: [Int]
    let total = sumInts ints
    putStrLn $ "Total sum of ints: " ++ show total
    -- Sum ints/floats from input
    putStrLn "Enter integers or floats to sum"
    fline <- getLine
    let nums = map read (words fline) :: [Double]
    let totalNum = sumNums nums
    putStrLn $ "Total sum of floats: " ++ show totalNum
    

{-USAGE: cd into dir containing .hs
ghc conditionals.hs
./conditionals
-}