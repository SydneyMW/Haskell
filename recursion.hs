-- head-recursive factorial
fact :: Int -> Int
fact n =
    if n == 0 then 1
    else n * fact (n-1)

-- tail-recursive factorial
factt :: Int -> Int
factt n = factorial n 1

factorial :: Int -> Int -> Int
factorial 0 prod = prod
factorial n prod = factorial (n-1) (prod*n)

-- fibonacci
fib :: Int -> Int
fib 1 = 1
fib 2 = 1
fib n = fib (n-1) + fib (n-2)

-- power
pow :: Int -> Int -> Int
pow x 0 = 1
pow x n = x * pow x (n-1)

-- sum sequence of ints
sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

-- min of sequence of ints
minListInit :: [Int] -> Int
minListInit (x:xs) = minList xs x

minList :: [Int] -> Int -> Int
minList [] x = x
minList (x:xs) y =
    if x < y then minList xs x
    else minList xs y

-- max of sequence of ints
maxListInit :: [Int] -> Int
maxListInit (x:xs) = maxList xs x

maxList :: [Int] -> Int -> Int
maxList [] x = x
maxList (x:xs) y =
    if x > y then maxList xs x
    else maxList xs y

-- remove element from list (unused)
remove_first :: [Int] -> Int -> [Int]
remove_first = \list -> \v ->
    case list of
        x:xs | v==x -> xs
        x:xs -> x:remove_first xs v

-- quicksort
qsort :: (Ord a) => [a] -> [a]
qsort[] = []
qsort (m:xs) =
    left ++ [m] ++ right
    where
        left = qsort [x | x<-xs, x<m]
        right = qsort [x | x<-xs, x>=m]

-- reverse quicksort
qsortReverse :: (Ord a) => [a] -> [a]
qsortReverse [] = []
qsortReverse (m:xs) =
    left ++ [m] ++ right
    where
        left = qsortReverse [x | x<-xs, x>m]
        right = qsortReverse [x | x<-xs, x<=m]

-- second min of sequence of ints
secondMin :: [Int] -> Int
secondMin (x:xs) = newMin
    where
        newList = qsort (x:xs)
        newMin = head (tail newList)

-- second max of sequence of ints
secondMax :: [Int] -> Int
secondMax (x:xs) = newMax
    where
        newList = qsortReverse (x:xs)
        newMax = head (tail newList)

-- is prime or not
isPrimeInit :: Int -> Bool
isPrimeInit 1 = False
isPrimeInit 2 = False
isPrimeInit n = isPrime n (n-1)

isPrime :: Int -> Int -> Bool
isPrime n 1 = True
isPrime n i =
    (not (divides n i)) && isPrime n (i-1)

divides :: Int -> Int -> Bool
divides n i = rem n i == 0

-- Prime factorization
factorize :: Integer -> Integer -> [Integer]
factorize _ 1 = [] 
factorize d n 
    | d * d > n = [n]
    | n `mod` d == 0 = d : factorize d (n `div` d)
    | otherwise = factorize (d + 1) n

primeFactors :: Integer -> [Integer]
primeFactors = factorize 2

-- GCD
gcdVal :: Int -> Int -> Int
gcdVal x y =  gcd' (abs x) (abs y)
    where
        gcd' a 0  =  a
        gcd' a b  =  gcd' b (a `rem` b)

-- LCM
lcmVal :: Int -> Int -> Int
lcmVal x y = (div (x*y) (gcd x y))

-- main
main :: IO()
main = do
    -- n factorial
    let fact5 = factt 5
    putStrLn $ "5! = " ++ show fact5

    -- fibonacci term
    let fib5 = fib 5
    putStrLn $ "The 5th fibonnaci term = " ++ show fib5

    -- power of x^n
    let pow25 = pow 2 5
    putStrLn $ "2^5 = " ++ show pow25

    -- sum of list
    let list = [1,2,3,4,5]
    let sumlist = sumList list
    putStrLn $ "Sum of list [1,2,3,4,5] = " ++ show sumlist

    -- min, max of list
    let list2 = [3,5,-1,12,7]
    let minlist2 = minListInit list2
    let maxlist2 = maxListInit list2
    putStrLn $ "Min of list [3,5,-1,12,7] = " ++ show minlist2
    putStrLn $ "Max of list [3,5,-1,12,7] = " ++ show maxlist2

    -- second min, second max of list
    let secondMinList2 = secondMin list2
    let secondMaxList2 = secondMax list2
    putStrLn $ "Second min of list [3,5,-1,12,7] = " ++ show secondMinList2
    putStrLn $ "Second max of list [3,5,-1,12,7] = " ++ show secondMaxList2

    -- detect primes
    let prime1 = isPrimeInit 1
    let prime2 = isPrimeInit 2
    let prime3 = isPrimeInit 12
    let prime4 = isPrimeInit 13
    let prime5 = isPrimeInit 14
    let prime6 = isPrimeInit 29
    let prime7 = isPrimeInit 11
    let prime8 = isPrimeInit 18
    putStrLn $ "1 is prime: " ++ show prime1
    putStrLn $ "2 is prime: " ++ show prime2
    putStrLn $ "12 is prime: " ++ show prime3
    putStrLn $ "13 is prime: " ++ show prime4
    putStrLn $ "14 is prime: " ++ show prime5
    putStrLn $ "29 is prime: " ++ show prime6
    putStrLn $ "11 is prime: " ++ show prime7
    putStrLn $ "18 is prime: " ++ show prime8

    -- GCD
    let valA = 24
    let valB = 16
    let gcdval = gcdVal valA valB
    let lcmval = lcmVal valA valB
    putStrLn $ "GCD(24, 16) = " ++ show gcdval
    putStrLn $ "LCM(24, 16) = " ++ show lcmval

    -- Prime factorization
    let primefactors = primeFactors 96
    putStrLn $ "Factorization of 96 = " ++ show primefactors
    