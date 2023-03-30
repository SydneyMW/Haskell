-- define mergeSort for integers
mergeSort :: [Int] -> [Int]
mergeSort[] = []
mergeSort[a] = [a]
mergeSort xs = merge (mergeSort as) (mergeSort bs)
    where
        as = let { n = length xs } in take (div n 2) xs
        bs = let { n = length xs } in drop (div n 2) xs

-- define mergine of two lists
merge :: [Int] -> [Int] -> [Int]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) 
    | x <= y    = x:merge xs (y:ys)
    | otherwise = y:merge (x:xs) ys

main :: IO()
main = do
    -- Get list from user
    print "Enter list of integers separated by spaces to be sorted: "
    line <- getLine

    -- Create integer list from space-separated input
    let ints = map read (words line) :: [Int]

    -- Show Sorted list
    putStrLn $ "Sort 1: " ++ show (mergeSort ints)