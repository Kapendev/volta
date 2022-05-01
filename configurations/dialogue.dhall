let Category = < Line | Proc >

let DialogueLine =
    { category : Category
    , name : Text
    , text : Text
    }

let Dialogue = List DialogueLine

let dialogueLine =
    \(category : Category) -> \(name : Text) -> \(text : Text) ->
        { category, name, text }

let dialogue =
    \(category : Category) -> \(name : Text) -> \(text : Text) ->
        [ dialogueLine category name text ]

let line = dialogue Category.Line
let proc = dialogue Category.Proc

let say = line ""

in  { say
    , proc
    , line
    , dialogue
    , dialogueLine
    , Dialogue
    , DialogueLine
    , Category
    }