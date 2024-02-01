(define (problem three-robot) 
    (:domain fix-robot)
    (:objects 
        room1 room2 room3
        screw nut
        left right
        fix1 fix2 fix3
        robot
    )

    (:init
        (ROOM room1)(ROOM room2)(ROOM room3)
        (OBJECT screw)(OBJECT nut)
        (GRIPPER left)(GRIPPER right)
        (FIX fix1)(FIX fix2)(FIX fix3)
        
        (can_fix screw left)(can_fix nut right)
        (in room1)

        (at_robot fix1 room1)(at_robot fix2 room2)(at_robot fix3 room3)
        (manca fix1 nut)(manca fix3 nut)
        (manca fix2 screw)(manca fix2 nut)

        (fix_base fix1)(fix_base fix3)
        
        (different right left)
        (different nut screw)

    )

    (:goal 
        (and
            (robot_fix fix1)
            (robot_fix fix2)
            (robot_fix fix3)
        )

    )

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
