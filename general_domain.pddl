(define (domain rts_game)
    (:requirements :strips :typing :negative-preconditions)

    (:types 
        entity building_type unit_type - object
    	building unit - entity
    )

    (:predicates  
    	(occupied ?u - unit)
    	(trained ?u - unit)
    	(built ?b - building)
    	(builder ?u - unit_type)
        (produces ?u - unit_type ?b - building_type)
        (utype ?u - unit ?u2 - unit_type)
        (btype ?b - building ?b2 - building_type)
        (upgradable ?b - building_type ?b2 building_type)
        (level1 ?b - building)
        (level2 ?b - building)
        (next ?o - entity ?o2 - entity)
        (current ?o - entity)
    )

    (:action train_unit
	     :parameters (?ut - unit_type ?b - building_type ?u - unit ?u2 - unit)
	     :precondition (and
	         (not (trained ?u))
	         (utype ?u ?ut)
	         (produces ?ut ?b)
	         (built ?b)
	         (current ?u2)
	         (next ?u2 ?u)
	     )
	     :effect (and 
            (trained ?u)
            (not (current ?u2))
            (current ?u)
         )
    )

    (:action build_building
    	:parameters(?u - unit ?u2 - unit_type ?b - building ?b2 - building)
    	:precondition (and
    		(type ?u ?u2)
    		(builder ?u2)
    		(not (occupied ?u))
    		(not (built ?b))
    		(current ?b2)
	        (next ?b2 ?b)
    	)
    	:effect (and
    		(built ?b)
    		(when (upgradable ?b) (level1 ?b))
    		(occupied ?u)
    		(not (current ?b2))
            (current ?b)
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
    		(upgradable ?b ?t)
    	)
    	:effect (and
    		(level2 ?t)
    	)
    )