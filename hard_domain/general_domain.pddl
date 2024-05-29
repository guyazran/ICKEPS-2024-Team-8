(define (domain rts_game)
    (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality)
	(:constants 
		level0 - level_type
		level1 - level_type
		boggy - soil_type
		sand - soil_type
		rock - soil_type
	)
    (:types 
    	
        entity entity_type soil_type loc - object
    	building unit level_type - entity
    	building_type unit_type - entity_type
    )

    (:predicates  
    	(occupied ?u - unit)
    	(trained_2 ?u - unit)
    	(trained_1 ?u - unit)
		(b_level ?b - building ?l - level_type)
    	(builder ?u - unit_type)
        (produces ?u - unit_type ?b - building_type ?l - level_type)
        (utype ?u - unit ?u2 - unit_type)
        (btype ?b - building ?b2 - building_type)
        (upgrades ?b - building_type ?b2 - building_type)
        (upgradable ?b - building_type ?l - level_type)
        (soil ?t - soil_type ?x - loc)
        (at ?u - entity ?x - loc)
        (power ?b - building)
        (need_power ?b - building)
        (used_power ?b - building)
        (next ?l1 ?l2 - level_type)
    )

    (:action train_unit
	     :parameters (?u - unit ?ut - unit_type ?b - building ?bt - building_type ?l - level_type ?x - loc)
	     :precondition (and
	     	; Unit not trained
	         (not (trained_2 ?u))
	         (not (trained_1 ?u))
	         (at ?b ?x)

	         
	        ;  building is of sufficient level to train
	         (btype ?b ?bt)
	         (utype ?u ?ut)
	         (b_level ?b ?l)
	         (produces ?ut ?bt ?l)
	         
	     )
	     :effect (and 
	     	; Worker is trained
            (trained_2 ?u)
            (at ?u ?x)
         )
    )
    
     (:action move
	     :parameters (?u - unit ?x - loc ?x2 - loc)
	     :precondition (and
	     	; Unit not trained
	     	(at ?u ?x2)
	         (not (at ?u ?x))
	         (not (soil boggy ?x2))
	        (or (trained_1 ?u) (trained_2 ?u))
	     )
	     
	     :effect (and 
	     	; Worker is trained
            (at ?u ?x)
	        (not (at ?u ?x2))
            
         )
    )

    (:action build_building
    	:parameters(?u - unit ?ut - unit_type ?b - building ?x - loc)
    	:precondition (and
    		; worker is available
    		(utype ?u ?ut)
    		(builder ?ut)
    		(not (occupied ?u))
    		
    		(not (need_power ?b))
    		
    		(forall (?b2 - building)
				(or 
					(= ?b2 ?b) 
					(not (at ?b2 ?x)) 
				)
    		)
    		
    		; building is not built
    		(b_level ?b level0)
    		
    		(or 
    			(trained_2 ?u)
    			(trained_1 ?u)
			)
    		
    		(at ?u ?x)
    		(soil rock ?x)

    	)
    	:effect (and
    		; build building
    		(not (b_level ?b level0))
    		(b_level ?b level1)
    		
    		; worker is occupied
    		(occupied ?u)
    		
    		(when (trained_2 ?u) (and (not (trained_2 ?u)) (trained_1 ?u)))
    		(when (trained_1 ?u) (and (not (trained_1 ?u))))

    		(at ?b ?x)
    	)
    )
    
    (:action build_building_w_power
    	:parameters(?u - unit ?ut - unit_type ?b - building ?b2 - building ?x - loc)
    	:precondition (and
    		; worker is available
    		(utype ?u ?ut)
    		(builder ?ut)
    		(not (occupied ?u))
    		
    		(need_power ?b)
    		(power ?b2)
    		(not (used_power ?b2))
    		
    		(forall (?b2 - building)
				(or 
					(= ?b2 ?b) 
					(not (at ?b2 ?x)) 
				)
    		)
    		
    		; building is not built
    		(b_level ?b level0)
    		(b_level ?b2 level1)
    		
    		(or 
    			(trained_2 ?u)
    			(trained_1 ?u)
			)
    		
    		(at ?u ?x)
    		(soil rock ?x)

    	)
    	:effect (and
    		; build building
    		(not (b_level ?b level0))
    		(b_level ?b level1)
    		
    		; worker is occupied
    		(occupied ?u)
    		
    		(when (trained_2 ?u) (and (not (trained_2 ?u)) (trained_1 ?u)))
    		(when (trained_1 ?u) (and (not (trained_1 ?u))))

    		(at ?b ?x)
    		
    		(used_power ?b2)
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
    	:parameters(?b - building ?t - building ?bt - building_type ?tt - building_type ?l1 - level_type ?l2 - level_type)
    	:precondition (and
    		; building is levelx and not levelx + 1
    		(b_level ?b ?l1)
			(next ?l1 ?l2)
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