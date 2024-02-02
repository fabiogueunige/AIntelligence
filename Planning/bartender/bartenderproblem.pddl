(define (problem bartenderproblem) 
    (:domain bartender)
    (:objects 
        glass1 glass2 glass3 glass4
        dispenser
        left right        
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (GLASS glass1) (GLASS glass2) (GLASS glass3) (GLASS glass4)
        (DISPENSER dispenser)
        (HAND left) (HAND right)
        

        ; Fluents
        (empty glass1) (empty glass2) (empty glass3) (empty glass4)
        (free left) (free right)
        (in_shelf glass1) (in_shelf glass2) (in_shelf glass3) (in_shelf glass4)

    )

    (:goal (and
        (served glass1) 
        (served glass2)
        (served glass3)
        (served glass4)
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)
