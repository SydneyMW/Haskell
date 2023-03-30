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