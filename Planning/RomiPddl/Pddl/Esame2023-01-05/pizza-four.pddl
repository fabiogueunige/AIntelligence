(define (problem pizza-four)

    (:domain pizza_lover)

    (:objects
        one-hand
        tomato cheese 
        ham salame olives mushrooms
        marinara margherita boscaiola

    )

    (:init
        (GRIPPER one-hand)
        (BASE tomato) (BASE cheese)
        (TOPPING ham)(TOPPING salame)(TOPPING olives)(TOPPING mushrooms)
        (PIZZA marinara)(PIZZA margherita)(PIZZA boscaiola)

        (free one-hand)
        (can_go cheese ham)(can_go cheese salame)
        (can_go cheese olives)(can_go cheese mushrooms)
        
        (different tomato cheese)

        (pizza_base margherita)
        (pizza_topping marinara olives)
        (pizza_topping boscaiola mushrooms)
    )

    (:goal 
        (and
            (serve margherita)
            (serve boscaiola)
            (serve marinara)
        )
    )
)