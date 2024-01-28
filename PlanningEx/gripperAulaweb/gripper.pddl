(define (domain gripper)
    ; we require STRIPS: classical planning with no negative preconditions
    (:requirements :strips)
    
    (:predicates
        ; "Type" predicates to distinguish objects
        (ROOM ?x) (BALL ?x) (GRIPPER ?x)
        ; the robot is in room ?r
        (at_robby ?r) 
        ; ball ?b is in room ?r
        (at_ball ?b ?r)
        ; gripper ?g is free
        (free ?g)
        ; gripper ?g is carrying ball ?b
        (carry ?g ?b)
    )
    
    (:action move
        ; move from room ?from to room ?to
        :parameters (?from ?to)
        :precondition (and (ROOM ?from) (ROOM ?to) (at_robby ?from))
        :effect (and (at_robby ?to) (not (at_robby ?from)))
    )
    
    (:action pickup
        ;pick up ball ?b in room ?r with gripper ?g
        :parameters (?b ?r ?g)
        :precondition (and (BALL ?b) (ROOM ?r) (GRIPPER ?g)
                            (at_ball ?b ?r) (at_robby ?r) (free ?g))
        :effect (and (carry ?g ?b) (not (at_ball ?b ?r)) (not (free ?g)))
    )
    
    (:action putdown
        ;put down ball ?b in room ?r with gripper ?g
        :parameters (?b ?r ?g)
        :precondition (and (BALL ?b) (ROOM ?r) (GRIPPER ?g)
                            (at_robby ?r) (carry ?g ?b))
        :effect (and (at_ball ?b ?r) (free ?g) (not (carry ?g ?b)))
    )
)