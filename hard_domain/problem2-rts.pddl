(define (problem rts2)
    (:domain rts)
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

        (produces base, worker, level1)
        (produces barracks, light_infantry, level1)
        (produces tank_factory, tank, level1)

        (next null_unit, worker1)
        (next null_unit, infantry1)
        (next null_unit, tank1)

        (next null_building, barracks1)
        (next null_building, tank_factory1)

        (blevel base1, level1)
        (blevel barracks1, level1)
        (blevel tank_factory1, level1)

        (built base1)
    )

    (:goal (and
        (trained infantry1)
        (trained tank1)
    ))
)