import Control.Monad.Cont

conChar :: Char -> Int -> String
conChar c 0 = []
conChar c n =
    c : conChar c (n-1)

makeLine :: Int -> IO()
makeLine n = do
    let numSpace = n
        numStar = 5-n
        line = conChar ' ' numSpace ++ conChar '*' numStar
    putStrLn line

main :: IO()
main = do
    forM_[0..4] $ \n -> do
        makeLine n