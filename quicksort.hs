{-
Consider a list of n integers
Wrtie qsort.hs to recursively sort the list in ascending order 
Use the quicksort algorithm which uses first element as a partition m, and puts all x<m to the left and all x>=m to the right
Recursively call quicksort on right and left sides
-}

{- 
* qsort takes a list and returns a list of the same type
* list elements must be comparable; must be of ordered typeclass -}

qsort0 :: (Ord a) => [a] -> [a]
qsort0[] = []
qsort0(m:xs) = qsort0 [x | x<-xs, x<m] ++ [m] ++ qsort0[x | x<-xs, x>=m]

qsort1 :: (Ord a) => [a] -> [a]
qsort1[] = []
qsort1 (m:xs) = -- m is middle, xs is list
    let
        -- define left half
        -- include each x in xs where x < p
        left = qsort1[x | x<-xs, x<m]
        -- define right half
        -- include each x in xs where x >= p
        right = qsort1[x | x<-xs, x>=m]
    in left ++ [m] ++ right

qsort2 :: (Ord a) => [a] -> [a]
qsort2[] = []
qsort2 (m:xs) = -- m is middle, xs is list
    qsort2 left ++ [m] ++ qsort2 right
    where
        -- define left half
        -- include each x in xs where x < p
        left = [x | x<-xs, x<m]
        -- define right half
        -- include each x in xs where x >= p
        right = [x | x<-xs, x>=m]

qsort3 :: (Ord a) => [a] -> [a]
qsort3[] = []
qsort3 (m:xs) = -- m is middle, xs is list
    left ++ [m] ++ right
    where
        -- define left half
        -- include each x in xs where x < p
        left = qsort3 [x | x<-xs, x<m]
        -- define right half
        -- include each x in xs where x >= p
        right = qsort3 [x | x<-xs, x>=m]

main = do
    -- Get list from user
    print "Enter list of integers separated by spaces to be sorted: "
    line <- getLine

    -- Create integer list from space-separated input
    let ints = map read (words line) :: [Int]
    -- read :: Read a => String -> a   -- Defined in `Text.Read'
    -- map :: (a -> b) -> [a] -> [b]   -- Defined in `GHC.Base'
    -- words line ~> ["1","2","3","4","5"]
    -- map read (words line) ~> [1,2,3,4,5]

    putStrLn $ "Sort 1: " ++ show (qsort1 ints)
    putStrLn $ "Sort 2: " ++ show (qsort2 ints)
    putStrLn $ "Sort 3: " ++ show (qsort3 ints)

    {- USAGE: (powershell or terminal, cd to dir)
    ghc "quicksort.hs"
    ./quicksort
    -}

    {- USAGE:
    :load "./Midterm review/quicksort.hs"
    quicksort
    -}