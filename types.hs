{- ghci toggles interactive interpreter -}

{- ************** ARITHMETIC ************** -}
let addition = 2 + 3 -- 5
    subtract = 2 - 3 -- -1
    subtract_negative = 2 - (-3) -- 5
    subtract_negative_err = 2 - -3 -- ERROR

    multiply = 2*3 -- 6
    div = 2/3 -- 0.66666666666666
    div_errror = 2 div 3 -- ERROR

    power_int = 2^3 -- 8
    power_float = 2 ** 3 -- 8.0
    power_float_err = 2^3.0 -- ERROR

    floor_float = floor 3.7 -- 3
    ceiling_float = ceiling 3.7 -- 4

    round_up = round 4.7 -- 5
    round_down = round 4.3 -- 4

    truncate_pi = truncate pi -- 3
    truncate_float = truncate 4.7 -- 4

    sqrt_int = sqrt 16 -- 4.0
    sqrt_float = sqrt 2 -- 1.4142135623730951

{- ************** LISTS ************** -}
    list_int = [1, 2, 3, 4, 5] -- [1,2,3,4,5]
    list_int_iterative = [1..5]  -- [1,2,3,4,5]
    list_int_reverse_iterative = [5,4..1] -- [5,4,3,2,1]
    list_int_skip_iterative = [1,4..15] -- [1,4,7,10,13]
    list_float = [1, 2.0, 3, 4.0, 5] -- [1.0,2.0,3.0,4.0,5.0]
    list_float_iterative = [1.0,1.25..2.0] -- [1.0,1.25,1.5,1.75,2.0]
    list_float_iterative_limit = [1.0..1.8] -- [1.0,2.0]
    list_char = ['a','b','c','d','e'] -- "abcde"

    concat_list = [1,2,3] ++ [4,5,6] -- [1,2,3,4,5,6]
    concat_construct_list = 1:[2,3] -- [1,2,3]
    concat_concat_construct_list = 1:2:[3,4] -- [1,2,3,4]

    head_int_list = head [1,2,3,4] -- 1
    tail_int_list = tail [1,2,3,4] -- [2,3,4]
    head_char_list = head "abcde" -- "a"
    tail_char_list = tail "abcde" -- "bcde"

{- ************** STRINGS ************** -}
    string_simple = "Simple string"
    string_newline = "String with newline-->\n<--here"
    char_concat = ['s','t','r','i','n','g'] -- "string"
    char_list_eq_string = char_concat == "string" -- True
    string_empty = "" == [] -- True
    string_concat_construct = 'a':"bc" -- "abc"
    string_concat = "abc" ++ "def" -- "abcdef"

    list_take = take 2 [1,2,3,4,5] -- [1,2]
    list_drop = drop 2 [1,2,3,4,5] -- [3,4,5]

{- ************** TUPLES ************** -}
    -- TUPLES are denoted with comma-separated elements enclosed in parenthesis
    two_tuple = (1,"abcde") -- (1,"abcde")
    three_tuple = (1, "abcde", True) -- (1,"abcde", True)
    pair_first = fst two_tuple -- 1
    pair_second = snd two_tuple -- "abcde"
    three_first = fst three_tuple -- ERROR
    three_second = snd three_tuple -- ERROR

{- ************** TYPE CHECK ************** -}
    end1 = "end1"
    {-
    :type 3+2 -- 3+2 :: Num a => a
    :type ceiling 3.7 -- ceiling 3.7 :: Integral b => b
    :type 'a' -- 'a' :: Char
    :type 'a':"bc" -- 'a':"bc" :: [Char]
    :type 'a':['b','c'] -- 'a':['b','c'] :: [Char]
    :type [[True],[False,False]] -- [[True],[False,False]] :: [[Bool]]
    :type (True, "abcde") -- (True, "abcde") :: (Bool, [Char])
    :type ('a','b', False) -- ('a', 'b', False) :: (Char, Char, Bool)
    -}

{- ************** TYPE DEFINITION ************** -}
    end2 = "end2"
    {- 
    Haskell's types are:

    * STRONG: Haskell will not automatically coerce a value from one type to another; if an integer is passed to a float function, it will throw an error.  If an ambiguous numeric value is passed to a float function, Haskell will appropriately "decide" that it is a float and it will permanently remain a float unless coerced manually by the programmer.

    * STATIC: the compiler knows the type of every value and expression at compile time, before any code is executed.  It will reject code if it detects that we use expressions whose types don't match before we run it. For example, True && "false" will throw "couldn't match expected type 'Bool' against inferred type '[Char]'" since the && operator requires both arguments to be of type Bool

    * OFTEN INFERRED: Haskell compiler can automatically detect types of almost all expressions in the program, though we can (optionally) explicitly declare any value's type to avoid ambiguity.
    -}
    end3 = "end3"