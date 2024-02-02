(define (problem objproblem) (:domain obj)
    (:objects 
        room1 room2 room3 room4
        object1 object2 object3 object4
        screw_hand wrench_hand
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (ROOMS room1) (ROOMS room2) (ROOMS room3) (ROOMS room4)
        (OBJ object1) (OBJ object2) (OBJ object3) (OBJ object4)
        (HAND screw_hand) (HAND wrench_hand)
    
        (nut object1) (screw object3) (both object2) (screw object4)
        (screw object2) (nut object2)
        (ok_s object1) (ok_n object3) (ok_n object4)
        (at_obj object1 room1) (at_obj object2 room2) (at_obj object3 room3) (at_obj object4 room4)
        (start room1)
        (be room1)
        (move room1 room2)(move room1 room3)(move room2 room1) 
        (move room2 room3)(move room3 room1)(move room3 room2)
        (move room1 room4) (move room2 room4) (move room3 room4)
        (move room4 room1) (move room4 room2) (move room4 room3)
        (different object1 object2 object3 object4)

        (scr_ready screw_hand) (wr_ready wrench_hand)
    )

    (:goal (and
        ;todo: put the goal condition here
           (fixed object1) (fixed object2) (fixed object3) (fixed object4)
           (at_rob room1)
        )
    
    )

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
