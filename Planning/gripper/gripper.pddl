(define (domain gripper)
    ; This is how I can put comments
    ; we require STRIPS planning (classical planning)
    ; all the restrictive assumptions we made (A0 - A7)
    (:requirements :strips )

    ; name of the variable is the same, but better more readable name

    ; Predicates
    (:predicates 
        ; "type" predicates
        (ROOM ?x) (BALL ?x) (GRIPPER ?x)
        ; The robot is in room x
        (at_robot ?r)
        ; The ball is in room x
        (at_ball ?b ?r)
        ; The gripper is free x
        (free ?g)
        ; The gripper is holding the ball b
        (carry ?g ?b)
    )

    ; Operators
    (:action move
        ; Move the robot from room ?from to room ?to -> from will not be a room anymore
        :parameters (?from ?to)
        :precondition (and (ROOM ?from) (ROOM ?to) (at_robot ?from))
        :effect (and (at_robot ?to) (not (at_robot ?from)))
        ; without the not i will duplicate the at_robot ?to in ?from
    )

    (:action pickup
        ; pickup a ball ?b in a room ?r with a gripper ?g
        :parameters (?b ?r ?g)
        ; robot, ball in the room and gripper must be free
        :precondition (and (BALL ?b) (ROOM ?r) (GRIPPER ?g) 
                            (at_ball ?b ?r) (at_robot ?r) (free ?g))
        ; In STRIPS planning no side effects, so I have to remove the ball from the room
        ; Pickping the ball is in the robot and not in the room (not in the floor) to be easier
        :effect (and (carry ?g ?b) (not (at_ball ?b ?r)) (not (free ?g)))
    )

    (:action putdown
    ;   ; putdown a ball ?b in a room ?r with a gripper ?g
        :parameters (?b ?r ?g)
        ; robot, ball in the room and gripper must be carry the ball
        :precondition (and (BALL ?b) (ROOM ?r) (GRIPPER ?g) 
                            (at_robot ?r) (carry ?g ?b))
        ; Now the gripper is free and the ball is in the room (remember carry is the negation of free)
        :effect (and (at_ball ?b ?r) (free ?g) (not (carry ?g ?b)))
    )
    
    ; Not speaking about balls because not needed to do

)