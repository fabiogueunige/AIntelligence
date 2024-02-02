(define (problem objproblem) (:domain obj)
    (:objects 
        r1 r2 r3
        obj1 obj2 obj3
        scr wr
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (ROOMS r1) (ROOMS r2) (ROOMS r3)
        (OBJ obj1) (OBJ obj2) (OBJ obj3)
        (HAND scr) (HAND wr)
    
        (nut obj1) (screw obj3) (both obj2)
        (at_obj obj1 r1) (at_obj obj2 r2) (at_obj obj3 r3)
        (start r1)
        (be r1)
        (move r1 r2)(move r1 r3)(move r2 r1)
        (move r2 r3)(move r3 r1)(move r3 r2)
        (scr_ready scr) (wr_ready wr)
    )

    (:goal (and
        ;todo: put the goal condition here
           (fixed obj1) (fixed obj2) (fixed obj3)
           (at_rob r1)
        )
    
    )

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
