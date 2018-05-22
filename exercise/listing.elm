import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (style, placeholder, value, src)
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline  exposing (decode, required, optional)
import List
--- Define Main
main =
      Html.program{
      init = init
      ,view = view
      ,update = update
      ,subscriptions = subscriptions
    }

--  MODEL Alais

type alias ApiData = {
      id:Int
      ,userId:Int
      ,title:String
      ,body:String
    }

type alias Model = {
      apiData:(List ApiData)
    }
---init
init: (Model , Cmd Msg)
init = (Model  [] , Cmd.none )


--View
view: Model->Html Msg
view model=
        div[]
            [
              div[][
              h1[][text "User Details"]
              ]
              ,div[]
                  [
                  ul[][
                      li[][
                          p[][
                            b[][text "Api Data: "]
                            ,text (toString(model.apiData))
                          ]
                      ]
                      -- ,li[][
                      --       p[][
                      --         b[][text "User ID: "]
                      --         ,text (toString(model.apiData.userId))
                      --       ]
                      --   ]
                      --   ,li[][
                      --       p[][
                      --         b[][text "Title: "]
                      --         ,text model.apiData.title
                      --       ]
                      --   ]
                      --   ,li[][
                      --       p[][
                      --         b[][text "Body: "]
                      --         ,text model.apiData.body
                      --       ]
                      --   ]
                        ,li[][
                            p[][
                              --input[ placeholder "Enter User Id here", value (toString(model.findId)),  onInput UpdateFindId ][]
                              button [onClick FetchUserDetails ][text "Get Info"]
                             ]
                        ]
                    ]
                ]
          ]

--- type MSG
type Msg = FetchUserDetails
      --   | UpdateFindId String
         | OnHttpResponse (Result Http.Error (List ApiData))

update msg model=
      case msg of
            FetchUserDetails ->
                (model ,  getMoreData )
            OnHttpResponse (Ok newApiData ) ->
                ( {model | apiData = newApiData } , Cmd.none)
            OnHttpResponse (Err _) ->
                (model,Cmd.none)
            --UpdateFindId newid ->
            --  ({model | findId = Result.withDefault 0 (String.toInt newid )} , Cmd.none)



getMoreData =
      let
        url= "https://jsonplaceholder.typicode.com/posts/"
      in
        Http.send OnHttpResponse(Http.get url (Decode.list decodeUrlData))

decodeUrlData:Decode.Decoder ApiData
decodeUrlData =
    decode ApiData
        |> required "id" Decode.int
        |> required "userId" Decode.int
        |> required "title" Decode.string
        |> required "body" Decode.string


subscriptions:Model -> Sub Msg
subscriptions model =
      Sub.none
