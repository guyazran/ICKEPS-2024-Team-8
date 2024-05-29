(define (problem rts1)
    (:domain rts)
    (:objects
        base - building_type
        barracks - building_type

        base1 - building
        barracks1 - building

        worker - unit_type
        light_infantry - unit_type

        worker1 - unit
        infantry1 - unit

        level0 - level_type
        level1 - level_type

        null_unit - unit
        null_building - building
    )
    (:init
        (utype worker1, worker)
        (utype infantry1, light_infantry)
        (utype null_unit, worker)
        (utype null_unit, light_infantry)

        (btype base1, base)
        (btype barracks1, barracks)
        (btype null_building, base)
        (btype null_building, barracks)

        (blevel base1, level1)
        (blevel barracks1, level1)

        (produces base, worker, level1)
        (produces barracks, light_infantry, level1)

        (next null_unit, worker1)
        (next null_unit, infantry1)

        (next null_building, barracks1)

        (next level0, level1)

        (level base1, level1)
        (level barracks1, level0)
    )

    (:goal (and
        (trained infantry1)
    ))
)
