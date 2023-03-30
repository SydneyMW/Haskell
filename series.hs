-- SERIES CALCULATIONS
-- USAGE: 
-- ghc series.hs
-- ./series

----------------------{FACTORIAL}-----------------
fact :: Double -> Double
fact n = if n == 0 then 1 else n * fact(n-1)

----------------------{EXP e^x}-------------------
-- e^x = sum(n = 0 to inf) of x^n / n!
-- compute a single term x^n / n!
eXTerm :: Double -> Double -> Double
eXTerm x n = x**n / fact n

-- define e^x recursively as a sum of a series
eX :: Double -> Double -> Double
eX x n = 
    if n == 0 then 1
    else eXTerm x n + eX x (n-1)

----------------------{1 / (1-x)}-----------------
-- define 1/(1-x) = sum (n = 0 to inf) of x^n
oneX :: Double -> Double -> Double
oneX x n = 
    if n == 0 then 1 
    else x**n + oneX x (n-1)

----------------------{COS X}---------------------
cosXTerm :: Double -> Double -> Double
cosXTerm x n = sign*(num/denom)
    where
        sign = (-1)**n
        num = x**(2*n)
        denom = fact(2*n)

cosX :: Double -> Double -> Double
cosX x n = 
    if n == 0 then 1
    else cosXTerm x n + cosX x (n-1)

----------------------{SIN X}---------------------
sinXTerm :: Double -> Double -> Double
sinXTerm x n = sign*(num/denom)
    where
        sign = (-1)**n
        num = x**(2*n + 1)
        denom = fact(2*n + 1)

sinX :: Double -> Double -> Double
sinX x n =
    if n == 0 then x
    else sinXTerm x n + sinX x (n-1)

----------------------{LN (1 + X)}-----------------
ln1XTerm :: Double -> Double -> Double
ln1XTerm x n = sign*(num/n)
    where
        sign = (-1)**(n+1)
        num = x**n

ln1X :: Double -> Double -> Double
ln1X x n =
    if n == 1 then x
    else ln1XTerm x n + ln1X x (n-1)


----------------------{TAN-1(X)}---------------------
tan1XTerm :: Double -> Double -> Double
tan1XTerm x n = sign*(num/denom)
    where 
        sign = (-1)**n
        num = x**(2*n + 1)
        denom = 2*n + 1

tan1X :: Double -> Double -> Double
tan1X x n = 
    if n == 0 then x
    else tan1XTerm x n + tan1X x (n-1)

----------------------{PI}---------------------------
piTerm :: Double -> Double
piTerm 1 = sqrt(0.5 + 0.5*(sqrt 0.5))
piTerm n = sqrt(0.5 + piTerm (n-1))

-----------------------MAIN------------------------
main :: IO()
main = do 
    -- calculate pi
    let pi = piTerm 10
    putStrLn $ "pi calculated with 10 terms = " ++ show pi
    -- get x value from user
    print "Enter an x-value: "
    line <- getLine
    let nums = map read (words line) :: [Double]
    let x = head nums

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

    -- compute and print cos(x)
    let cosx = cosX x 100
    putStrLn $ "cos(x) = " ++ show cosx

    -- compute and print sin(x)
    let sinx = sinX x 100
    putStrLn $ "sin(x) = " ++ show sinx

    -- compute and print sin(2x)
    let sin2x = 2*sinx*cosx
    putStrLn $ "sin(2x) = " ++ show sin2x

    -- compute and print cos(2x)
    let cos2x = cosx*cosx - (sinx*sinx)
    putStrLn $ "cos(2x) = " ++ show cos2x

    -- get x value in (-1, 1) from user
    print "Enter an x-value within (-1, 1) with leading zero: "
    line2 <- getLine
    let nums_small = map read (words line2) :: [Double]
    let x_small = head nums_small

    -- compute and print 1/(1-x)
    let onex = oneX x_small 10
    putStrLn $ "1/(1-x) = " ++ show onex
    
    -- compute and print ln(1+x)
    let ln1x = ln1X x_small 100
    putStrLn $ "ln(1+x) = " ++ show ln1x

    -- compute and print tan-1(x)
    let tan1x = tan1X x_small 100
    putStrLn $ "tan-1(x) = " ++ show tan1x