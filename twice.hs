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