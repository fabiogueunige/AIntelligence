(define (problem bar-prob) (:domain bar)

    (:objects
        dispenser
        stand
        shelf
        glass1 glass2 glass3 glass4
    )

    (:init
        (STAND stand)
        (SHELF shelf)
        (DISPENSER dispenser)
        (GLASS glass1) (GLASS glass2) (GLASS glass3) (GLASS glass4)

        (in_stand dispenser stand)

        (in_shelf glass1 shelf)
        (in_shelf glass2 shelf)
        (in_shelf glass3 shelf)
        (in_shelf glass4 shelf)

        (empty_glass glass1)
        (empty_glass glass2)
        (empty_glass glass3)
        (empty_glass glass4)
    )

    (:goal (and
        (served glass1)
        (served glass2)
        (served glass3)
        (served glass4)

        
    ))


)