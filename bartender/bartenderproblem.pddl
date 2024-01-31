(define (problem bartenderproblem) 
    (:domain bartender)
    (:objects 
        glass1 glass2 glass3 glass4
        dispenser
        left right
        mario luigi filippo fabio
        
        )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (GLASS glass1) (GLASS glass2) (GLASS glass3) (GLASS glass4)
        (DISPENSER dispenser)
        (GRIPPER left) (GRIPPER right)
        (COSTUMER mario) (COSTUMER luigi) (COSTUMER filippo) (COSTUMER fabio)

        ; Fluents
        (free left) (free right)
        (empty glass1) (empty glass2) (empty glass3) (empty glass4)
        (different left right)
        (unhook dispenser)
    )

    (:goal (and
        (served mario) (served luigi) (served filippo) (served fabio)
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)
