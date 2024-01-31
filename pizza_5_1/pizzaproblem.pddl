(define (problem pizzaproblem)
    (:domain pizzarobot)

    (:objects 
        margherita marinara boscaiola
        dough tomato cheese
        ham salame olives mushrooms no
        oven
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (PIZZA margherita) (PIZZA marinara) (PIZZA boscaiola)
        (TRAYS dough) (TRAYS tomato) (TRAYS cheese)
        (TOPPINGS ham) (TOPPINGS salame) (TOPPINGS olives) (TOPPINGS mushrooms) (TOPPINGS no)
        (OVEN oven)

        ; Fluent
        (empty margherita) (empty marinara) (empty boscaiola)
        (dough_off margherita dough) (dough_off marinara dough) (dough_off boscaiola dough)
        (tomato_off margherita tomato) (tomato_off marinara tomato) (tomato_off boscaiola tomato)
        (cheese_off margherita cheese) (cheese_off marinara cheese) (cheese_off boscaiola cheese)
        (topping_off margherita) (topping_off marinara) (topping_off boscaiola)
        (out_oven margherita oven) (out_oven marinara oven) (out_oven boscaiola oven)
    )

    (:goal (and (in_oven margherita oven) (in_oven marinara oven) (in_oven boscaiola oven)
        ;todo: put the goal condition here
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)
