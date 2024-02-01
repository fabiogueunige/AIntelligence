(define (domain gripper) ; domain name must match problem's name
    ; we require STRIPS: classical planning with no negative preconditions
    (:requirements
        :strips                 ; basic preconditions and effects             
        :equality               ; to use = in prediction 
        :negative-preconditions ; to use not in preconditions
    )
    
    (:predicates
        (ROOM ?r) (BALL ?b) (GRIPPER ?g) ; "Type predicates to distinguish objects"
        ; the robot is in room ?r
        (at_robby ?r)
        ; ball ?b is in a room ?r 
        (at_ball ?b ?r)
        ; gripper ?g is free
        (free ?x)
        ; gripper ?g is carrying ball ?b
        (carry ?g ?b)
    )

    (:action move
        :parameters (?from ?to)
        :precondition ( and (ROOM ?from) (ROOM ?to) (at_robby ?from) )
        :effect ( and (at_robby ?to) (not (at_robby ?from)) )
    )
    
    (:action pickup 
        ; pick up ball ?x in room ?y with gripper ?g
        :parameters (?b ?r ?g)
        :precondition ( and (BALL ?b) (ROOM ?r) (GRIPPER ?g) 
                            (at_ball ?b ?r) (at_robby ?r) (free ?g) )
        :effect ( and (carry ?g ?b) (not (at_ball ?b ?r)) (not (free ?g)) )
    )
    
    (:action drop 
        ; drop ball ?x in room ?y with gripper ?g
        :parameters (?b ?r ?g)
        :precondition ( and (BALL ?b) (ROOM ?r) (GRIPPER ?g) 
                            (carry ?g ?b) (at_robby ?r) )
        :effect ( and (at_ball ?b ?r) (free ?g) (not (carry ?g ?b) ) )
    )
    
)