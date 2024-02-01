(define (problem pizza-party)
    (:domain pizza)

    (:objects
        cheese tomato salame olives mushroom ham 
        margherita marinara boscaiola
    )

    (:init
        (PIZZA margherita) (PIZZA marinara) (PIZZA boscaiola)
        (INGREDIENT cheese) (INGREDIENT tomato) 
        (TOPPING salame) (TOPPING olives) (TOPPING mushroom) (TOPPING ham)

        (on_top margherita tomato)
        (on_top margherita cheese)
        (on_top marinara tomato)
        (on_top marinara cheese)
        (on_top marinara olives)
        (on_top boscaiola tomato)
        (on_top boscaiola cheese)
        (on_top boscaiola mushroom)

        (different tomato cheese)

        (no_topping margherita)
        
    )   

    (:goal 
        (and
            (serve margherita)
            (serve marinara)
            (serve boscaiola)
        ) 
    )
)