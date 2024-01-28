(define (domain gripperhl)

    (:requirements 
        :strips 
    )

    (:predicates
        (ROOM ?x) (OBJ ?o) (GRIPPER ?g)
        ; Robot in room
        (at_robot ?r)
        ; Object in room need specify obj and room
        (at_object ?o ?r)
        ; weight of the object
        (heavy ?o)
        (light ?o)
        ; free or not the gripper
        (free ?g)
        ; To carry the objects
        (carrying ?o)
        ; to have the different grippers
        (different ?g1 ?g2)
    )
    ; Two types of action for heavy or light. Also the one to move the robot
    (:action liftheavy
    ; lift heavy object
    ; Problem is that the grippers can be both left g (is the same)
    ; So we introduce the predicates different 
        :parameters (?o ?r ?g1 ?g2)
        :precondition (and (OBJ ?o) (GRIPPER ?g1) (GRIPPER ?g2) (ROOM ?r)
                        (heavy ?o) (at_object ?o ?r) 
                        (at_robot ?r) (free ?g1) (free ?g2) (different ?g1 ?g2))
        :effect (and (carrying ?o)
                    (not (at_object ?o ?r)) (not (free ?g1)) (not (free ?g2)))
    )
    (:action putdownheavy
    ; put down heavy object
        :parameters (?o ?r ?g1 ?g2)
        :precondition (and (OBJ ?o) (GRIPPER ?g1) (GRIPPER ?g2) (ROOM ?r)
                        (heavy ?o) (at_robot ?r) (carrying ?o)
                        (different ?g1 ?g2))
        :effect (and (at_object ?o ?r) (free ?g1) (free ?g2)
                    (not (carrying ?o)))
    )

    (:action liftlight
    ; lift light object (ned only one gripper)
        :parameters (?o ?r ?g)
        :precondition (and (OBJ ?o) (GRIPPER ?g) (ROOM ?r)
                        (light ?o) (at_object ?o ?r) 
                        (at_robot ?r) (free ?g))
        :effect (and (carrying ?o)
                    (not (at_object ?o ?r)) (not (free ?g)))
    )

    (:action putdownlight
    ; put down light object
        :parameters (?o ?r ?g)
        :precondition (and (OBJ ?o) (GRIPPER ?g) (ROOM ?r)
                        (light ?o) (at_robot ?r) (carrying ?o))
        :effect (and (at_object ?o ?r) (free ?g)
                    (not (carrying ?o)))
    )

    (:action move
    ; move the robot from room from to room to
        :parameters (?from ?to )
        :precondition (and (ROOM ?from) (ROOM ?to) (at_robot ?from))
        :effect (and (at_robot ?to) (not (at_robot ?from)))
    )
    
)
