(define (domain obj)
    (:requirements :strips 
    )

    (:predicates
        (ROOMS ?r)
        (OBJ ?o)
        (HAND ?h)

        (scr_ready ?h)
        (wr_ready ?h)

        (at_rob ?r)
        (move ?r1 ?r2)
        (at_obj ?o ?r)
        (be ?r)
        (start ?r)
        (fixed ?o)
        (screw ?o)
        (nut ?o)
        (both ?o)
        (finish ?r)
    )
    ; Must return to room1 at the end of fixing

    (:action fixnut
        :parameters (?r ?o ?h)
        :precondition (and (ROOMS ?r) (OBJ ?o)
            (at_obj ?o ?r) (be ?r)
            (nut ?o) (wr_ready ?h)
        )
        :effect (and 
            (not (nut ?o))
            (fixed ?o)
        )
    )

    (:action move
        :parameters (?r1 ?r2)
        :precondition (and (ROOMS ?r1) (ROOMS ?r2)
            (move ?r1 ?r2)
        )
        :effect (and 
            (be ?r2)
            (not(be ?r1))
        )
    )

    (:action fixscrew
        :parameters (?r ?o ?h)
        :precondition (and (ROOMS ?r) (OBJ ?o)
            (at_obj ?o ?r) (be ?r)
            (screw ?o) (scr_ready ?h)
        )
        :effect (and 
            (not (screw ?o))
            (fixed ?o)
        )
        
    )

    (:action fixdouble
        :parameters (?o ?r ?h1 ?h2)
        :precondition (and (OBJ ?o) (ROOMS ?r)
            (at_obj ?o ?r) (be ?r) (scr_ready ?h1) (wr_ready ?h2)
            (both ?o)
        )
        :effect (and (fixed ?o) (not (both ?o)))
    )

    (:action check_end
        :parameters (?o1 ?o2 ?o3 ?r)
        :precondition (and (OBJ ?o1) (OBJ ?o2) (OBJ ?o3) (ROOMS ?r)
            (fixed ?o1) (fixed ?o2) (fixed ?o3)            
        )
        :effect (and (finish ?r)
        )
    )
    

    (:action returnbase
        :parameters (?r ?st )
        :precondition (and (ROOMS ?st) (ROOMS ?r)
            (start ?st) (finish ?r)
        )
        :effect (and 
            (at_rob ?st)
        )
    )

)