(define (problem rts1)
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
    )
    (:init
        (utype worker1 worker)
        (utype infantry1 light_infantry)

        (btype base1 base)
        (btype barracks1 barracks)

        (b_level base1 level1)
        (b_level barracks1 level0)

        (builder worker)

        (produces worker base level1)
        (produces light_infantry barracks level1)

    )

    (:goal (and
        (trained infantry1)
    ))
)
