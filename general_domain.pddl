(define (domain rts_game)
    (:requirements :strips :typing :negative-preconditions)

    (:types 
        entity building_type unit_type - object
    	building unit - entity
    )

    (:predicates  
    	(occupied ?u - unit)
    	(built ?b - building)
        (produces ?u - unit_type ?b - building_type)
        (utype ?u - unit ?u2 - unit_type)
        (btype ?b - building ?b2 - building_type)
        (upgradable ?b - building)
        (level1 ?b - building)
        (level2 ?b - building)
        (next ?o - entity)
        (count ?o - entity)
    )

    (:action train_unit
	     :parameters (?ut - unit_type ?b - building_type ?u - unit)
	     :precondition (and
	         (not (trained ?u))
	         (utype ?u ?ut)
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
    	:parameters(?b - building ?t - building)
    	:precondition (and
    		(level1 ?b)
    		(built ?t)
    		(btype ?t tech_facility)
    	)
    	:effect (and
    		(level2 ?t)
    	)
    )