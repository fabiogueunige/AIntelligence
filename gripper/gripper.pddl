(define gripper


    (: prediates ()
    ; Predicates that define "types" of objects
    (BALL ?b)
    (ROOM ?r)
    (GRIPPER ?g)
    ; Predicates that define the state of affairs
    (at-robby ?r)
    (at-ball ?b ?r)
    (free ?g)
    (carry ?b ?g)
    )


    ;; Operator definitions
    (:action move)


    ;; Recap all the stuff lost

    (:action pickup
    :paraeters (?b ?r ?g)
    :precondition (and (BALL ?b) (ROOM ?r) (GRIPPER ?g)
                                    )
    
    
    )
)