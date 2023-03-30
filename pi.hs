----------------------{PI}---------------------------
piTerm :: Double -> Double
piTerm 1 = sqrt(0.5 + 0.5*(sqrt 0.5))
piTerm n = sqrt(0.5 + 0.5*(piTerm (n-1)))

piCalc :: Double -> Double
piCalc n = (2*sqrt 2) / (piTerm n)
-----------------------MAIN------------------------
main :: IO()
main = do 
    -- calculate terms
    let term1 = piCalc 1
    let term2 = piCalc 2
    let term3 = piCalc 10
    putStrLn $ "term 1 = " ++ show term1
    putStrLn $ "term 2 = " ++ show term2
    putStrLn $ "term 3 = " ++ show term3