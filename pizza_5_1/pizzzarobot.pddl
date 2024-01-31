(define (domain pizzarobot)
    (:requirements :strips )

    (:predicates
        (PIZZA ?p)
        ; dough, tomato, cheese
        (TRAYS ?t ?tc ?tt)
        ; ham, salame, olives, mushroom
        (TOPPINGS ?tp)
        (OVEN ?o)
        
        ; Fluent
        ; (trays_on ?p ?t)
        (empty ?p)
        (pizzamake ?p ?t ?tt ?tc ?tp ?o)
        (dough_on ?p ?t)
        (dough_off ?p)
        (tomato_on ?p ?tt)
        (tomato_off ?p)
        (cheese_on ?p ?tc)
        (cheese_off ?p)
        (topping_on ?p ?tp)
        (topping_off ?p)
        (in_oven ?p ?o)
        (out_oven ?p ?o)
    )

    (:action pizzacreation
        ; Cretes the pizza so starting from the tomato
        :parameters (?p ?t ?o)
        :precondition (and (PIZZA ?p)(OVEN ?o)
                        (empty ?p) (dough_off ?p) (tomato_off ?p) (cheese_off ?p)
                        (out_oven ?p ?o) (topping_off ?p)
                      )
        :effect (and (dough_on ?p ?t) 
                    (not(empty ?p)) (not (dough_off ?p))
                )    
    )

    (:action tomatoadd
        :parameters (?p ?t ?o)
        :precondition (and (PIZZA ?p) (TRAYS ?t) (OVEN ?o)
                        (dough_on ?p ?t) (tomato_off ?p ?t) (cheese_off ?p ?tc)
                        (out_oven ?p ?o) (topping_off ?p)        
                      )
        :effect (and (tomato_on ?p ?t) (not (tomato_off ?p ?t)))
    )

    (:action cheeseadd
        :parameters (?p ?t ?tc ?tp ?o)
        :precondition (and (PIZZA ?p) (TRAYS ?t) (TOPPINGS ?tp) (OVEN ?o)
                        (dough_on ?p ?t) (tomato_on ?p ?t) (cheese_off ?p ?tc)
                        (out_oven ?p ?o) (topping_off ?p)  
                        
                        )
        :effect (and (cheese_on ?p ?tc) (not (cheese_off ?p ?tc)))
    )

    (:action toppingadd
        :parameters (?p ?t ?tp ?o)
        :precondition (and (PIZZA ?p) (TRAYS ?t) (TOPPINGS ?tp) (OVEN ?o)
                        (dough_on ?p ?t) (tomato_on ?p ?t) (cheese_on ?p ?t)
                        (out_oven ?p ?o) (topping_off ?p)  )
        :effect (and (topping_on ?p ?tp) (not (topping_off ?p)))
    )

    (:action serve
        :parameters (?p ?t ?tt ?tc ?tp ?o)
        :precondition (and (PIZZA ?p) (TRAYS ?t) (TOPPINGS ?tp) (OVEN ?o)
                        (dough_on ?p ?t) (tomato_on ?p ?t) (cheese_on ?p ?t)
                        (out_oven ?p ?o) (topping_on ?p ?tp) 
        )
        :effect (and (in_oven ?p ?o) (pizzamake ?p ?t ?tt ?tc ?tp ?o) (not (out_oven ?p ?o)))
    )  
)