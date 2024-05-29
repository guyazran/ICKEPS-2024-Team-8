(define (problem rts2)
    (:domain rts_game)
    (:objects
        base - building_type
        barracks - building_type
        tank_factory - building_type

        base1 - building
        barracks1 - building
        tank_factory1 - building

        worker - unit_type
        light_infantry - unit_type
        tank - unit_type

        worker1 - unit
        infantry1 - unit
        tank1 - unit

        level0 - level_type
        level1 - level_type

        null_unit - unit
        null_building - building
    )
    (:init
        (utype worker1, worker)
        (utype infantry1, light_infantry)
        (utype tank1, tank)

        (utype null_unit, worker)
        (utype null_unit, light_infantry)
        (utype null_unit, tank)

        (btype base1, base)
        (btype barracks1, barracks)
        (btype tank_factory1, tank_factory)

        (btype null_building, base)
        (btype null_building, barracks)
        (btype null_building, tank_factory)

        (b_level base1, level1)
        (b_level barracks1, level0)
        (b_level tank_factory1, level0)

        (builder worker)

        (produces worker, base, level1)
        (produces light_infantry, barracks, level1)

        (produces worker base level1)
        (produces light_infantry barracks level1)
        (produces tank tank_factory level1)

        (current null_unit worker)
        (current null_unit light_infantry)
        (current null_unit tank)

        (next null_building, barracks1)

        (current null_building barracks)
        (current null_building tank_factory)
        (current base1 base)

        (next level0, level1)
    )

    (:goal (and
        (trained infantry1)
        (trained tank1)
    ))
)
