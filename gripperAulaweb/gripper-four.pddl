(define (problem gripper-four)
    (:domain gripper)
    
    (:objects
        room_a room_b                 ; Two rooms a and b
        ball_1 ball_2 ball_3 ball_4   ; Four balls, 1 to 4
        left right                    ; left and right gripper
    )

    (:init 
        ; room_a and room_b are rooms
        (ROOM room_a) (ROOM room_b)
        ; ball_1 to ball_4 are balls
        (BALL ball_1) (BALL ball_2) (BALL ball_3) (BALL ball_4)
        ; left and right are grippers
        (GRIPPER left) (GRIPPER right)
        ; the robot is initially in room_a
        (at_robby room_a)
        ; all balls are initially in room_a
        (at_ball ball_1 room_a) (at_ball ball_2 room_a)
        (at_ball ball_3 room_a) (at_ball ball_4 room_a)
        ; the grippers are initially empty
        (free left) (free right)
    )
    
    (:goal (and (at_ball ball_1 room_b) (at_ball ball_2 room_b)
                (at_ball ball_3 room_b) (at_ball ball_4 room_b)))

)