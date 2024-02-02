(define (problem gripper-four)
    ; Let the planner know about the domain
    (:domain gripper)

    ; Introduce objects
    (:objects 
        room_a room_b
        ball_1 ball_2 ball_3 ball_4
        left right
    )

    ; Assert the initial state
    (:init
        ; Tell the planner about the rooms and the other variables
        (ROOM room_a) (ROOM room_b)
        (BALL ball_1) (BALL ball_2) (BALL ball_3) (BALL ball_4)
        (GRIPPER left) (GRIPPER right)
        ; Telling about the predicates so the location
        (at_robot room_a) 
        ; All balls in room a
        (at_ball ball_1 room_a) (at_ball ball_2 room_a) (at_ball ball_3 room_a) (at_ball ball_4 room_a)
        ; The grippers are free
        (free left) (free right)
    )

    ; Assert the goal state(s)
    (:goal (and
        ; All balls in room b
        (at_ball ball_1 room_b) (at_ball ball_2 room_b) (at_ball ball_3 room_b) (at_ball ball_4 room_b)
    ))
)
