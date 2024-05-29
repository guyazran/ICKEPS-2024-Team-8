(define (domain rts_game)
    (:requirements :strips :typing :negative-preconditions)

    (:types 
        building unit - object
        building_type - building
        unit_type - unit
    )

    (:predicates  
    	(occupied ?u - unit)
    	(built ?b - building)
        (produces ?u - unit_type ?b - building_type)
        (type ?u - unit ?u2 - unit_type)
        (upgradable ?b - building)
        (level1 ?b - building)
        (level2 ?b - building)
    )

    (:action train_unit
	     :parameters (?ut - unit_type ?b - building_type ?u - unit)
	     :precondition (and
	         (not (trained ?u))
	         (type ?u ?ut)
	         (produces ?ut ?b)
	         (built ?b)
	     )
	     :effect (and 
            (trained ?u)
         )
    )

    (:action build_building
    	:parameters(?u - unit ?b - building)
    	:precondition (and
    		(type ?u worker)
    		(not (occupied ?u))
    		(not (built ?b))
    	)
    	:effect (and
    		(built ?b)
    		(when (upgradable ?b) (level1 ?b))
    		(occupied ?u)
    	)
    )
    
	(:action finish_occupied
    	:parameters(?u - unit)
    	:precondition (and
    		(occupied ?u)
    	)
    	:effect (and
    		(not (occupied ?u))
    	)
    )
    
    (:action upgrade_building
    	:parameters(?u - unit ?b - building)
    	:precondition (and
    		(type ?u worker)
    		(not (occupied ?u))
    		(not (built ?b))
    	)
    	:effect (and
    		(built ?b)
    	)
    )