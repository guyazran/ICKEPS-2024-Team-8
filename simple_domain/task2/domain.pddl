(define (domain rts_game)
    (:requirements :strips :typing :negative-preconditions :existential-preconditions)
    (:types 
        location building unit - object
        base tech_facility power_plant upgradable_building - building
        barracks tank_factory - upgradable_building
        worker light_infantry heavy_infantry tank siege_tank - unit
    )

    (:predicates 
	    (NEEDS_POWER ?b - building) 
        (working ?w - worker)
        (built ?b - building)
        (trained ?u - unit)
        (level1 ?x - building)
        (level2 ?x - building)
		(power_plant_used ?p - power_plant)
		(has_built ?w - worker)
		(is_sand ?l - location)
		(is_rock ?l - location)
		(is_boggy ?l - location)
		(occupied ?l - location)
		(at_loc_building ?l - location ?b - building)
		(at_loc_unit ?l - location ?u - unit)
    )

	(:action move
	    :parameters (?u - unit ?from - location ?to - location)
		:precondition (and
		    (trained ?u)
			(not (is_boggy ?from))
			(at_loc_unit ?from ?u)
			(not (working ?u))
		)
		:effect (and
		    (not (at_loc_unit ?from ?u))
			(at_loc_unit ?to ?u)
		)
	)

	(:action build_unpowered_building
    	:parameters(?u - worker ?b - building ?loc - location)
    	:precondition (and
		    (trained ?u)
    		(not (working ?u))
    		(not (built ?b))
			(not (NEEDS_POWER ?b))
			(at_loc_unit ?loc ?u)
			(not (occupied ?loc))
			(is_rock ?loc)
    	)
    	:effect (and
    		(built ?b)
			(level1 ?b)
    		(working ?u)
			(occupied ?loc)
			(at_loc_building ?loc ?b)
    	)
    )

	(:action build_powered_building
    	:parameters(?u - worker ?b - building ?loc - location ?p - power_plant)
    	:precondition (and
		    (trained ?u)
    		(not (working ?u))
    		(not (built ?b))
			(NEEDS_POWER ?b)
			(at_loc_unit ?loc ?u)
			(not (occupied ?loc))
			(is_rock ?loc)
			(built ?p)
			(not (power_plant_used ?p))
    	)
    	:effect (and
    		(built ?b)
			(level1 ?b)
    		(working ?u)
			(occupied ?loc)
			(at_loc_building ?loc ?b)
			(power_plant_used ?p)
    	)
    )
    
	(:action finish_occupied
    	:parameters(?u - worker)
    	:precondition (and
    		(working ?u)
			(not (has_built ?u))
    	)
    	:effect (and
    		(not (working ?u))
			(has_built ?u)
    	)
    )

    (:action train_worker
	     :parameters (?u - worker ?loc - location)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - base) (and (built ?b) (at_loc_building ?loc ?b)))
	     )
	     :effect
	     (and 
            (trained ?u)
			(at_loc_unit ?loc ?u)
         )
    )
    (:action train_light_infantry
	     :parameters (?u - light_infantry ?loc - location)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - barracks) (and (built ?b) (at_loc_building ?loc ?b)))
	     )
	     :effect
	     (and 
            (trained ?u)
			(at_loc_unit ?loc ?u)
         )
    )
    (:action train_heavy_infantry
	     :parameters (?u - heavy_infantry ?loc - location)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - barracks) 
	         (and 
	             (built ?b)
	             (level2 ?b)
				 (at_loc_building ?loc ?b)
	        )
	     ))
	     :effect
	     (and 
            (trained ?u)
			(at_loc_unit ?loc ?u)
         )
    )
    (:action train_tank
	     :parameters (?u - tank ?loc - location)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - tank_factory) (and (built ?b) (at_loc_building ?loc ?b)))
	     )
	     :effect
	     (and 
            (trained ?u)
			(at_loc_unit ?loc ?u)
         )
    )
    (:action train_siege_tank
	     :parameters (?u - siege_tank ?loc - location)
	     :precondition (and
	         (not (trained ?u))
	         (exists (?b - tank_factory) 
	            (and 
	                (built ?b)
	                (level2 ?b)
					(at_loc_building ?loc ?b)
	            )
	     ))
	     :effect
	     (and 
            (trained ?u)
			(at_loc_unit ?loc ?u)
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