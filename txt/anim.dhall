-- Testing the idea of using dhall with the engine.

let Anim =
    {time : Double
    ,frames : List Natural
    }

let anim =
    \(time : Double) ->
        \(frames : List Natural) ->
            {time = time
            ,frames = frames
            } : Anim

in  {idle_e = anim 0.3 [12]
    ,idle_ne = anim 0.3 [0]
    ,idle_n = anim 0.3 [0]
    ,idle_nw = anim 0.3 [0]
    ,idle_w = anim 0.3 [8]
    ,idle_sw = anim 0.3 [4]
    ,idle_s = anim 0.3 [4]
    ,idle_se = anim 0.3 [4]
    ,move_e = anim 0.3 [12, 13, 14, 15]
    ,move_ne = anim 0.3 [0, 1, 2, 3]
    ,move_n = anim 0.3 [0, 1, 2, 3]
    ,move_nw = anim 0.3 [0, 1, 2, 3]
    ,move_w = anim 0.3 [8, 9, 10, 11]
    ,move_sw = anim 0.3 [4, 5, 6, 7]
    ,move_s = anim 0.3 [4, 5, 6, 7]
    ,move_se = anim 0.3 [4, 5, 6, 7]
    }