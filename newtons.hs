-- Find roots of f(x) = ax^2 + bx + c

-- Given f(x) = a*x^2 + b*x + c
fX :: Double -> Double -> Double -> Double -> Double
fX a b c x = a*(x**2) + b*x + c

-- Compute f'(x) = 2*ax + b
fPrimeX :: Double -> Double -> Double -> Double
fPrimeX a b x = 2*(a*x) + b

-- initial call, calculate x1 with initial value x0 given
newton1 :: Double -> Double -> Double -> Double -> Double
newton1 a b c x0 = diff
    where 
        diff = x0 - f / fprime
        f = fX a b c x0
        fprime = fPrimeX a b x0

-- recursive call calculating error
newton :: Double -> Double -> Double -> Double -> Double -> Double
newton a b c xi epsilon = 
    if smaller then xiPlus
    else newton a b c xiPlus epsilon
    where 
        xiPlus = xi - f / fprime
        f = fX a b c xi
        fprime = fPrimeX a b xi
        err = xi - xiPlus
        smaller = abs (xi - xiPlus) < epsilon

main :: IO()
main = do
    -- get a, b, c from user
    print "a, b, and c separated by spaces: "
    line <- getLine
    let nums = map read (words line) :: [Double]
    let a = head nums
    let b = head (tail nums)
    let c = head (tail (tail nums))

    putStrLn $ "a = " ++ show a ++ ", b = " ++ show b ++ ", c = " ++ show c
    let x1_A = newton1 a b c (-10.0)
    let x1_B = newton1 a b c 10.0
    let epsilon = 0.0001
    let root_A = newton a b c x1_A epsilon
    let root_B = newton a b c x1_B epsilon
    putStrLn $ "Resulting roots = " ++ show root_A ++ " and " ++ show root_B