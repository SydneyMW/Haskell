{- DISPLAY PATTERN:
_ _ * _ _
_ * * * _
* * * * *
_ * * * _
_ _ * _ _
-}
import Control.Monad.Cont

conChar :: Char -> Int -> String
conChar c 0 = []
conChar c n =
    c : conChar c (n-1)

makeLine :: Int -> IO()
makeLine n = do
    let numSpace = 2 - n
        numStar = n
        line = conChar '_' numSpace ++ conChar '*' numStar ++ "*" ++ conChar '*' numStar ++ conChar '_' numSpace
    putStrLn line

main :: IO()
main = do
    print "Making pattern with method 1: "
    forM_ [0..2] $ \n -> do
        let numSpace = 2 - n
            numStar = n
            line = conChar '_' numSpace ++ conChar '*' numStar ++ "*" ++ conChar '*' numStar ++ conChar '_' numSpace
        putStrLn line
    forM_[1,0] $ \n -> do
        let numSpace = 2 - n
            numStar = n
            line = conChar '_' numSpace ++ conChar '*' numStar ++ "*" ++ conChar '*' numStar ++ conChar '_' numSpace
        putStrLn line
    print "Making pattern with method 2: "
    forM_ [0,1,2,1,0] $ \n -> do
        makeLine n