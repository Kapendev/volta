let say = (../dialogue.dhall).say

let en0 =
    say "[wave]My name is Green Mominpappa."

let gr0 =
    say "[wave]Με λένε Green Mominpappa."

in  { En = [ en0 ]
    , Gr = [ gr0 ]
    }