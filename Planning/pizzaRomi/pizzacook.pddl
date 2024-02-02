(define (problem pizzacook)
    (:domain pizza)

    (:objects 
        margherita marinara boscaiola
        tomato cheese
        ham salame olives mushrooms 
    )

    (:init
        (PIZZA margherita) (PIZZA marinara) (PIZZA boscaiola)
        (TRAYS tomato) (TRAYS cheese)
        (TOPPINGS ham) (TOPPINGS salame) (TOPPINGS olives) (TOPPINGS mushrooms)

        (different tomato cheese)
        ; Follow the order
        (on_top margherita tomato)
        (on_top margherita cheese)
        (no_topping margherita)

        (on_top marinara tomato)
        (on_top marinara cheese)
        (on_top marinara olives)
        
        (on_top boscaiola tomato)
        (on_top boscaiola cheese)
        (on_top boscaiola mushrooms)

    )
    
        (:goal (and
            (cooked margherita)
            (cooked marinara)
            (cooked boscaiola)
        ))

)