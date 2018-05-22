import Html exposing (text)
import List

checkNumberExist num =
    let
      myList = [1,2,3]
    in
     List.member num myList
     |>toString

main =
  text (checkNumberExist 6)
