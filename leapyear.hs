isLeapYear :: Int -> Bool
isLeapYear year =
    (mod year 400) == 0 || ((mod year 4) == 0 && not ((mod year 100) == 0))

main :: IO()
main = do
    -- Get year
    putStrLn "Enter year: "
    line <- getLine
    let ints = map read (words line) :: [Int]
    let year = head ints
    let leap = isLeapYear year
    putStrLn $ "Leap Year? " ++ show leap