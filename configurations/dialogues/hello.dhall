let say = (../dialogue.dhall).say

in  {en =
        [
        say "Hello world."
        #say ''
        [wave]This is a big Big BIG line and
        has many Many MANY characters.
        ''
        #say "Thanks for clicking me."
        #say "[shake]I love you."
        #say "Bye."
        ]
    ,gr =
        [
        say "Γειά σου κόσμε."
        #say ''
        [wave]Αυτή είναι μια μεγάλη Μεγάλη
        ΜΕΓΆΛΗ γραμμή και έχει πολλούς
        Πολλούς ΠΟΛΛΟΎΣ χαρακτήρες.
        ''
        #say "Ευχαριστώ που έκανες κλίκ."
        #say "[shake]Σ'Αγαπώ."
        #say "Αντίο."
        ]
    }