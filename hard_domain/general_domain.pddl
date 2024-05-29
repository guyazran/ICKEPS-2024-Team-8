(define (domain rts_game)
    (:requirements :strips :typing :negative-preconditions)
	(:constants 
		level0 - level_type
		level1 - level_type)
    (:types 
    	
        entity entity_type - object
    	building unit level_type - entity
    	building_type unit_type - entity_type
    )

    (:predicates  
    	(occupied ?u - unit)
    	(trained ?u - unit)
	(b_level ?b - building ?l - level_type)
    	(builder ?u - unit_type)
        (produces ?u - unit_type ?b - building_type ?l - level_type)
        (utype ?u - unit ?u2 - unit_type)
        (btype ?b - building ?b2 - building_type)
        (upgrades ?b - building_type ?b2 - building_type)
        (upgradable ?b - building_type ?l - level_type)
        (next ?o - entity ?o2 - entity)
        (current ?o - entity ?o2 - entity_type)
    )

    (:action train_unit
	     :parameters (?ut - unit_type ?b - building ?b2 - building_type ?u - unit ?u2 - unit ?l - level_type)
	     :precondition (and
	     	; Unit not trained
	         (not (trained ?u))
	         
	        ;  building is of sufficient level to train
	         (btype ?b ?b2)
	         (utype ?u ?ut)
	         (b_level ?b ?l)
	         (produces ?ut ?b2 ?l)
	         
	        ;  Worker is the next to be trained
	         (current ?u2 ?ut)
	         (next ?u2 ?u)
	     )
	     :effect (and 
	     	; Worker is trained
            (trained ?u)
            
            ;  increment current
            (not (current ?u2 ?ut))
            (current ?u ?ut)
         )
    )

    (:action build_building
    	:parameters(?u - unit ?u2 - unit_type ?b - building ?b2 - building ?bt - building_type)
    	:precondition (and
    		; worker is available
    		(utype ?u ?u2)
    		(builder ?u2)
    		(not (occupied ?u))
    		
    		; building is not built
    		(b_level ?b level0)
    		
    		; building is the next to be built
    		(current ?b2 ?bt)
	        (next ?b2 ?b)
    	)
    	:effect (and
    		; build building
    		(not (b_level ?b level0))
    		(b_level ?b level1)
    		
    		; worker is occupied
    		(occupied ?u)
    		
    		; increment current
    		(not (current ?b2 ?bt))
            (current ?b ?bt)
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
    	:parameters(?b - building ?t - building ?bt - building_type ?tt - building_type ?l - level_type ?l2 - level_type)
    	:precondition (and
    		(b_level ?b ?l)
    		(not (b_level ?b ?l2))
    		(btype ?b ?bt)
    		(btype ?t ?tt)
    		(upgrades ?bt ?tt)
    		(upgradable ?bt ?l2)
    		(next ?l ?l2)
    	)
    	:effect (and
    		(b_level ?b ?l2)
    	)
    )
)