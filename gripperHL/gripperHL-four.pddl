(define (problem gripperHL-four)

    (:domain gripperhl)
    (:objects
        room1 room2 room3 room4
        obj1 obj2 obj3 obj4
        left right
    )

    (:init
        (ROOM room1) (ROOM room2) (ROOM room3) (ROOM room4)
        (OBJ obj1) (OBJ obj2) (OBJ obj3) (OBJ obj4)
        (GRIPPER left) (GRIPPER right)
        (heavy obj1) (heavy obj2) (light obj3) (light obj4)
        (at_robot room1)
        (at_object obj1 room2) 
        (at_object obj2 room3) 
        (at_object obj3 room2) 
        (at_object obj4 room4)
        (free left) 
        (free right)
        (different left right)
    )

    (:goal (and
        (at_object obj1 room4)
        (at_object obj2 room4)
        (at_object obj3 room4)
        (at_object obj4 room4)
    ))    
    
)