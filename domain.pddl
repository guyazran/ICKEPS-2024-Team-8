(define (domain rts_game)
    (:requirements :strips :typing :negative-preconditions :existential-preconditions)
    (:types 
        building unit - object
        base tech_facility upgradable_building - building
        barracks tank_factory - upgradable_building
        worker light_infantry heavy_infantry tank siege_tank - unit
    )

    (:predicates  
        (working ?w - worker)
        (built ?b - building)
        (trained ?u - unit)
        (level1 ?x - building)
        (level2 ?x - building)
    )

	(:action build_building
    	:parameters(?u - worker ?b - building)
    	:precondition (and
    		(not (working ?u))
    		(not (built ?b))
    	)
    	:effect (and
    		(built ?b)
			(level1 ?b)
    		(working ?u)
    	)
    )
    
	(:action finish_occupied
    	:parameters(?u - worker)
    	:precondition (and
    		(working ?u)
    	)
    	:effect (and
    		(not (working ?u))
    	)
    )

    (:action train_worker
	     :parameters (?u - worker)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - base) (built ?b))
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
	         (exists (?b - barracks) (built ?b))
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
	             (built ?b)
	             (level2 ?b)
	        )
	     ))
	     :effect
	     (and 
            (trained ?u)
         )
    )
    (:action train_tank
	     :parameters (?u - tank)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - tank_factory) (built ?b))
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
	                (built ?b)
	                (level2 ?b)
	            )
	     ))
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
)