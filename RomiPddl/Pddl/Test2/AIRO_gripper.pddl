(define (problem gripper_object)
    (:domain gripperme)

    (:objects
        room_1 room_2 room_3 room_4
        object_1 object_2 object_3 object_4
        
        robot
        gripper_left gripper_right
    )

    (:init
        (ROOM room_1)(ROOM room_2)(ROOM room_3)(ROOM room_4)
        (OBJECT object_1)(OBJECT object_2)(OBJECT object_3)(OBJECT object_4)
        (ROBOT robot)
        (GRIPPER gripper_left)(GRIPPER gripper_right)

        (at_robot room_1)
        (at_object object_1 room_2)(at_object object_2 room_2)
        (at_object object_3 room_3)(at_object object_4 room_3)

        (heavy object_1)(heavy object_3)
        (light object_2)(light object_4)


        (free gripper_left)(free gripper_right)

        (connected room_1 room_2)(connected room_2 room_1)
        (connected room_2 room_3)(connected room_3 room_2)
        (connected room_3 room_4)(connected room_4 room_3)
    )


    (:goal 
        (and 
            (at_object object_1 room_4)
            (at_object object_2 room_4)
            (at_object object_3 room_4)
            (at_object object_4 room_4)
        )
    )
)