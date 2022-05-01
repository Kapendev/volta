let anim = (../animation.dhall).animation 0.3

in  { idle_e = anim [12]
    , idle_ne = anim [0]
    , idle_n = anim [0]
    , idle_nw = anim [0]
    , idle_w = anim [8]
    , idle_sw = anim [4]
    , idle_s = anim [4]
    , idle_se = anim [4]
    , move_e = anim [12, 13, 14, 15]
    , move_ne = anim [0, 1, 2, 3]
    , move_n = anim [0, 1, 2, 3]
    , move_nw = anim [0, 1, 2, 3]
    , move_w = anim [8, 9, 10, 11]
    , move_sw = anim [4, 5, 6, 7]
    , move_s = anim [4, 5, 6, 7]
    , move_se = anim [4, 5, 6, 7]
    }