(define (domain landscaping)
    (:requirements 
        :strips
        
    )

    
    (:predicates ;todo: define predicates here
        (FLOWER ?f) (LOCATION ?l) (VASE ?v)(ROBOT ?rob)

        (plant_at ?f ?loc)(can_go ?s1 ?s2)(at_location ?loc)(empty ?v)
        (at ?v ?loc)(plant_in ?v) (full ?loc)(at_vase ?f ?loc)
    
        (carrying ?v) 
            
    )

    (:action vase_flower
        :parameters (?loc ?v ?f ?rob)
        :precondition (and (FLOWER ?f)(VASE ?v)(LOCATION ?loc)(ROBOT ?rob)
                        (at_vase ?v ?loc)(at_vase ?f ?loc)(at ?loc))
        :effect (and (plant_in ?v)
                    (not(at_vase ?v ?loc))(not(at_vase ?f ?loc))(not(empty ?v)))
    )
    (:action move
        :parameters (?rob ?from ?to)
        :precondition (and (LOCATION ?from)(LOCATION ?to)
                        (can_go ?from ?to)(at ?rob ?from))
        :effect (and (at ?rob ?to)(not(at ?rob ?from)))
    )
    
    (:action put_plant
        :parameters (?rob ?v ?loc)
        :precondition (and (LOCATION ?loc)(ROBOT ?rob)(VASE ?v)
                        (at_location ?rob ?loc)(plant_in ?v))
        :effect (and (plant_at ?v ?loc)(full ?loc)
                    (not (carrying ?v))(not(empty ?loc)))
    )
    
    

;define actions here

)