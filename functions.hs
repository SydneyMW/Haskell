{- MYDROP:
INPUT: a number t elements to drop, a list [a]
OUTPUT: list [a] after n elements are dropped
* (Ord t) places constraint that t must be of a totally ordererd typeclass so that it can be compared using <=
* (Num t) places constraint that t must be of a numeric typeclass so that it can be compared to 0
-}

myDrop :: (Ord t, Num t) => t -> [a] -> [a]
myDrop n xs = if n <= 0 || null xs
    then xs  -- return original list if n <= 0
    else myDrop (n-1) (tail xs) -- drop head by recurse with n-1 and tail

{- USAGE:
:load "./Midterm review/functions.hs"
let drop_string = myDrop 2 "abcde"
drop_string ~> "cde"

let drop_too_many = myDrop 4 [1,2]
drop_too_many ~> []

let drop_negative = myDrop (-2) "abcde"
drop_negative ~> "abcde"
-}