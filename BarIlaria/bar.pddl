(define (domain bar)
    (:requirements :strips)

    (:predicates 
        (STAND ?stand)
        (DISPENSER ?disp)
        (SHELF ?s)
        (GLASS ?g)

        (in_stand ?disp ?stand)
        (in_shelf ?g ?shelf)

        (empty_glass ?g)
        (ready_to_drink ?g)

        (glass_in_arm ?g)
        (dispenser_in_arm ?disp)

        (served ?g)
        (ok_fill ?g)

        ;(go_to_start ?disp)

    )

    (:action take_glass
        :parameters (?s ?g)
        :precondition (and 
            (in_shelf ?g ?s) (empty_glass ?g)
        )
        :effect (and 
            (glass_in_arm ?g) (not (in_shelf ?g ?s)) (ok_fill ?g))  
    )

    (:action unhook_dispenser
        :parameters (?stand ?disp)
        :precondition (and 
            (in_stand ?disp ?stand) 
        )
        :effect (and 
            (dispenser_in_arm ?disp) (not (in_stand ?disp ?stand))
        )
    )

    (:action fill_the_glass
        :parameters (?g ?disp)
        :precondition (and 
            (dispenser_in_arm ?disp) (glass_in_arm ?g) (ok_fill ?g) (empty_glass ?g)
        )
        :effect (and 
            (ready_to_drink ?g) (not (empty_glass ?g)) (not (ok_fill ?g))
        )
    )

    (:action hook_dispenser
        :parameters (?disp ?stand ?g)
        :precondition (and 
            (dispenser_in_arm ?disp) (ready_to_drink ?g) (glass_in_arm ?g)
        )
        :effect (and 
            (in_stand ?disp ?stand) (not (dispenser_in_arm ?disp)))
    )

    (:action serve_drinks
        :parameters (?g)
        :precondition (and 
            (ready_to_drink ?g) (glass_in_arm ?g)
        )
        :effect (and 
           (not (ready_to_drink ?g)) (not (glass_in_arm ?g)) (served ?g)
           )
        )
    
)
