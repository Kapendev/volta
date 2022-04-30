let say = (../dialogue.dhall).say

in  {en =
        [
        say "The name of this node is..."
        #say "Bob."
        #say "The end."
        ]
    ,gr =
        [
        say "Το όνομα αυτού του κόμβου είναι..."
        #say "Μπόμπ."
        #say "Τέλος."
        ]
    }