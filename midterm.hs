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



-- define pythagorean with input n
pythagorean :: Int -> [(Int, Int, Int)]
pythagorean n = [(a,b,c) | a <- [1..n], b <- [1..n], c <- [1..n], a^2 + b^2 == c^2]

main :: IO()
main = do
    -- Get list from user
    print "Enter integer n: "
    line <- getLine

    -- Create integer list from space-separated input
    let ints = map read (words line) :: [Int]
    let n = head ints

    let tup = pythagorean n

    -- Show Sorted list
    putStrLn $ "Sort 1: " ++ show (tup)


-- Define square function for integers
square :: Double -> Double
square n = n*n

-- Define twice function to call square twice
twice :: (Double -> Double) -> Double -> Double  
twice f x = f (f x)

-- Get input from user
main :: IO()
main = do
    -- Get list from user
    print "Enter integer: "
    line <- getLine

    -- Create integer list from space-separated input
    let nums = map read (words line) :: [Double]
    let n = head nums
    let result = twice (square) n
    -- Show Result
    putStrLn $ "Square input twice gives: " ++ show (result)