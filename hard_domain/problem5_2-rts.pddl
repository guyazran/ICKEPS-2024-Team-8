(define (problem rts1_2)
    (:domain rts_game)
    (:objects
        level2 - level_type

        base - building_type
        barracks - building_type
        tank_factory - building_type
        powerplant - building_type
        tech_facility - building_type

        base1 - building
        barracks1 - building
        tank_factory1 - building
        powerplant1 - building
        powerplant2 - building
        tech_facility1 - building

        worker - unit_type
        light_infantry - unit_type
        tank - unit_type
        siege_tank - unit_type

        worker1 - unit
        infantry1 - unit
        infantry2 - unit
        tank1 - unit
        siege_tank1 - unit
        siege_tank2 - unit

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
        (next level1 level2)

        (soil sand loc1)
        (soil rock loc2)
        (soil rock loc3)
        (soil boggy loc4)
        (soil rock loc5)
        (soil rock loc6)
        (soil rock loc7)
        (soil rock loc8)
        (soil rock loc9)

        (utype worker1 worker)
        (trained_2 worker1)
        (at worker1 loc1)
        (utype infantry1 light_infantry)
        (utype infantry2 light_infantry)
        (utype tank1 tank)
        (utype siege_tank1 siege_tank)
        (utype siege_tank2 siege_tank)

        (btype base1 base)
        (btype barracks1 barracks)
        (btype tank_factory1 tank_factory)
        (btype powerplant1 powerplant)
        (btype powerplant2 powerplant)
        (btype tech_facility1 tech_facility)

        (b_level base1 level0)
        (at base1 loc2)
        (b_level barracks1 level0)
        (b_level tank_factory1 level0)
        (b_level powerplant1 level0)
        (b_level powerplant2 level0)
        (b_level tech_facility1 level0)

        (need_power tank_factory1)
        (need_power tech_facility1)
        (power powerplant1)
        (power powerplant2)

        (builder worker)

        (produces worker base level1)
        (produces light_infantry barracks level1)
        (produces tank tank_factory level1)
        (produces tank tank_factory level2)
        (produces siege_tank tank_factory level2)

        (upgradable barracks level2)
        (upgradable tank_factory level2)
        (upgrades barracks tech_facility)
        (upgrades tank_factory tech_facility)

    )

    (:goal (and
        ; (b_level base1 level1)
        (trained_2 infantry1)
        (trained_2 infantry2)
        (trained_2 tank1)
        (trained_2 siege_tank1)
        (trained_2 siege_tank2)
    ))
)
