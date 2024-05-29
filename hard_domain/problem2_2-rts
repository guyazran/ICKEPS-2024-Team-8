(define (problem rts5)
    (:domain rts_game)
    (:objects
        
        level2 - level_type

        base - building_type
        barracks - building_type
        tank_factory - building_type
        tech_facility - building_type

        base1 - building
        barracks1 - building
        tank_factory1 - building
        tank_factory2 - building
        tech_facility1 - building

        worker - unit_type
        light_infantry - unit_type
        tank - unit_type
        siege_tank - unit_type

        worker1 - unit
        worker2 - unit
        light_infantry1 - unit
        light_infantry2 - unit
        tank1 - unit
        siege_tank1 - unit
        siege_tank2 - unit
    )
    (:init
        (utype worker1 worker)
        (utype light_infantry1 light_infantry)
        (utype light_infantry2 light_infantry)
        (utype tank1 tank)
        (utype siege_tank1 siege_tank)
        (utype siege_tank2 siege_tank)

        (btype base1 base)
        (btype barracks1 barracks)
        (btype tank_factory1 tank_factory)
        (btype tank_factory2 tank_factory)
        (btype tech_facility1 tech_facility)

        (upgradable tank_factory level2)
        (upgrades tank_factory tech_facility)

        (builder worker)

        (produces worker base level1)
        (produces light_infantry barracks level1)
        (produces tank tank_factory level1)
        (produces siege_tank tank_factory level2)

        (b_level base1 level0)
        (b_level barracks1 level0)
        (b_level tank_factory1 level0)
        (b_level tank_factory2 level0)
        (b_level tech_facility1 level0)

        (trained worker1)

    )

    (:goal (and
        (trained light_infantry1)
        (trained light_infantry2)
        (trained tank1)
        (trained siege_tank1)
        (trained siege_tank2)
    ))
)