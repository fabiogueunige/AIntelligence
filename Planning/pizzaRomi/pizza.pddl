(define (domain pizza)
    (:requirements :strips )

    (:predicates
        (PIZZA ?p)
        ; dough, tomato, cheese
        (TRAYS ?t)
        ; ham, salame, olives, mushroom
        (TOPPINGS ?tp)

        ; Fluents (add when needed in the actions)
        ; Trays different
        (different ?to ?tc)
        ; Pizza one over the oher to have base ready
        (on_top ?p ?t)
        ; base ready
        (base_ok ?p)
        (toppin_ok ?p)
        (cooked ?p)
        (no_topping ?p)  
    )

    (:action putbase
        :parameters (?p ?to ?tc)
        :precondition (and (PIZZA ?p) (TRAYS ?to) (TRAYS ?tc)
            (different ?to ?tc) (on_top ?p ?to)  
        )
        :effect (and (base_ok ?p))
    )

    (:action put_topping
        :parameters (?p ?tp)
        :precondition (and (PIZZA ?p) (TOPPINGS ?tp) (base_ok ?p)
                        (on_top ?p ?tp))
        :effect (and (toppin_ok ?p))
    )

    (:action cook_base
        :parameters (?p)
        :precondition (and 
            (PIZZA ?p) (base_ok ?p) (no_topping ?p)
        )
        :effect (and (cooked ?p))
    )

    (:action cook_topping
        :parameters (?p)
        :precondition (and 
            (PIZZA ?p) (base_ok ?p) (toppin_ok ?p)
        )
        :effect (and (cooked ?p))
    )


    
)