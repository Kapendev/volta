let say = (../dialogue.dhall).say

let en0 =
    say "[shake]The name of this node is..."
    # say "[wave]Bob."
    # say "[rainbow]The end."

let gr0 =
    say "[shake]Το όνομα αυτού του κόμβου είναι..."
    # say "[wave]Μπόμπ."
    # say "[rainbow]Τέλος."

in  { En = [ en0 ]
    , Gr = [ gr0 ]
    }
