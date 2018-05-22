import Html exposing(..)
import Html.Attributes exposing(style, placeholder, value, src)
import Html.Events exposing(..)
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)

main =
  Html.program{
    init =init
    , view = view
    , update = update
    , subscriptions = subscriptions
  }


type alias ApiData={
  id: Int
  , title: String
  , body: String
  , userId: Int
}

type alias Model=
  {
    apiData:ApiData
    , findId : Int
  }

--init
init: (Model, Cmd Msg)
init=
  (Model {id=0, title="Test Title", body="Test body for first time load.", userId=0} 0, Cmd.none)

--view
view: Model->Html Msg
view model=
    div[][
        div[][
        h1[][text "User details"]
      ]
      , div[][
        ul[][
          li[][
            p[][
              b[][text "Id: "]
              , text (toString(model.apiData.id) )
            ]
          ]
          ,li[][
            p[][
              b[][text "User Id: "]
              , text (toString(model.apiData.userId) )
            ]
          ]
          , li[][
            p[][
              b[][text "Title: "]
              , text model.apiData.title
            ]
          ]
          , li[][
            p[][
              b[][text "Body: "]
              , text model.apiData.body
            ]
          ]
          , li[][
            p[][
              input[placeholder "Enter User Id here", value (toString(model.findId)), onInput UpdateFindId ][]
              , button[onClick Loadagain][text "Get Info"]
            ]
          ]
        ]
      ]
    ]

type Msg =  Loadagain | Dataloaded (Result Http.Error ApiData) | UpdateFindId String

-- update
update: Msg -> Model -> (Model, Cmd Msg)
update msg model=
  case msg of
    Loadagain ->
      (model, model.findId |> toString |> getMoreData )

    Dataloaded (Ok newApiData) ->
      ({model| apiData=newApiData }, Cmd.none)

    Dataloaded (Err _) ->
      (model, Cmd.none)

    UpdateFindId newid ->
      ({model| findId= Result.withDefault 0 (String.toInt newid)  }, Cmd.none)


--getMoreDate
--getMoreData: Int -> (Model, Cmd Msg)
getMoreData id =
  let
    url =
      "https://jsonplaceholder.typicode.com/posts/" ++ id
  in
    Http.send Dataloaded ( Http.get url decodeUrlData )

decodeUrlData: Decode.Decoder ApiData
decodeUrlData=
  decode ApiData
    |> required "id" Decode.int
    |> required "title" Decode.string
    |> required "body" Decode.string
    |> required "userId" Decode.int


--subscriptions
subscriptions: Model -> Sub Msg
subscriptions model=
  Sub.none
