(define (domain pizza)
    (:requirements 
        :strips 
        :typing 
        :equality)

    (:predicates
        (GRIPPER ?g)
        (BASE ?b)
        (TOPPING ?t)
        (PIZZA ?p)
        ; Action
        (free ?g) (carrying ?pizza) 
        (base_done ?p)(topping_done ?p)(pizza_done ?p)
        
        ;connection
        (can_go ?p ?t)  (serve ?p)

        ;QUALCOSA
        (pizza_with ?p)
        (pizza_topping ?p ?t)
        
    )

    (:action take_fetch
        :parameters (?p ?g)
        :precondition (and (PIZZA ?p) (free ?g))
        :effect (and (carrying ?p)(not(free ?g)))
    )
    
    (:action put_base
       :parameters (?p ?b1)
       :precondition (and (carrying ?p)(BASE ?b1))
       :effect (and (base_done ?p))
    )
   
    (:action cook
       :parameters (?g ?p)
       :precondition (and (PIZZA ?p)(GRIPPER ?g)
                        (carrying ?p) (topping_done ?p) (base_done ?p))
       :effect (and (pizza_done ?p)(not(carrying ?g)))
    )

    

    (:action put_topping
         :parameters (?p ?b ?t)
         :precondition (and (PIZZA ?p)(BASE ?b)(TOPPING ?t)
                            (base_done ?p)(carrying ?p)(base_done ?p)
                            (can_go ?b ?t ))
         :effect (and (topping_done ?p))
    )
    
    (:action take_out
         :parameters (?p ?t)
         :precondition (and (PIZZA ?p)(TOPPING ?t)(pizza_done ?p))
         :effect (and (carrying ?p)(pizza_with ?p)(pizza_topping ?p ?t))
    )

    (:action serve
        :parameters (?p ?g)
        :precondition (and (PIZZA ?p)(GRIPPER ?g)
                        (carrying ?p) (pizza_done ?p))
        :effect (and (serve ?p)(not(carrying ?g))(not(free ?g)))
    )

)