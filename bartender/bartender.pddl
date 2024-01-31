;Header and description

(define (domain bartender)

;remove requirements that are not needed
    (:requirements :strips )

    (:predicates ;todo: define predicates here
        (GLASS ?g)
        (DISPENSER ?d)
        (GRIPPER ?h)
        (COSTUMER ?c)

        ; Fluents
        (empty ?g)
        (full ?g)
        (taken ?g)
        (free ?h)
        (hook ?d)
        (unhook ?d)
        (carryng ?h)
        (different ?h1 ?h2)
        (served ?c)
    )

    (:action takeglass
        :parameters (?g ?d ?h1 ?h2)
        :precondition (and 
            (GLASS ?g) (DISPENSER ?d) (GRIPPER ?h1) (GRIPPER ?h2)
            (empty ?g) (free ?h1) (free ?h2) (different ?h1 ?h2)
            (unhook ?d)
        )
        :effect (and (taken ?g) (carryng ?h1) (not (free ?h1)))   
    )

    (:action takedispenser
        :parameters (?d ?h ?g)
        :precondition (and 
            (DISPENSER ?d) (GRIPPER ?h) (GLASS ?g)
            (taken ?g) (free ?h) (unhook ?d)
        )
        :effect (and (hook ?d) (not (free ?h)) (not (unhook ?d)))
    )

    (:action pour
        :parameters (?g ?d ?h1 ?h2)
        :precondition (and  (GLASS ?g) (DISPENSER ?d) (GRIPPER ?h1) (GRIPPER ?h2)
                        (carryng ?h1) (taken ?g) (hook ?d) (carryng ?h2) (different ?h1 ?h2)
                        (empty ?g)
                        )
        :effect (and (full ?g) (not (empty ?g)))
    )

    (:action serving
        :parameters (?g ?d ?h1 ?h2 ?c)
        :precondition (and  
            (GLASS ?g) (DISPENSER ?d) (GRIPPER ?h1) (GRIPPER ?h2) (COSTUMER ?c)
            (carryng ?h1) (taken ?g) (hook ?d) (carryng ?h2) (different ?h1 ?h2)
            (full ?g)
        )
        :effect (and 
            (served ?c) (not (full ?g)) (empty ?g) (free ?h1) (free ?h2) (unhook ?d)
            (not (taken ?g)) (not (carryng ?h1)) (not (carryng ?h2)) (not (hook ?d))
        )
    )
    


;define actions here

)