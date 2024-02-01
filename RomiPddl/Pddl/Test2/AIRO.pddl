(define (domain gripperme)
    (:requirements 
        :strips 
        :equality 
        :typing
    )

    (:predicates
     ; Type of object
        (OBJECT ?o) (GRIPPER ?g) (ROBOT ?r) (ROOM ?room)
    ; Object location
        (at_object ?o ?room)  (at_robot ?room)
    ; Object characteristics
        (heavy ?o) (light ?o) (connected ?rooma ?roomb)
    ; Fluent
        (free ?g) (carry ?o ?g)(carry_heavy ?o ?g1 ?g2)  
    ) 

    (:action move
        :parameters (?from ?to)
        :precondition (and (ROOM ?from) (ROOM ?to) (at_robot ?from)
                        (connected ?from ?to))
        :effect (and (at_robot ?to)(not (at_robot ?from)))
    )
    
    (:action collect_light
        :parameters (?o ?room ?g)
        :precondition (and (OBJECT ?o)(ROOM ?room)(GRIPPER ?g)
                        (at_object ?o ?room) (at_robot ?room)(free ?g)(light ?o))
        :effect (and (carry ?o ?g) (not (free ?g)) (not (at_object ?o ?room)))
    )
    
    (:action collect_heavy
        :parameters (?o ?room ?left ?right)
        :precondition (and (OBJECT ?o)(ROOM ?room)(GRIPPER ?right)(GRIPPER ?left)
                        (at_object ?o ?room) (at_robot ?room)(heavy ?o)
                        (free ?left)(free ?right))
        :effect (and (carry_heavy ?o ?right ?left) (not (at_object ?o ?room))
                    (not (free ?left))(not (free ?right)))
    )
    
    (:action drop_light
        :parameters (?o ?room ?g)
        :precondition (and (OBJECT ?o)(ROOM ?room)(GRIPPER ?g)
                        (at_robot ?room)(carry ?o ?g)(light ?o))
        :effect (and (at_object ?o ?room) (free ?g) (not (carry ?o ?g)))
    )
    
    
    (:action drop_heavy
        :parameters (?o ?room ?left ?right)
        :precondition (and (OBJECT ?o)(ROOM ?room)(GRIPPER ?right)(GRIPPER ?left)
                        (at_robot ?room)(carry_heavy ?o ?left ?right)(heavy ?o))
        :effect (and (at_object ?o ?room) (free ?right)(free ?left)
                    (not(carry_heavy ?o ?left ?right)))
    )
)