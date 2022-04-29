-- Testing the idea of using dhall with the engine.

let DialogueLine =
    {type : Text
    ,char : Text
    ,text : Text
    }

let say =
    \(type : Text) ->
        \(char : Text) ->
            \(text : Text) ->
                [{ type = type, char = char, text = text }] : List DialogueLine

in  {en =
        [
        say "line" "Alex" "Hello 1."
        #say "line" "Alex" "Hello 2."
        #say "line" "Alex" "Hello 3."
        ,
        say "line" "Alex" "Hello 11."
        #say "line" "Alex" "Hello 22."
        #say "line" "Alex" "Hello 33."
        ]
    ,gr =
        [
        say "line" "Άλεξ" "Γεία 1."
        #say "line" "Άλεξ" "Γεία 2."
        #say "line" "Άλεξ" "Γεία 3."
        ,
        say "line" "Άλεξ" "Γεία 11."
        #say "line" "Άλεξ" "Γεία 22."
        #say "line" "Άλεξ" "Γεία 33."
        ]
    }