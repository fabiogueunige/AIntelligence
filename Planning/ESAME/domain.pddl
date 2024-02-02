; Not same  name to the file because using visual studio

;Header and description
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
        (ok_s ?o)
        (ok_n ?o)
        (be ?r)
        (start ?r)
        (fixed ?o)
        (screw ?o)
        (nut ?o)
        (both ?o)
        (finish ?r)
        (different ?o1 ?o2 ?o3 ?o4)
    )
    ; Must return to room1 at the end of fixing

    (:action fix_nut
        :parameters (?r ?o ?h)
        :precondition (and (ROOMS ?r) (OBJ ?o)
            (at_obj ?o ?r) (be ?r)
            (nut ?o) (wr_ready ?h)
        )
        :effect (and 
            (not (nut ?o))
            (ok_n ?o)
        )
    )

    (:action move_from_to
        :parameters (?r1 ?r2)
        :precondition (and (ROOMS ?r1) (ROOMS ?r2)
            (move ?r1 ?r2) (be ?r1)
        )
        :effect (and 
            (not(be ?r1))
            (be ?r2)
            
        )
    )

    (:action fix_screw
        :parameters (?r ?o ?h)
        :precondition (and (ROOMS ?r) (OBJ ?o)
            (at_obj ?o ?r) (be ?r)
            (screw ?o) (scr_ready ?h)
        )
        :effect (and 
            (not (screw ?o))
            (ok_s ?o)
        )
        
    )

    (:action fix_check
        :parameters (?o)
        :precondition (and (OBJ ?o)
            (ok_s ?o) (ok_n ?o)
        )
        :effect (and (fixed ?o))
    )

    (:action check_end
        :parameters (?o1 ?o2 ?o3 ?o4 ?r)
        :precondition (and (OBJ ?o1) (OBJ ?o2) (OBJ ?o3) (OBJ ?o4) (ROOMS ?r)
            (fixed ?o1) (fixed ?o2) (fixed ?o3) (fixed ?o4) (different ?o1 ?o2 ?o3 ?o4)  
            (be ?r)          
        )
        :effect (and (finish ?r)
        )
    )
    

    (:action return_base_from
        :parameters (?r ?st )
        :precondition (and (ROOMS ?st) (ROOMS ?r)
            (start ?st) (finish ?r)
        )
        :effect (and 
            (at_rob ?st)
        )
    )

)