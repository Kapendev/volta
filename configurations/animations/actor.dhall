let anim = ../animation.dhall 0.8

in  { idle_e = anim [12]
    , idle_ne = anim [0]
    , idle_n = anim [0]
    , idle_nw = anim [0]
    , idle_w = anim [8]
    , idle_sw = anim [4]
    , idle_s = anim [4]
    , idle_se = anim [4]
    , walk_e = anim [12, 13, 14, 15]
    , walk_ne = anim [0, 1, 2, 3]
    , walk_n = anim [0, 1, 2, 3]
    , walk_nw = anim [0, 1, 2, 3]
    , walk_w = anim [8, 9, 10, 11]
    , walk_sw = anim [4, 5, 6, 7]
    , walk_s = anim [4, 5, 6, 7]
    , walk_se = anim [4, 5, 6, 7]
    }
