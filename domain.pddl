(define (domain rts_game)
    (:requirements :strips :typing ::negative-preconditions ::existential-preconditions)
    (:types 
        building unit - object
        base tech_facility upgradable_building - building
        barracks tank_factory - upgradable_building
        worker light_infantry heavy_infantry tank siege_tank - units
    )

    (:predicates  
        (working ?w - worker)
        (built ?b - building)
        (trained ?u - unit)
        (level1 ?x - building)
        (level2 ?x - building)
    )

    (:action train_worker
	     :parameters (?u - worker)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - base) (build ?b))
	     )
	     :effect
	     (and 
            (trained ?u)
         )
    )
    (:action train_light_infantry
	     :parameters (?u - light_infantry)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - barracks) (build ?b))
	     )
	     :effect
	     (and 
            (trained ?u)
         )
    )
    (:action train_heavy_infantry
	     :parameters (?u - heavy_infantry)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - base) 
	         (and 
	             (build ?b)
	             (level2 ?b)
	        )
	     )
	     :effect
	     (and 
            (trained ?u)
         )
    )
    (:action train_tank
	     :parameters (?u - tank)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - tank_factory) (build ?b))
	     )
	     :effect
	     (and 
            (trained ?u)
         )
    )
    (:action train_siege_tank
	     :parameters (?u - siege_tank)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - tank_factory) 
	            (and 
	                (build ?b)
	                (level2 ?b)
	            )
	     )
	     :effect
	     (and 
            (trained ?u)
         )
    )
	     
    (:action upgrade_building
	     :parameters (?b - upgradable_building)
	     :precondition (and
	         (level1 ?b)
	         (exists (?b2 - tech_facility) (built ?b2))
	     )
	     :effect
	     (and 
            (level2 ?b)
         )
    )