module Bcrypt where

import Test.Tasty

import Data.Password.Bcrypt

import Internal


testBcrypt :: TestTree
testBcrypt = testGroup "bcrypt"
  [ testCorrectPassword "Bcrypt (hashPassword)" (hashPasswordWithParams 4) checkPassword extractParams 4
  , testCorrectPassword "Bcrypt (hashPassword 2)" (hashPasswordWithParams 5) checkPassword extractParams 5
  , testIncorrectPassword "Bcrypt (hashPassword) fail" (hashPasswordWithParams 4) checkPassword
  , testWithSalt "Bcrypt (hashPasswordWithSalt)" (hashPasswordWithSalt 4) checkPassword extractParams 4
  ]
