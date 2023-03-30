-- SERIES CALCULATIONS
-- USAGE: 
-- ghc series.hs
-- ./series

fact :: Int -> Int
fact n = if n == 0 then 1 else n * fact(n-1)

-- e^x = sum(n = 0 to inf) of x^n / n!
-- compute a single term x^n / n!
eXTerm :: Double -> Int -> Double
eXTerm x n = x^^n / fromIntegral (fact n)

-- define e^x recursively as a sum of a series
eX :: Double -> Int -> Double
eX x n = 
    if n == 0 then 1
    else (eXTerm x n) + (eX x (n-1))

-- define 1/(1-x) = sum (n = 0 to inf) of x^n
oneX :: Double -> Int -> Double
oneX x n = 
    if n == 0 then 1 
    else x^^n + oneX x n-1

main :: IO()
main = do 
    -- get x value from user
    print "Enter an x-value: "
    line <- getLine
    let nums = map read (words line) :: [Double]
    let x = head nums

    let extest0 = eX x 0
    let extest1 = eX x 1
    let extest2 = eX x 2
    let extest10 = eX x 10
    putStrLn $ "n = 0, sum is = " ++ show extest0
    putStrLn $ "n = 1, sum is = " ++ show extest1
    putStrLn $ "n = 2, sum is = " ++ show extest2
    putStrLn $ "n = 10, sum is = " ++ show extest10

    -- compute and print e^x
    let ex = eX x 100
    putStrLn $ "e^x = " ++ show ex

    -- compute and print e^{2x}
    let e2x = eX x 100 * eX x 100
    let e22x = eX x 100 ** 2
    putStrLn $ "e^{2x} = " ++ show e2x
    putStrLn $ "e^{2x} = " ++ show e22x

    -- compute and print e^{-x}
    let eNegx = 1 / eX x 100
    putStrLn $ "e^{-x} = " ++ show eNegx

    -- compute and print 1/(1-x)
    --let onex = oneX x 10
    --putStrLn $ "1/(1-x) = " ++ show onex