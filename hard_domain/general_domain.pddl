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
    )

    (:action train_unit
	     :parameters (?u - unit ?ut - unit_type ?b - building ?bt - building_type ?l - level_type)
	     :precondition (and
	     	; Unit not trained
	         (not (trained ?u))
	         
	        ;  building is of sufficient level to train
	         (btype ?b ?bt)
	         (utype ?u ?ut)
	         (b_level ?b ?l)
	         (produces ?ut ?bt ?l)
	         
	     )
	     :effect (and 
	     	; Worker is trained
            (trained ?u)
            
         )
    )

    (:action build_building
    	:parameters(?u - unit ?ut - unit_type ?b - building)
    	:precondition (and
    		; worker is available
    		(trained ?u)
    		(utype ?u ?ut)
    		(builder ?ut)
    		(not (occupied ?u))
    		
    		; building is not built
    		(b_level ?b level0)

    	)
    	:effect (and
    		; build building
    		(not (b_level ?b level0))
    		(b_level ?b level1)
    		
    		; worker is occupied
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
    	:parameters(?b - building ?t - building ?bt - building_type ?tt - building_type ?l - level_type ?l2 - level_type)
    	:precondition (and
    		; building is levelx and not levelx + 1
    		(b_level ?b ?l)
    		(not (b_level ?b ?l2))
    		
    		; buildings are of the right type
    		(btype ?b ?bt)
    		(btype ?t ?tt)
    		
    		; building tt upgrades bt
    		(upgrades ?bt ?tt)
    		(b_level ?t level1)
    		
    		; building bt can be upgraded
    		(upgradable ?bt ?l2)

    	)
    	:effect (and
    		; next building level
    		(b_level ?b ?l2)
    	)
    )
)