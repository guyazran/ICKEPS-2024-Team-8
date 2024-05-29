(define (problem p3)
    (:domain rts_game)
    (:objects
        base_1 - base
        tech_facility_1 - tech_facility
        barracks_1 - barracks
        tank_factory_1 - tank_factory
        worker_1 - worker
        light_infantry_1 - light_infantry
        heavy_infantry_1 - heavy_infantry
        tank_1 - tank
        siege_tank_1 siege_tank_2 - siege_tank
    )
    (:init
        (built base_1)
        (level1 base_1)
    )

    (:goal (and
        (trained light_infantry_1)
        (trained siege_tank_1)
        (trained siege_tank_2)
    ))
)
