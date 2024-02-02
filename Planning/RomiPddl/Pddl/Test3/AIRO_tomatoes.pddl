(define (problem tomatoes_table)
    (:domain tomatoesme)

    (:objects
        tomato1 tomato2 tomato3 tomato4
        table agent
        
        loc1 loc2 loc3 loc4
    )

    (:init
        (TOMATOES tomato1)(TOMATOES tomato2)(TOMATOES tomato3)(TOMATOES tomato4)
        (LOCATION loc1)(LOCATION loc2)(LOCATION loc3)(LOCATION loc4) 
        (LOCATION table)
        (PERSON agent)
        
        (on_table tomato1 table)(on_table tomato2 table)
        (on_table tomato3 table)(on_table tomato4 table)

        (empty loc1)(empty loc2)(empty loc3)(empty loc4)

        (con table loc1)(con loc1 table)
        (con table loc2)(con loc2 table)
        (con table loc3)(con loc3 table)
        (con table loc4)(con loc4 table)

        (at_loc table) (free agent)
    )

    (:goal 
        (and
            (full loc1)
            (full loc2)
            (full loc3)
            (full loc4)
        )
    )
)