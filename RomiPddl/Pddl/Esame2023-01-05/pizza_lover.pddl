(define (domain pizza_lover)
    (:requirements 
        :strips )
    
    (:predicates
        (PIZZA ?p)(TOPPING ?t) (BASE ?b)(GRIPPER ?g)

        ;Azioni da svolgere
        (can_go ?b ?t)(free ?free)(pizza_cotta ?p) 
        (base_pronta ?b)(pizza_pronta ?p) (carrying ?p)
        (da_serve ?p)    

        ;Tipi di pizza
        (pizza_base ?p)(pizza_topping ?p ?t)

        ;serve
        (serve ?p) (different ?p ?p2)


    )

    (:action take_fetch 
        :parameters (?p ?g)
        :precondition (and (PIZZA ?p)(GRIPPER ?g)(free ?g))
        :effect (and (carrying ?p)(not(free ?g)))
    )

    (:action put_base
        :parameters (?p ?b1 ?b2 ?g)
        :precondition (and (PIZZA ?p)(BASE ?b1) (BASE ?b2)(GRIPPER ?g) 
                        (carrying ?p)(pizza_base ?p)(different ?b1 ?b2))
        :effect (and (pizza_pronta ?p))
    )
    
    (:action put_base_topping
        :parameters (?p ?b ?g)
        :precondition (and (PIZZA ?p)(BASE ?b) (GRIPPER ?g) 
                        (carrying ?p))
        :effect (and (base_pronta ?p))
    )
    (:action put_topping
        :parameters (?p ?b ?t)
        :precondition (and (PIZZA ?p)(BASE ?b)(TOPPING ?t) 
                        (base_pronta ?p)(can_go ?b ?t)(pizza_topping ?p ?t) )
        :effect (and (pizza_pronta ?p))
    )

    (:action cook
        :parameters (?p ?g)
        :precondition (and (PIZZA ?p)(GRIPPER ?g)(pizza_pronta ?p))
        :effect (and (pizza_cotta ?p))
    )
    (:action take_out
        :parameters (?p ?g)
        :precondition (and (PIZZA ?p)(GRIPPER ?g)(pizza_cotta ?p))
        :effect (and (da_serve ?p)(carrying ?p)(not(free ?g)))
    )
    
    (:action serve
        :parameters (?p ?g)
        :precondition (and (PIZZA ?p)(GRIPPER ?g)(da_serve ?p)(carrying ?p))
        :effect (and (free ?g)(serve ?p)
                    (not (pizza_cotta ?p))(not(carrying ?p))
                    (not (pizza_pronta ?p))(not (base_pronta ?p))
                    (not(da_serve ?p)))
    )
    
    
    
    
    
)