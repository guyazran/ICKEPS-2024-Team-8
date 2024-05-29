(define (domain rts_game)
    (:requirements :strips :typing :negative-preconditions)

    (:types 
        entity building_type unit_type - object
    	building unit level - entity
    )

    (:predicates  
    	(occupied ?u - unit)
    	(trained ?u - unit)
    	(b_level ?b - building ?l - level)
    	(builder ?u - unit_type)
        (produces ?u - unit_type ?b - building_type ?l - level)
        (utype ?u - unit ?u2 - unit_type)
        (btype ?b - building ?b2 - building_type)
        (upgradable ?b - building_type ?b2 - building_type)
        (next ?o - entity ?o2 - entity)
        (current ?o - entity)
    )

    (:action train_unit
	     :parameters (?ut - unit_type ?b - building_type ?u - unit ?u2 - unit)
	     :precondition (and
	         (not (trained ?u))
	         (b_level ?b LEVEL0)
	         (utype ?u ?ut)
	         (produces ?ut ?b)
	         (current ?u2)
	         (next ?u2 ?u)
	     )
	     :effect (and 
            (trained ?u)
            (not (current ?u2))
            (current ?u)
            (b_level ?b LEVEL1)
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
    	:parameters(?b - building ?t - building ?l - level ?l2 - level)
    	:precondition (and
    		(b_level ?b ?l)
    		(built ?t)
    		(upgradable ?b ?t)
    		(next ?l ?l2)
    	)
    	:effect (and
    		(level2 ?t ?l2)
    	)
    )
)