fact :: Double -> Double
fact 1 = 1
fact n = 
    n * fact (n-1)

nPk :: Double -> Double -> Double
nPk n k = 
    fact_n / fact_nk
    where
        fact_n = fact n
        fact_nk = fact (n-k)

nCk :: Double -> Double -> Double
nCk n k = 
    fact_n / (fact_k * fact_nk)
    where
        fact_n = fact n
        fact_k = fact k
        fact_nk = fact (n-k)

main:: IO()
main = do
    print "Enter integers n, k separated by a space: "
    line <- getLine
    let nums = map read(words line) :: [Double]
        n = head nums
        k = head (tail nums)
        perm = nPk n k
        comb = nCk n k
    putStrLn $ "nPk: " ++ show perm
    putStrLn $ "nCk: " ++ show comb
