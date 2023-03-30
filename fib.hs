-- fibonacci
fib :: Int -> Int
fib 1 = 1
fib 2 = 1
fib n = fib (n-1) + fib (n-2)

fibShow :: Int -> [Int]
fibShow 0 = []
fibShow n =
    fibShow (n-1) ++ 
    [fib n]

-- main
main :: IO()
main = do
    -- fibonacci term
    let fib20 = fibShow 20
    putStrLn $ "The first 20 fibonacci terms = " ++ show fib20