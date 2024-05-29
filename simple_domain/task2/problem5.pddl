(define (problem p5)
    (:domain rts_game)
    (:objects
        base_1 - base
        tech_facility_1 - tech_facility
        barracks_1 - barracks
        tank_factory_1 - tank_factory
        worker_1 worker_2 worker_3 - worker
        light_infantry_1 light_infantry_2 - light_infantry
        heavy_infantry_1 - heavy_infantry
        tank_1 - tank
        siege_tank_1 siege_tank_2 - siege_tank
        power_plant_1 power_plant_2 - power_plant
        r1 r2 r3 r4 r5 r6 s1 b1 - location
    )
    (:init
        (NEEDS_POWER tech_facility_1)
        (NEEDS_POWER tank_factory_1)
        (is_rock r1)
        (is_rock r2)
        (is_rock r3)
        (is_rock r4)
        (is_rock r5)
        (is_rock r6)
        (is_sand s1)
        (is_boggy b1)
        (trained worker_1)
        (at_loc_unit r1 worker_1)
    )

    (:goal (and
        (trained light_infantry_1)
        (trained light_infantry_2)
        (trained tank_1)
        (trained siege_tank_1)
        (trained siege_tank_2)
    ))
)
