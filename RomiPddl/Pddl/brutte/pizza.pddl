( define (domain pizza)
    (:requirements 
        :strips)

    (:predicates
        (PIZZA ?p) (TOPPING ?t) (INGREDIENT ?i)
        (on_top ?p ?i)(base_ok ?p)(cooked ?p)(serve ?p)(topping_ok ?p)
        (base_piza ?p ?i ?i2) (different ?i ?i2) (no_topping ?p)

        )

    (:action put-base
        :parameters (?p ?i ?i2)
        :precondition (and (PIZZA ?p) (INGREDIENT ?i)(INGREDIENT ?i2)
                        (on_top ?p ?i)(different ?i ?i2))
        :effect (and (base_ok ?p))
    )

    (:action put-topping
        :parameters (?p ?t)
        :precondition (and (PIZZA ?p) (TOPPING ?t)(on_top ?p ?t)(base_ok ?p))
        :effect (and (topping_ok ?p))
    )

    (:action cook-base
        :parameters (?p)
        :precondition (and (PIZZA ?p)(base_ok ?p)(no_topping ?p))
        :effect (and (cooked ?p))
    )

    (:action cook-tooping
        :parameters (?p)
        :precondition (and (PIZZA ?p)(base_ok ?p)(topping_ok ?p))
        :effect (and (cooked ?p))
    )

    (:action serve
        :parameters (?p)
        :precondition (and (PIZZA ?p) (cooked ?p))
        :effect (and (serve ?p))
    )      
        
        
)
