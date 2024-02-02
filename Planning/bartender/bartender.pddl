;Header and description

(define (domain bartender)

;remove requirements that are not needed
    (:requirements :strips )

    (:predicates ;todo: define predicates here
        (GLASS ?g)
        (DISPENSER ?d)
        (HAND ?h)

        ; Fluents
        (empty ?g)
        (full ?g)
        (free ?h)
        (carryg ?h ?g)
        (carryd ?h ?d)
        (in_shelf ?g)
        (in_hand ?g)
        (hook ?d)
        (served ?g)
    )

    (:action takeglass
        :parameters (?g ?h)
        :precondition (and (GLASS ?g) (HAND ?h)
            (empty ?g) (in_shelf ?g) (free ?h)            
        )
        :effect (and (carryg ?h ?g) (in_hand ?g) (not (in_shelf ?g)) 
                (not (free ?h))
        )   
    )

    (:action takedispenser
        :parameters (?d ?h)
        :precondition (and (DISPENSER ?d) (HAND ?h)
                (free ?h)
        )
        :effect (and (hook ?d) (carryd ?h ?d) 
                (not (free ?h)))
    )

    (:action pour
        :parameters (?g ?d)
        :precondition (and (GLASS ?g) (DISPENSER ?d)
                        (hook ?d) (in_hand ?g)
                        )
        :effect (and (full ?g) (not (empty ?g)))
    )

    (:action serving
        :parameters (?g ?d ?h1 ?h2)
        :precondition (and (GLASS ?g) (DISPENSER ?d) (HAND ?h1) (HAND ?h2)
            (full ?g)
            
        )
        :effect (and 
            (served ?g) (not (full ?g)) (not (hook ?d))
            (free ?h1) (free ?h2) (not (carryg ?h1 ?g)) (not (carryd ?h2 ?d))
            )
     )
)

