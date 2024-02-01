
(define (domain fix-robot)

;remove requirements that are not needed
    (:requirements 
        :strips )

    (:predicates 
        (ROOM ?r) (OBJECT ?o) (GRIPPER ?g)(FIX ?rob)
        
        (can_fix ?ob ?g)(in ?room)
        (at_robot ?rob ?loc)(manca ?rob ?o)
        ; Final state in the robot
        (robot_fix ?rob)(different ?r1 ?r2)(fix_base ?rob)
    )
    
    (:action move
        :parameters (?from ?to)
        :precondition (and (ROOM ?from) (ROOM ?to) 
                        (in ?from))
        :effect (and (in ?to)(not (in ?from)) )
    )

    (:action fix
        :parameters (?o ?g ?loc ?rob)
        :precondition (and (ROOM ?loc)(GRIPPER ?g)(OBJECT ?o)(FIX ?rob)
                        (can_fix ?o ?g) (in ?loc)(manca ?rob ?o)(at_robot ?rob ?loc)
                        (fix_base ?rob))
        :effect (and (robot_fix ?rob))
    )
    
    (:action fix_special
        :parameters (?o1 ?g1 ?o2 ?g2 ?loc ?rob)
        :precondition (and (OBJECT ?o1)(GRIPPER ?g1)(OBJECT ?o2)(GRIPPER ?g2)
                        (ROOM ?loc)(FIX ?rob)
                        (can_fix ?o1 ?g1)(can_fix ?o2 ?g2)(different ?o1 ?o2)(different ?g1 ?g2)
                        (manca ?rob ?o1)(manca ?rob ?o2)(at_robot ?rob ?loc))
        :effect (and (robot_fix ?rob))
    )
    
    

)