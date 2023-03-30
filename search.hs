{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
linearSearch :: [Int] -> Int -> Bool
linearSearch [] a = False
linearSearch (x:xs) a =
    (a == x) || linearSearch xs a

binarySearch :: [Int] -> Int -> Int -> Int -> Int
binarySearch xs a low high
   | high < low = -1
   | xs!!mid > a = binarySearch xs a low (mid-1)
   | xs!!mid < a = binarySearch xs a (mid+1) high
   | otherwise = mid
   where
       mid = low + ((high - low) `div` 2)


main :: IO()
main = do
    -- Get list of ints
    putStrLn "Enter integers to comprise a list"
    line <- getLine
    let ints = map read (words line) :: [Int]

    putStrLn "Enter element to search list for"
    line2 <- getLine
    let ints2 = map read (words line2) :: [Int]
    let elmt2 = head ints2
    let found2 = binarySearch ints elmt2 1 (length ints)
    putStrLn $ "Is element in list? " ++ show found2
    
    putStrLn "Enter element to search list for"
    line3 <- getLine
    let ints3 = map read (words line3) :: [Int]
    let elmt3 = head ints3
    let found3 = linearSearch ints elmt3
    putStrLn $ "Is element in list? " ++ show found3