;Header and description

(define (domain tomato)

;remove requirements that are not needed
(:requirements :strips )

    

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (TOMATO ?t)
        (LOCATION ?l)

        (on_table ?t)
        (at_location ?t ?l)
        (empty ?l)

    )

    (:action move_to_location
        :parameters (?t ?l)
        :precondition (and (TOMATO ?t) (LOCATION ?l) 
                        (on_table ?t) (empty ?l))
        :effect (and (not (empty ?l)) (at_location ?t ?l) (not (on_table ?t)))
    )
    

    ;define actions here

)