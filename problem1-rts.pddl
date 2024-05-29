(define (problem rts1)
    (:domain rts)
    (:objects
        base - btype
        worker - utype
        light_infantry - utype
        barracks - btype
        base1 - building
        barracks1 - building
        worker1 - unit
        infantry1 - unit

        null_unit - unit
        null_building - building
    )
    (:init
        (unit_type worker1, worker)
        (unit_type infantry1, light_infantry)
        (building_type base1, base)
        (building_type barracks1, barracks)

        (produces base1, worker)
        (produces barracks, light_infantry)

        (next_unit null_unit, worker1)
        (next_unit null_unit, infantry1)

        (next_building null_building, barracks1)

        (built base1)
    )

    (:goal (and
        (trained infantry1)
    ))
)