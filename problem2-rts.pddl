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

        (btype base1, base)
        (btype barracks1, barracks)

        (produces base1, worker)
        (produces barracks, light_infantry)

        (next_unit null_unit, worker1)
        (next_unit null_unit, infantry1)
        (next_unit null_unit, tank1)

        (next_building null_building, barracks1)
        (next_building null_building, tank_factory1)

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