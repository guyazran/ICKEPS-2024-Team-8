(define (problem rts1_2)
    (:domain rts_game)
    (:objects
        base - building_type
        barracks - building_type

        base1 - building
        barracks1 - building

        worker - unit_type
        light_infantry - unit_type

        worker1 - unit
        infantry1 - unit

        loc1 - loc
        loc2 - loc
        loc3 - loc
        loc4 - loc
        loc5 - loc
        loc6 - loc
        loc7 - loc
        loc8 - loc
        loc9 - loc
    )
    (:init
        (soil sand loc1)
        (soil rock loc2)
        (soil rock loc3)
        (soil boggy loc4)
        (soil rock loc5)
        (soil rock loc6)
        (soil sand loc7)
        (soil rock loc8)
        (soil rock loc9)

        (utype worker1 worker)
        (utype infantry1 light_infantry)

        (btype base1 base)
        (btype barracks1 barracks)

        (b_level base1 level1)
        (at base1 loc2)
        (b_level barracks1 level0)

        (builder worker)

        (produces worker base level1)
        (produces light_infantry barracks level1)

    )

    (:goal (and
        (trained_2 infantry1)
    ))
)
