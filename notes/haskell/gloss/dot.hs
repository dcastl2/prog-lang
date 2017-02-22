import Graphics.Gloss

main = animate (InWindow "Dot Motion" ((640), (400)) (20, 20)) black frame

-- Frame
frame :: Float -> Picture
frame   time
        = Color white 
        $ Scale 50 50
        $ Translate (4*cos(2*time)) 0
        $ circleSolid 1 

