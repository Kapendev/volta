let Animation =
    { time : Double
    , frames : List Natural
    }

let animation =
    \(time : Double) -> \(frames : List Natural) ->
        { time, frames }

in  { animation
    , Animation
    }