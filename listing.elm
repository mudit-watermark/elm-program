import Html exposing (..)
import Html.Attributes exposing (value, src, placeholder, style)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)


--main
Main = {
    init = init
    ,view = view
    ,update = update
    ,subscriptions = subscriptions
    }

--alias
type alias ApiData = {
                id:Int
                ,userId:Int
                ,title:String
                ,body:String
                }

type alias Model = {
                apiData:ApiData
                }
