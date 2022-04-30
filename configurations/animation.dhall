let Animation =
    {time : Double
    ,frames : List Natural
    }

let animation : Double -> List Natural -> Animation =
    \(time : Double) -> \(frames : List Natural) ->
        { time, frames }

in  {animation
    ,Animation
    }