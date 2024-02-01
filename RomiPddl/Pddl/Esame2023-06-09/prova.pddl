(define (domain flower)
    (:requirements 
        :strips 
        
    )

    (:predicates
        (FLOWER ?f)(VASE ?v)(LOCATION ?loc)

        (at_rob ?loc)(in_vase ?loc)(at_object ?o ?loc) 
        (can_go ?loc1 ?loc2)(full ?loc)(empty ?loc)

    )

    (:action vase_plant
        :parameters (?f ?v ?loc)
        :precondition (and (FLOWER ?f)(VASE ?v)(LOCATION ?loc)
                        (at_rob ?loc))
        :effect (and (in_vase ?loc)
                    (not(at_object ?v ?loc))(not (at_object ?f ?loc)))
    )

    (:action move_flower
        :parameters (?f ?from ?to)
        :precondition (and (LOCATION ?from)(LOCATION ?to)
                        (at_rob ?from)(can_go ?from ?to)(in_vase ?from))
        :effect (and (at_rob ?to)(not(at_rob ?from))
                    (in_vase ?to)(not(in_vase ?from)))
        
    )  

    (:action move
        :parameters (?f ?from ?to)
        :precondition (and (LOCATION ?from)(LOCATION ?to)(FLOWER ?f)
                        (at_rob ?from)(can_go ?from ?to))
        :effect (and (at_rob ?to)(not(at_rob ?from)))
    ) 

    (:action put_plant
        :parameters (?loc)
        :precondition (and (LOCATION ?loc)
                        (in_vase ?loc)(at_rob ?loc))
        :effect (and (full ?loc)(not (empty ?loc)))
    )
     

)