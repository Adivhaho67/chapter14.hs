{-# LANGUAGE NumericUnderscores #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE PartialTypeSignatures #-}

module Main where

import System.Random (randomRIO)
import Data.List (group, sort)
import Control.Monad (forever)
import Data.Char (toUpper)

---------------------------------------------------------
-- HC14T1 & HC14T2: Hello Cabal & Random Number
---------------------------------------------------------
helloCabal :: IO ()
helloCabal = putStrLn "Hello, Cabal!"

printRandomNumber :: IO ()
printRandomNumber = do
    num <- randomRIO (1,100) :: IO Int
    putStrLn ("Random number between 1 and 100: " ++ show num)

---------------------------------------------------------
-- HC14T3: NumericUnderscores Extension
---------------------------------------------------------
printLargeNumbers :: IO ()
printLargeNumbers = do
    let bigNumber = 1_000_000
        biggerNumber = 10_000_000_000
    putStrLn ("Big number: " ++ show bigNumber)
    putStrLn ("Bigger number: " ++ show biggerNumber)

---------------------------------------------------------
-- HC14T4: TypeApplications Extension
---------------------------------------------------------
stringToInt :: String -> Int
stringToInt s = read @Int s

demoStringToInt :: IO ()
demoStringToInt = putStrLn ("Convert '42' to Int: " ++ show (stringToInt "42"))

---------------------------------------------------------
-- HC14T5: Custom Data Type & Pattern Matching with @
---------------------------------------------------------
data Result a = Success a | Failure String

describeResult :: Result a -> String
describeResult r@(Success _) = "Success: " ++ showResult r
describeResult (Failure msg) = "Failure: " ++ msg

showResult :: Result a -> String
showResult (Success _) = "Value exists"
showResult _ = "No value"

demoResult :: IO ()
demoResult = do
    let r1 = Success 100
        r2 = Failure "Error occurred"
    putStrLn (describeResult r1)
    putStrLn (describeResult r2)

---------------------------------------------------------
-- HC14T6 & HC14T7: Project Structure & Library Component
-- Demonstrated in file/folder organization and .cabal setup.
-- Here we demonstrate usage of a helper function from a library.
---------------------------------------------------------
-- Example utility that could be in src/Utils.hs
greet :: String -> String
greet name = "Hello, " ++ name ++ "!"

demoGreet :: IO ()
demoGreet = putStrLn (greet "Cabal User")

---------------------------------------------------------
-- HC14T8: Character Frequency Function
---------------------------------------------------------
counts :: String -> [(Char, Int)]
counts s = [(head g, length g) | g <- group (sort s)]

demoCounts :: IO ()
demoCounts = do
    let text = "haskell cabal"
    putStrLn ("Character frequencies in \"" ++ text ++ "\": " ++ show (counts text))

---------------------------------------------------------
-- HC14T9: PartialTypeSignatures Extension
---------------------------------------------------------
partialFunction :: _ -> Int
partialFunction x = length x

demoPartialFunction :: IO ()
demoPartialFunction = putStrLn ("Length of 'test' using partial function: " ++ show (partialFunction "test"))

---------------------------------------------------------
-- HC14T10: Cabal Test Suite
-- Normally placed in test/ folder; here is a demo function
---------------------------------------------------------
demoTestCounts :: IO ()
demoTestCounts = do
    let test1 = counts "aab" == [('a',2),('b',1)]
        test2 = counts "" == []
    putStrLn ("Test counts 'aab' passed? " ++ show test1)
    putStrLn ("Test counts empty string passed? " ++ show test2)

---------------------------------------------------------
-- MAIN FUNCTION (Demonstrates all Chapter 14 tasks)
---------------------------------------------------------
main :: IO ()
main = do
    putStrLn "\n--- HC14T1: Hello Cabal ---"
    helloCabal

    putStrLn "\n--- HC14T2: Random Number ---"
    printRandomNumber

    putStrLn "\n--- HC14T3: NumericUnderscores ---"
    printLargeNumbers

    putStrLn "\n--- HC14T4: TypeApplications ---"
    demoStringToInt

    putStrLn "\n--- HC14T5: Custom Data Type Result ---"
    demoResult

    putStrLn "\n--- HC14T6/HC14T7: Project Structure & Library Demo ---"
    demoGreet

    putStrLn "\n--- HC14T8: Character Frequency Counts ---"
    demoCounts

    putStrLn "\n--- HC14T9: PartialTypeSignatures ---"
    demoPartialFunction

    putStrLn "\n--- HC14T10: Demo Test Suite for counts ---"
    demoTestCounts
